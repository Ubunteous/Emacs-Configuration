;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                CAPE                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package cape
  :defer t
  ;; Bind dedicated completion commands
  ;; Alternative prefix keys: C-c p, M-p, M-+, ...
  :general
  (:prefix "C-c z"
	   "p" 'completion-at-point ;; capf
	   ;; "t" 'complete-tag ;; etags
	   "d" 'cape-dabbrev ;; or dabbrev-completion
	   "h" 'cape-history
	   "f" 'cape-file
	   "k" 'cape-keyword
	   ;; "s" 'cape-symbol
	   "a" 'cape-abbrev
	   "i" 'cape-ispell
	   "l" 'cape-line
	   "w" 'cape-dict ;; /usr/share/dict/words or $WORDLIST
	   "\\" 'cape-tex
	   "_" 'cape-tex
	   "^" 'cape-tex
	   ;; "&" 'cape-sgml ;; unicode
	   ;; "r" 'cape-rfc1345 ;; unicode
	   )
  :init
  ;; make cape available on <tab> on startup
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
  :config
  ;; Add extensions
  ;; Add completion-at-point-functions, used by completion-at-point.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  ;;(add-to-list 'completion-at-point-functions #'cape-history)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-tex)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-ispell)
  (add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)

  ;; to use corfu with lsp. less performant (slow lookups if many options)
  ;; (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)
  
  (setq cape-dict-file (getenv "WORDLIST")))
