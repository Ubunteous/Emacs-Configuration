;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                LISPY               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package lispy
  :defer t
  :ensure (lispy :type git :host github :repo "enzuru/lispy") ;; abo abo repo unmaintained
  :commands (lispy-mode)
  ;; :config
  ;; (setq lispy-avy-keys ...)
  ;; (setq lispy-compat '(meow-normal-mode meow-global-mode cider))
  ;; :hook prog-mode)
  :general ("C-l" 'lispy-mode))
