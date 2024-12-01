;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               PGMACS               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package pgmacs
  :ensure (pgmacs :type git :host github :repo "emarsden/pgmacs")
  :defer t
  :config
  ;; Options: host, hostaddr, port, dbname, user, password
  (defun pgmacs-open-maindb () (interactive)
	 (pgmacs-open-string
	  "dbname=mydb user=pgmacs_readonly_user host=localhost password=change")))

