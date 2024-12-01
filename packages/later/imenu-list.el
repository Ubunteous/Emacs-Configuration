;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             IMENU-LIST             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package imenu-list
  :defer t
  :general ("C-'" 'imenu-list-smart-toggle)
  :config
  (setq imenu-list-focus-after-activation t
	imenu-list-auto-resize t
	imenu-list-after-jump-hook nil))
