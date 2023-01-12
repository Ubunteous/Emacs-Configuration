;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             WHICH KEY              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; which-key helper
(use-package which-key
  :defer t
  :general
  (:keymaps 'which-key-mode-map
	    ;; with bindings starting wit C-x, use SPC to cycle
	    "C-x §" 'which-key-show-next-page-cycle ;; cannot use space as it shadows rectangle-mode
	    "C-c SPC" 'which-key-show-next-page-cycle)
  :init
  (which-key-mode)
  :config
  ;; Allow C-h to trigger which-key before it is done automatically
  (setq which-key-show-early-on-C-h t)

  (setq which-key-use-C-h-commands nil)

  ;; control where which-key appears (bottom or minibuffer)
  (which-key-setup-side-window-bottom)
  ;; (minibuffer-key-setup-minibuffer)

  ;; default
  ;; (setq which-key-sort-order 'which-key-key-order)
  ;; same as default, except all keys from local maps shown first
  (setq which-key-sort-order 'which-key-local-then-key-order)

  ;; make sure which-key doesn't show normally but refreshes quickly after it is triggered
  (setq which-key-idle-delay 10000)
  (setq which-key-idle-secondary-delay 0.05))
