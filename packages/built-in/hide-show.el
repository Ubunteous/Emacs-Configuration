;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              HIDE-SHOW             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package hs-mode
  :ensure nil
  :defer t
  :init
  (defvar-keymap hideshow-keymap
	:doc "Keymap for code folding.")
  (define-key personal-misc-bindings-keymap (kbd "h") hideshow-keymap)
  (which-key-add-keymap-based-replacements personal-misc-bindings-keymap "h" "hs")

  ;; :config
  ;; (setq hs-headline nil)
  ;; (setq hs-hide-comments-when-hiding-all t)
  ;; (setq hs-allow-nesting nil)
  :bind
  (:map hideshow-keymap
		("a" . hs-hide-all)
		("A" . hs-show-all)
		("b" . hs-hide-block)
		("B" . hs-show-block)
		("h" . hs-toggle-hiding)
		("i" . hs-hide-initial-comment-block)
		("l" . hs-hide-level)
		("t" . hs-toggle-hiding))

  (:map mode-specific-map
		("@" . hideshow-keymap))

  (:map personal-misc-bindings-keymap
		("C-h" . hs-toggle-hiding))
  :hook
  (prog-mode . hs-minor-mode))
