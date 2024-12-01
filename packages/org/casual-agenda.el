;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            CASUAL-AGENDA           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package casual-agenda
  :ensure t
  :general
  (:keymaps 'org-agenda-mode-map
	    "C-o" 'casual-agenda-tmenu
	    "M-j" 'org-agenda-clock-goto
	    "J" 'bookmark-jump))
