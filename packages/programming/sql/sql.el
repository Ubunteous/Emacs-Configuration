;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 SQL                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Most important functions are:
;; sql-list-*
;; sql-send-*

(use-package sql
  :ensure nil
  :defer t
  :init
  (defun sql-postgres-alter ()
	(interactive)
	(sql-connect 'pgsql-alter "*alter*"))

  (defun sql-setup-dirlocal-connection ()
	(interactive)
	(let ((type 'postgres)
		  (db (read-string "Database name: "))
		  (user (read-string "User: "))
		  (password (read-string "Password: ")))
	  (add-dir-local-variable 'sql-mode 'sql-connection-alist `((pgsql-default
																 (sql-product ,type)
																 (sql-database ,db)
																 (sql-port 5432)
																 (sql-server "/var/run/postgresql/")
																 (sql-user ,user)
																 (sql-password ,password))))))

  (defun sql-setup-pgpass ()
	;; run chmod 600 ~/.pgpass afterwards to remove warning
	(interactive)

	(let* ((pgpass-filename (concat "/home/" user-login-name "/.pgpass"))
		   (resize-mini-windows t) ; prevents initial prompt from leaving huge minibuffer for next prompts
		   (pgpass-exists-p (file-exists-p pgpass-filename)))
	  (when (or (not pgpass-exists-p)
				(yes-or-no-p (concat ".pgpass already exists at location: "
									 pgpass-filename
									 " with content:\n\n"
									 (with-temp-buffer (insert-file-contents pgpass-filename) (buffer-string)) ; see f-read
									 "\n\nAppend new entry?")))
		(let ((hostname "/var/run/postgresql")
			  (localhost "localhost")
			  (port "5432")
			  (database (read-string "Database: "))
			  (username (read-string "User: "))
			  (password (read-string "Password: ")))
		  (append-to-file (concat (when pgpass-exists-p "\n") hostname ":" port ":" database ":" username ":" password)
						  nil
						  pgpass-filename)
		  (append-to-file "\n" nil pgpass-filename)
		  (append-to-file (concat (when pgpass-exists-p "\n") localhost ":" port ":" database ":" username ":" password)
						  nil
						  pgpass-filename)))))

  ;; (defun chain-psql-commands (sql-connection-name commands)
  ;;	;; commands should not have backslashes (ex: '("dt" "dl"))
  ;;	(let* ((sql-connection (assoc sql-connection-name sql-connection-alist))
  ;;		   (user (cadr (assoc 'sql-user sql-connection)))
  ;;		   (dbname (cadr (assoc 'sql-database sql-connection))))
  ;;	  (shell-command-to-string
  ;;	   (concat "psql -U " user " --dbname=" dbname
  ;;			   (string-join (mapcar (lambda (x) (concat " -c \"" "\\" x "\"")) commands)
  ;;							" -c \"\\echo \\n\"")))))

  ;; (defun chain-psql-commands-alter (commands)
  ;;	(chain-psql-commands 'pgsql-alter commands))
  :config
  (setq sql-product 'postgres)

  ;; ;; multiple db can be setup with this variable
  ;; (setq sql-postgres-login-params
  ;;		'((user :default "postgres")
  ;;         (database :default "posttgres")
  ;;         (server :default "/var/run/postgresql") ;; no need for creds
  ;;         (port :default 5432)))

  ;; list of options for M-x sql-connect or sql-postgres
  (setq sql-connection-alist
		'((pgsql-default (sql-product 'postgres)
						 (sql-port 5432)
						 (sql-server "/var/run/postgresql")
						 (sql-user "postgres")
						 ;; (sql-password "")
						 (sql-database "postgres"))

		  (pgsql-alter (sql-product 'postgres)
					   (sql-port 5432)
					   (sql-server "/var/run/postgresql")
					   (sql-user "cynthia")
					   ;; (sql-password "") ; use .pgpass
					   (sql-database "alter"))))

  ;; ;; for SQLi if tables are too big
  ;; (add-hook 'sql-interactive-mode-hook
  ;;           (lambda ()
  ;;             (toggle-truncate-lines t)))

  ;; (transient-define-prefix psql-transient ()
  ;;	["psql"
  ;;	 ["tables"
  ;;	  ("d" "Databases" psql-get-databases)
  ;;	  ("t" "Tables" psql-get-tables)
  ;;	  ]
  ;;	 ["users"
  ;;	  ("u" "Users" psql-get-users)
  ;;	  ]
  ;;	 ])

  (defun psql-get-users ()
	(interactive)
	(sql-send-string "\\du\\echo \n"))

  (defun psql-get-tables ()
	(interactive)
	(sql-send-string "\\dt\\echo \n"))

  (defun psql-get-table-at-point-columns ()
	(interactive)
	(sql-send-string (concat "\\d " (thing-at-point 'word 'no-properties))))

  (defun psql-get-databases ()
	(interactive)
	(sql-send-string "\\l\\echo \n"))

  (defun sql-explain-region-as-json (beg end &optional copy) ; from purcell config
	"Explain the SQL between BEG and END in detailed JSON format.
This is suitable for pasting into tools such as
http://tatiyants.com/pev/.

When the prefix argument COPY is non-nil, do not display the
resulting JSON, but instead copy it to the kill ring.

If the region is not active, uses the current paragraph, as per
`sql-send-paragraph'.

Connection information is taken from the special sql-* variables
set in the current buffer, so you will usually want to start a
SQLi session first, or otherwise set `sql-database' etc.

This command currently blocks the UI, sorry."
	(interactive "rP")
	(unless (eq sql-product 'postgres)
	  (user-error "This command is for PostgreSQL only"))
	(unless (use-region-p)
	  (setq beg (save-excursion (backward-paragraph) (point))
			end (save-excursion (forward-paragraph) (point))))
	(let ((query (buffer-substring-no-properties beg end)))
	  (with-current-buffer (if (sql-buffer-live-p sql-buffer)
							   sql-buffer
							 (current-buffer))
		(let* ((process-environment
				(append (list (concat "PGDATABASE=" sql-database)
							  (concat "PGHOST=" sql-server)
							  (concat "PGUSER=" sql-user))
						process-environment))
			   (args (list "--no-psqlrc"
						   "-qAt"
						   "-w"             ; Never prompt for password
						   "-E"
						   "-c" (concat "EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON) " query ";")
						   ))
			   (err-file (make-temp-file "sql-explain-json")))
		  (with-current-buffer (get-buffer-create "*sql-explain-json*")
			(setq buffer-read-only nil)
			(delete-region (point-min) (point-max))
			(let ((retcode (apply 'call-process sql-postgres-program nil (list (current-buffer) err-file) nil args)))
			  (if (zerop retcode)
				  (progn
					(json-ts-mode)
					(if copy
						(progn
						  (kill-ring-save (buffer-substring-no-properties (point-min) (point-max)))
						  (message "EXPLAIN output copied to kill-ring."))
					  (view-buffer (current-buffer))))
				(with-current-buffer (get-buffer-create "*sql-explain-errors*")
				  (setq buffer-read-only nil)
				  (insert-file-contents err-file nil nil nil t)
				  (view-buffer (current-buffer))
				  (user-error "EXPLAIN failed")))))))))
  :bind
  (:map sql-mode-map
		("\"" . (lambda () (interactive) (insert ?\')))))

(use-package sqlup-mode
  :defer t
  :ensure (sqlup-mode :type git :host github :repo "Trevoke/sqlup-mode.el")
  :hook sql-mode)

(use-package sql-indent
  :defer t
  :config
  (setq sqlind-basic-offset 4)
  :hook (sql-mode . sqlind-minor-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; WORK WITH MULTIPLE DB ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defvar sql-connection-alist nil)

;; (defmacro sql-specify-connections (&rest connections)
;;   "Set the sql-connection-alist from CONNECTIONS.
;; Generates respective interactive functions to establish each
;; connection."
;;   `(progn
;;      ,@(mapcar (lambda (conn)
;;		 `(add-to-list 'sql-connection-alist ',conn))
;;		   connections)
;;      ,@(mapcar (lambda (conn)
;;		 (let* ((varname (car conn))
;;			(fn-name (intern (format "sql-connect-to-%s" varname)))
;;			(buf-name (format "*%s*" varname)))
;;		   `(defun ,fn-name ,'()
;;			  (interactive)
;;			  (sql-connect ',varname ,buf-name))))
;;		   connections)))


;; ;; use like this:
;; (sql-specify-connections
;;  (mytest-pgsql-dev (sql-product 'postgres)
;;		   (sql-port 5432)
;;		   (sql-server "localhost")
;;		   (sql-user "postgres")
;;		   (sql-password "password")
;;		   (sql-database "myapp_development"))
;;  (mytest-pgsql-test (sql-product 'postgres)
;;			(sql-port 5432)
;;			(sql-server "localhost")
;;			(sql-user "postgres")
;;			(sql-password "password")
;;			(sql-database "myapp_test")))
