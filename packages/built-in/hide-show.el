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
  (:keymaps 'hideshow-keymap
			"h" 'hs-hide-block
			"H" 'hs-hide-all
			"i" 'hs-hide-initial-comment-block
			"l" 'hs-hide-level
			"s" 'hs-show-block
			"S" 'hs-show-all
			"t" 'hs-toggle-hiding)

  (:keymaps 'personal
			"h" hideshow-keymap
			"C-h" 'hs-toggle-hiding)
  :hook
  (prog-mode . hs-minor-mode))
