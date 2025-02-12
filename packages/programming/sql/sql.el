;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 SQL                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package sql
  :ensure nil
  :defer t
  :config
  (setq sql-product 'postgres)

  ;; multiple db can be setup with this variable
  (setq sql-postgres-login-params
	'((user :default "postgres")
          (database :default "mydb")
          (server :default "/var/run/postgresql") ;; no need for creds
          (port :default 5432)))

  ;; list of options for M-x sql-connect or sql-postgres
  (setq sql-connection-alist
	'((pgsql-default (sql-product 'postgres)
			 (sql-port 5432)
			 (sql-server "/var/run/postgresql")
			 (sql-user "postgres")
			 (sql-password "")
			 (sql-database "postgres"))

          (pgsql-mydb (sql-product 'postgres)
                      (sql-port 5432)
                      (sql-server "/var/run/postgresql")
                      (sql-user "postgres")
                      (sql-password "")
                      (sql-database "mydb"))))

  ;; ;; for SQLi if tables are too big
  ;; (add-hook 'sql-interactive-mode-hook
  ;;           (lambda ()
  ;;             (toggle-truncate-lines t)))

  (defun sql-connect-to-pqsql-mydb ()
    (interactive)
    (sql-connect 'pgsql-mydb "*pgsql-mydb*"))
  :general
  (:keymaps 'sql-mode-map
	    "\"" '(lambda () (interactive) (insert ?\'))))

(use-package sqlup-mode
  :defer t
  :ensure (sqlup-mode :type git :host github :repo "Trevoke/sqlup-mode.el")
  :hook sql-mode)

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
;; 		 `(add-to-list 'sql-connection-alist ',conn))
;; 	       connections)
;;      ,@(mapcar (lambda (conn)
;; 		 (let* ((varname (car conn))
;; 			(fn-name (intern (format "sql-connect-to-%s" varname)))
;; 			(buf-name (format "*%s*" varname)))
;; 		   `(defun ,fn-name ,'()
;; 		      (interactive)
;; 		      (sql-connect ',varname ,buf-name))))
;; 	       connections)))


;; ;; use like this:
;; (sql-specify-connections
;;  (mytest-pgsql-dev (sql-product 'postgres)
;; 		   (sql-port 5432)
;; 		   (sql-server "localhost")
;; 		   (sql-user "postgres")
;; 		   (sql-password "password")
;; 		   (sql-database "myapp_development"))
;;  (mytest-pgsql-test (sql-product 'postgres)
;; 		    (sql-port 5432)
;; 		    (sql-server "localhost")
;; 		    (sql-user "postgres")
;; 		    (sql-password "password")
;; 		    (sql-database "myapp_test")))
