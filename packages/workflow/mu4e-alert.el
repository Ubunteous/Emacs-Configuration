;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             MU4E-ALERT             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package mu4e-alert
  :defer t
  ;; :init
  ;; (mu4e-alert-enable-mode-line-display)
  ;; (mu4e-alert-enable-notifications)
  :config
  ;; Choose the style you prefer for desktop notifications
  ;; If you are on Linux you can use
  ;; 1. notifications - Emacs lisp implementation of the Desktop Notifications API
  ;; 2. libnotify     - Notifications using the `notify-send' program, requires `notify-send' to be in PATH
  ;; (setq mu4e-alert-set-default-style 'libnotify) ;; notifications
  (mu4e-alert-set-default-style 'notifications) ;; notifications => will maybe need to put it in :init section
  ;; (setq mu4e-alert-disable-notifications nil)

  ;; (setq mu4e-alert-email-count-title ?) ;; title format
  ;; (setq mu4e-alert-email-count-notification-formatter ?) ;; body format

  ;; only show number of unread mails
  ;; (setq mu4e-alert-email-notification-types '(count))

  ;; example config to avoid "/[Gmail].All Mail"
  ;; (setq mu4e-alert-interesting-mail-query
  ;; 	(concat
  ;; 	 "flag:unread"
  ;; 	 " AND NOT flag:trashed"
  ;; 	 " AND NOT maildir:"
  ;; 	 "\"/[Gmail].All Mail\""))
  )
