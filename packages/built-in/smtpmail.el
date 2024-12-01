;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              SMTPMAIL              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; gpg --gen-key
;; gpg --list-secret-keys

;; gpg --full-generate-key

;; may require 'gnutls-bin' in Debian/Ubuntu

(use-package smtpmail
  :defer t
  :ensure nil
  ;; :straight (:type built-in)
  :config
  ;; debug issues with authinfo
  (setq auth-source-debug t)

  (setq user-mail-address "pierredemetz999@gmail.com"
	user-full-name  "Pierre")

  ;; report problems with the smtp server
  (setq smtpmail-debug-info t)

  ;; (setq message-send-mail-function 'message-smtpmail-send-it)
  (setq message-send-mail-function 'smtpmail-send-it
	starttls-use-gnutls t
	smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
	smtpmail-authx-credentials
	'(("smtp.gmail.com" 587 "pierredemetz999@gmail.com" nil))
	smtpmail-default-smtp-server "smtp.gmail.com"
	smtpmail-smtp-server "smtp.gmail.com"
	smtpmail-smtp-service 587)

  ;; tell message-mode how to send mail
  (setq message-send-mail-function 'smtpmail-send-it)
  ;; if our mail server lives at smtp.example.org; if you have a local
  ;; mail-server, simply use 'localhost' here.
  ;; (setq smtpmail-smtp-server "smtp.example.org")
  (setq smtpmail-smtp-server "smtp.gmail.com")

  ;; add Cc and Bcc headers to the message buffer
  ;; (setq message-default-mail-headers "Cc: \nBcc: \n")

  ;; postponed message is put in the following draft directory
  ;; (setq message-auto-save-directory "~/mail/draft")

  ;; change the directory to store the sent mail
  ;; (setq message-directory "~/mail/")

  ;; don't keep message buffers around
  (setq message-kill-buffer-on-exit t))
