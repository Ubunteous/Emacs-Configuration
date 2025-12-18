;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              HIDE-SHOW             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package hs-mode
  :ensure nil
  :defer t
  :init
  (defvar-keymap hideshow-keymap
	:doc "Keymap for code folding.")
  ;; :config
  ;; (setq hs-headline nil)
  ;; (setq hs-hide-comments-when-hiding-all t)
  ;; (setq hs-allow-nesting nil)
  :general
  ("C-c h" hideshow-keymap)
  (:keymaps 'hideshow-keymap
			"b" 'hs-show-block
			"d" 'hs-hide-block
			"h" 'hs-hide-all
			"a" 'hs-show-all
			"l" 'hs-hide-level
			"t" 'hs-toggle-hiding
			"i" 'hs-hide-initial-comment-block)
  :hook
  (prog-mode . hs-minor-mode))
