;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               NOTMUCH              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; use "notmuch" and "notmuch new" for the initial startup
;; affew may be a useful addition

;; offlineimap fetches new mail and notmuch finds them locally
;; offlineimap -f INBOX only fetches new mails in the inbox

(use-package notmuch
  :defer t
  :general
  ("C-c w" 'notmuch)
  ;; (:keymaps 'notmuch-show-mode-map
  ;; 	    "S" (lambda ()
  ;; 		  "mark message as spam"
  ;; 		  (interactive)
  ;; 		  (notmuch-show-tag (list "+spam" "-inbox"))))
  ;; (:keymaps 'notmuch-search-mode-map
  ;; 	    "S" (lambda ()
  ;; 		  "mark message as spam"
  ;; 		  (interactive)
  ;; 		  (notmuch-search-tag (list "-inbox" "+spam"))
  ;; 		  (next-line)))
  :config
  ;; I will decide later which one I prefer
  ;; Options: 'sendmail-query-once, 'smtpmail-send-it

  ;; send mail
  (setq send-mail-function 'smtpmail-send-it)

  ;; fix message send error
  ;; (setq smtpmail-stream-type 'starttls) ;; did not serve
  (setq smtpmail-debug-info nil) ;; do not show debug trace
  
  (setq message-directory "mbsync")
  
  ;; setup the mail address and use name
  (setq mail-user-agent 'message-user-agent)

  ;; set sent mail directory
  ;; (setq notmuch-fcc-dirs "MailLocation/Sent")

  ;; Settings for main screen
  (setq notmuch-hello-hide-tags (quote ("killed")))

  ;; A few commonly used saved searches.
  (setq notmuch-saved-searches
	(quote
	 ((:name "inbox" :query "tag:inbox AND -tag:work" :key "i" :sort-order newest-first) ;; oldest-first
	  (:name "flagged" :query "tag:flagged" :key "f") ;; flagged messages
	  (:name "sent" :query "tag:sent -tag:work" :key "t" :sort-order newest-first)
	  (:name "drafts" :query "tag:draft" :key "d")
	  (:name "mailinglist" :query "tag:lists/mailinglistID" :key "c")
	  (:name "all mail" :query "*" :key "a" :sort-order newest-first)))))

;; Setup User-Agent header
;; (setq mail-specify-envelope-from t) ;; Settings to work with msmtp

;; (setq send-mail-function (quote sendmail-send-it))
;; (setq sendmail-program "~/.local/bin/msmtp-enqueue.sh"
;;       mail-specify-envelope-from t
;;       ;; needed for debians message.el cf. README.Debian.gz
;;       message-sendmail-f-is-evil nil
;;       mail-envelope-from 'header
;;       message-sendmail-envelope-from 'header)
