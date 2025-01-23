;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 CSS                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package css-mode
  :ensure nil
  :defer t
  :general
  (:keymaps 'css-mode-map
	    "RET" 'smart-insert-semicolon
	    "SPC" 'smart-insert-colon))
