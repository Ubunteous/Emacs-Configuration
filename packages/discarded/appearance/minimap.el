;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               MINIMAP              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package minimap
  :defer t
  :config
  (set-face-attribute 'minimap-active-region-background nil :background "Brown")

  (setq minimap-minimum-width 10
		minimap-width-fraction 0.1
		minimap-window-location "right"))
