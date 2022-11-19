;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               MINIMAP              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package minimap
  :defer t
  :custom-face
  (minimap-active-region-background ((t (:background "Brown"))))
  :config
  (setq minimap-minimum-width 10
	minimap-width-fraction 0.1
	minimap-window-location "right"))
