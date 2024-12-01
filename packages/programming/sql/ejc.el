;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 EJC                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; needs lein
(use-package ejc-sql
  :defer t
  :config
  (setq clomacs-httpd-default-port 8090) ; Use a port other than 8080

  ;; PostgreSQL connection
  (ejc-create-connection
   "PostgreSQL-db-connection"
   ;; :classpath (concat "~/.m2/repository/org.postgresql/postgresql/42.6.0/"
   ;; "postgresql-42.6.0.jar")
   :subprotocol "postgresql"
   :subname "//localhost:5432/mydb"
   :user "postgres"
   :password "")

  (ejc-create-connection
   "PostgreSQL-db-connection"
   :dependencies [[org.postgresql/postgresql "42.7.4"]]
   :subprotocol "postgresql"
   :subname "//localhost:5432/mydb"
   :user "pgmacs_readonly_user"
   :password "change") ;; password needed unless psql conf changed

  ;; (setq ejc-org-mode-show-results nil)
  
  ;; avoid early nrepl launch
  ;; (add-hook 'ejc-sql-connected-hook
  ;;           (lambda ()
  ;;             (ejc-set-fetch-size 50)
  ;;             (ejc-set-max-rows 50)
  ;;             (ejc-set-show-too-many-rows-message t)
  ;;             (ejc-set-column-width-limit 25)
  ;;             (ejc-set-use-unicode t)))

  :hook ((sql-mode . (lambda () (ejc-connect "PostgreSQL-db-connection")))
	 (ejc-sql-minor-mode . (lambda () (ejc-eldoc-setup)))))

(use-package auto-complete
  :defer t
  :hook ejc-sql-minor-mode)

(use-package ejc-autocomplete
  :defer t
  :ensure nil
  ;; :after ejc-sql auto-complete
  :hook
  (ejc-sql-minor-mode . (lambda ()
			  ;; (auto-complete-mode t)
			  (ejc-ac-setup))))

;; (use-package flx
;;   :defer t)

(use-package flx-ido
  :defer t)

(use-package ejc-flx
  :defer t
  :ensure nil
  ;; :after ejc-sql flx-ido
  :config
  (setq ejc-use-flx t)
  (setq ejc-flx-threshold 2)
  (setq ejc-completion-system 'ido)) ;; 'ido)
