;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             COMPLETION             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package hippie
  :defer t
  :straight (:type built-in)
  :general
  ("M-:" 'hippie-expand
   "M-/" 'eval-expression))

  ;; :config
  ;; Most of these variables will be introduced in emacs 29
  ;; (setq completions-format 'one-column)
  ;; (setq completions-header-format nil)
  ;; (setq completions-max-height 20)
  ;; (setq completions-auto-select nil)
  ;; )

;; Use Dabbrev with Corfu! => don't, hippie is better
;; (use-package dabbrev
;;   :straight (:type built-in)
;;   ;; Swap M-/ and C-M-/
;;   :general
;;   ("M-:" 'dabbrev-completion
;;    "C-M-:" 'dabbrev-expand
;;    "M-/" 'eval-expression)
;;   ;; Other useful Dabbrev configurations.
;;   :custom
;;   (dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\)\\'")))
