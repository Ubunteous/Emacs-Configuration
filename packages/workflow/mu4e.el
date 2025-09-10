;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                MU4E                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Documentation:
;; https://www.djcbsoftware.nl/code/mu/mu4e/
;; Gmail setup: https://www.djcbsoftware.nl/code/mu/mu4e/Gmail-configuration.html

;; Dependencies:
;; + make sure you have installed mu
;; + use offlineimap to get emails
;; - When using IMAP, enable it in the Gmail web interface (Settings > “Forwarding and POP/IMAP”)
;; - secure gmail password from here: https://security.google.com/settings/security/apppasswords
;; + get smtpmail to send messages

;; Home manager options:
;; programs.offlineimap (enable)
;; accounts.email.accounts.<name>.offlineimap

;; Finally:
;; + run mu init in terminal
;; + Setup .authinfo with machine XXX login XXX port XXX password XXX (credentials asked first time sending a mail with mu4e)

;; Troubleshooting:
;; Once in a while try, mu init --maildir ~/Maildir/

(use-package mu4e
  ;; :straight (:local-repo "/run/current-system/sw/share/emacs/site-lisp/mu4e" :type built-in) ;; nixos compatible
  ;; :local-repo path to "~/.nix-profile/share/emacs/site-lisp/mu4e" should work with home manager

  :ensure nil
  ;; :commands (mu4e)
  :general
  ("C-c m" 'mu4e)
  :config
  ;; use mu4e for e-mail in emacs
  (setq mail-user-agent 'mu4e-user-agent)

  (setq mu4e-drafts-folder "/[Gmail].Drafts")
  (setq mu4e-sent-folder   "/[Gmail].Sent Mail")
  (setq mu4e-trash-folder  "/[Gmail].Trash") ;; rename dir later in English
  ;; (setq mu4e-refile-folder "/archive")

  ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
  (setq mu4e-sent-messages-behavior 'delete)

  ;; (See the documentation for `mu4e-sent-messages-behavior' if you have
  ;; additional non-Gmail addresses and want assign them different
  ;; behavior.)

  ;; setup some handy shortcuts
  ;; you can quickly switch to your Inbox -- press ``ji''
  ;; then, when you want archive some messages, move them to
  ;; the 'All Mail' folder by pressing ``ma''.

  ;; (setq send-mail-function 'sendmail-send-it)
  
  (setq mu4e-maildir-shortcuts
		'( (:maildir "/INBOX"              :key ?i)
		   (:maildir "/[Gmail].Sent Mail"  :key ?s)
		   (:maildir "/[Gmail].Trash"      :key ?t)
		   (:maildir "/[Gmail].All Mail"   :key ?a)))

  ;; allow for updating mail using 'U' in the main view:
  ;; (setq mu4e-get-mail-command "offlineimap")
  (setq mu4e-get-mail-command "offlineimap -f INBOX")

  (setq mu4e-update-interval 3600) ;; hourly update
  ;; (setq mu4e-index-update-in-background nil) ;; default is t

  ;; something about ourselves
  (setq mu4e-compose-signature "Best regards,\nPierre")

  ;; show related messages
  (setq mu4e-headers-include-related t)

  ;; no prompt when leaving
  (setq mu4e-confirm-quit nil)
  
  ;; misc
  ;; (setq mu4e-mu-binary (executable-find "mu")) ;; not needed here
  ;; (setq mu4e-maildir "~/.maildir"))) ;; does not seem to exist. maybe use mu4e-maildir-list instead
  
  ;; no duplicates
  (setq mu4e-headers-skip-duplicates t))
