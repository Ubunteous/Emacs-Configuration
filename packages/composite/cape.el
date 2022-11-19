;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                CAPE                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Add extensions
(use-package cape
  :defer t
  ;; Bind dedicated completion commands
  ;; Alternative prefix keys: C-c p, M-p, M-+, ...
  :general
  (:prefix "C-c n"
	   "p" 'completion-at-point ;; capf
	   "t" 'complete-tag ;; etags
	   "d" 'cape-dabbrev ;; or dabbrev-completion
	   "h" 'cape-history
	   "f" 'cape-file
	   "k" 'cape-keyword
	   "s" 'cape-symbol
	   "a" 'cape-abbrev
	   "i" 'cape-ispell
	   "l" 'cape-line
	   "w" 'cape-dict
	   "\\" 'cape-tex
	   "_" 'cape-tex
	   "^" 'cape-tex
	   "&" 'cape-sgml
	   "r" 'cape-rfc1345)
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  ;;(add-to-list 'completion-at-point-functions #'cape-history)
  ;;(add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-tex)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-ispell)
  ;;(add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)
  )


