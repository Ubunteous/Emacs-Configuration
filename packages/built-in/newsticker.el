;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             NEWSTICKER             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package newsticker
  :defer t
  :ensure nil
  ;; :straight (:type built-in)
  :general
  ("C-c w" 'newsticker-treeview)
  :init
  (setq newsticker-url-list-defaults nil) ;; optionally add nil 3600 after an url
  (setq newsticker-url-list '(("Mastering emacs" "http://www.masteringemacs.org/feed")
			      ("r/emacs" "https://www.reddit.com/r/emacs.rss")))
  :config
  (setq newsticker-retrieval-method 'extern))
;; newsticker-frontend treeview
;;     (setq newsticker-frontend 'newsticker-plainview)
