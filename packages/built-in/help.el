;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                HELP                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package dired
  :defer t
  :ensure nil
  :general
  (:keymaps 'helpful-mode-map
			"n" 'next-line
			"C-n" 'help-goto-next-page
			"p" 'previous-line
			"C-p" 'help-goto-previous-page))
