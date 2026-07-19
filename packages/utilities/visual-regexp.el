;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           VISUAL REGEXP            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package visual-regexp
  :defer t
  :init
  (defvar-subkeymap mode-specific-map "v" visual-regexp-keymap "Keymap for visual regexp.")
  :bind
  (:map visual-regexp-keymap
		("e" . vr/replace)
		("q" . vr/query-replace)
		("m" . vr/mc-mark)))

(use-package visual-regexp-steroids
  :defer t
  :bind
  (:map visual-regexp-keymap
		("s" . vr/isearch-forward)
		("r" . vr/isearch-backward)))
