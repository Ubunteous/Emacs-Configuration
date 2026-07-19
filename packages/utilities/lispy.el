;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                LISPY               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package lispy
  :defer t
  :ensure (lispy :type git :host github :repo "enzuru/lispy") ;; abo abo repo unmaintained
  :config
  (setq lispy-do-fill t) ;; lispy-insert-1 will try to fill
  (setq lispy-overlay t)
  ;; (setq lispy-avy-keys ?)
  ;; (setq lispy-hint-pos ?)
  (setq lispy-no-space t)
  ;; ignore unbalanced limiter
  ;; (setq lispy-safe-copy t)
  ;; (setq lispy-safe-paste t)
  ;; (setq lispy-safe-delete t)
  ;; (setq lispy-safe-actions-ignore-strings t)
  ;; (setq lispy-safe-actions-ignore-comments t)
  ;; (setq lispy-meol-point 0)
  ;; (setq lispy-avy-style-paren 'at)
  (setq lispy-teleport-global t) ;; allow moving to other blocks
  (setq lispy-completion-method 'Ido) ;; default to ivy. not sure if vertico works
  (setq lispy-close-quotes-at-end-p t)
  ;; (setq lispy-no-permanent-semantic nil) ;; do not toggle semantic-mode
  ;; (setq lispy-delete-sexp-from-within nil)
  ;; (setq lispy-insert-space-after-wrap t)
  ;; (setq lispy-back-restore-restriction t)
  ;; (setq lispy-comment-use-single-semicolon t) ;; single ; at right

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
  ;; :hook emacs-lisp-mode ;; handled by lispy-cat
  )

(use-package lispy-cat
  :ensure (lispy-cat :type git :host github :repo "ventruvian/lispy-cat")
  :defer t
  ;; :after meow
  :config
  (setq lispy-cat-cursor-type-default 'bar)
  (setq lispy-cat-cursor-type-special 'hollow)

  ;; (setq lispy-cat-open-cmds-prefer-lispy-p t) ; enter LISPY when opening a newline
  ;; (setq lispy-cat-beacon-prefer-lispy-p	nil) ; enter LISPY when in BEACON state (cursor behaviour unpredictable)
  ;; (setq lispy-cat-preserve-selection-on-entry-p	t) ; keep selection active when entering LISPY state

  ;; ;; Choose whatever keybinding fits your config or disregard this command entirely.
  ;; ;; Lispy still uses the old `define-key' so remapping is done with vector notation.
  ;; (lispy-define-key lispy-mode-map [remap lispy-kill] #'lispy-cat-kill-dwim))
  ;; :hook (emacs-lisp-mode . lispy-cat-mode) ;; slow start up
  )
