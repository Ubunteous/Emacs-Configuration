;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                HELP                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package help
  :defer t
  :ensure nil
  :general
  (:keymaps 'help-mode-map
			"n" 'next-line
			"C-n" 'help-goto-next-page
			"p" 'previous-line
			"C-p" 'help-goto-previous-page))
