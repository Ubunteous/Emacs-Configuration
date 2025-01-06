;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                SCSS                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package scss-mode
  :ensure nil
  :defer t
  :general
  (:keymaps 'scss-mode-map
	    "RET" 'smart-insert-semicolon
	    "SPC" 'smart-insert-colon))
