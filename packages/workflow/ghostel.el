;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               GHOSTEL              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ghostel
  :defer t
  ;; :config
  ;; (setq ghostel-line-spacing 0)
  ;; ghostel-spinner-type => progress-bar, horizontal-moving, vertical-breathing
  :hook (ghostel-mode . completion-preview-mode))
