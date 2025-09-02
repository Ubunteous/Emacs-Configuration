;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                LISPY               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package lispy
  :defer t
  :ensure (lispy :type git :host github :repo "enzuru/lispy") ;; abo abo repo unmaintained
  :config
  ;; (setq lispy-avy-keys ...)
  ;; (setq lispy-compat '(meow-normal-mode meow-global-mode cider))

  ;; ;; replace a global binding with own function
  ;; (define-key lispy-mode-map (kbd "C-e") 'my-custom-eol)
  ;; ;; replace a global binding with major-mode's default
  ;; (define-key lispy-mode-map (kbd "C-j") nil)

  ;; replace local bindings
  (lispy-define-key lispy-mode-map "h" 'special-lispy-mark-list)
  (lispy-define-key lispy-mode-map "j" 'special-lispy-new-copy)
  (lispy-define-key lispy-mode-map "k" 'special-lispy-eval)
  (lispy-define-key lispy-mode-map "l" 'special-lispy-tab)
  (lispy-define-key lispy-mode-map "m" 'lispy-left)
  (lispy-define-key lispy-mode-map "n" 'lispy-down)
  (lispy-define-key lispy-mode-map "e" 'lispy-up)
  (lispy-define-key lispy-mode-map "i" 'lispy-right)
  :hook emacs-lisp-mode)
