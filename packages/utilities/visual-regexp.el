;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           VISUAL REGEXP            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package visual-regexp
  :defer t
  :init
  (defvar-keymap visual-regexp-keymap
	:doc "Keymap for visual regexp.")
  :general
  (:keymaps 'mode-specific-map
			"v" (cons "visual-regexp" visual-regexp-keymap))

  (:keymaps 'visual-regexp-keymap
			"e" 'vr/replace
			"q" 'vr/query-replace
			"m" 'vr/mc-mark))

(use-package visual-regexp-steroids
  :defer t
  :general
  (:keymaps 'visual-regexp-keymap
			"s" 'vr/isearch-forward
			"r" 'vr/isearch-backward))
