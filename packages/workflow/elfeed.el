;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               ELFEED               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package elfeed
  :defer t
  :general
  ("C-x w" 'elfeed)
  :config
  ;; my feeds
  (setq elfeed-feeds
	'(("https://www.masteringemacs.org/" emacs)
	  ("https://www.reddit.com/r/emacs.rss" emacs)))
  
  ;; "Queue timeout exceeded" errors dealt with increased timeout
  ;; (setq elfeed-set-timeout ?)
  ;; (setf url-queue-timeout 30)
  :hook
  ;; Entries older than 2 weeks are marked as read
  (elfeed-new-entry . (lambda () elfeed-make-tagger :before "2 weeks ago"
			:remove 'unread)))

;; ;; Entries older than 2 weeks are marked as read
;; (add-hook 'elfeed-new-entry-hook
;;           (elfeed-make-tagger :before "2 weeks ago"
;;                               :remove 'unread))
