;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              WHICH-KEY             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; which-key helper
(use-package which-key
  :ensure nil
  :defer t
  :config
  ;; built-in
  (which-key-add-keymap-based-replacements ctl-x-map "4" "other-window")
  (which-key-add-keymap-based-replacements ctl-x-map "5" "other-frame")
  ;; "6"2C-command" 2C-mode-map) ; breaks renamming if used
  ;; "8"  ; no map
  (which-key-add-keymap-based-replacements ctl-x-map "a" "abbrev") ; (i prefix for inverse addition to abbrev mode)
  (which-key-add-keymap-based-replacements ctl-x-map "n" "narrow")
  (which-key-add-keymap-based-replacements ctl-x-map "p" "project")
  (which-key-add-keymap-based-replacements ctl-x-map "r" "rect/register")
  (which-key-add-keymap-based-replacements ctl-x-map "t" "tab") ; (^ prefix to detach)
  (which-key-add-keymap-based-replacements ctl-x-map "v" "vc") ; (prefixes b for branches and M for merge base)
  (which-key-add-keymap-based-replacements ctl-x-map "w" "window") ; (^ prefix to tear/detach)
  (which-key-add-keymap-based-replacements ctl-x-map "x" "buffer")
  (which-key-add-keymap-based-replacements ctl-x-map "RET" "encoding")
  :bind
  (:map which-key-C-h-map
		("C-n" . which-key-show-next-page-cycle) ;; cannot use space as it shadows rectangle-mode
		("C-p" . which-key-show-previous-page-cycle))
  :init
  (which-key-mode)
  :config
  ;; echo (default), left, top, nil
  ;; (setq which-key-show-prefix 'echo)

  ;; (setq which-key-show-docstrings nil)
  ;; (setq which-key-show-remaining-keys nil)
  (setq which-key-show-transient-maps t)

  ;; Allow C-h to trigger which-key before it is done automatically
  (setq which-key-show-early-on-C-h t)

  ;; control where which-key appears (bottom or minibuffer)
  (which-key-setup-side-window-bottom)
  ;; (minibuffer-key-setup-minibuffer)

  ;; sort (default)
  ;; (setq which-key-sort-order 'which-key-key-order)

  ;; sort (local): same as default, except all keys from local maps shown first
  ;; (setq which-key-sort-order 'which-key-local-then-key-order)

  ;; ;; sort (evil)
  ;; (defsubst which-key-key-order-evil (acons bcons)
  ;;   (which-key--key-description< (car bcons) (car acons)))
  ;; (setq which-key-sort-order 'which-key-key-order-evil)
  (setq which-key-sort-order 'which-key-prefix-then-key-order)
  (setq which-key-sort-uppercase-first nil)

  ;; WITH EVIL
  (setq which-key-allow-evil-operators t
		which-key-show-operator-state-maps t
		which-key-idle-delay 1
		which-key-use-C-h-commands t) ;; use C-h to cycle pages

  ;; WITHOUT EVIL
  ;; make sure which-key doesn't show normally but refreshes quickly after it is triggered
  ;; (setq which-key-idle-delay 10000)
  ;; (setq which-key-use-C-h-commands nil)

  (setq which-key-idle-secondary-delay 0.05))
