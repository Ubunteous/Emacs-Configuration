;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               DIMMER               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; highlight current region
(use-package dimmer
  :defer t
  :init (dimmer-mode t)
  :config
  ;; (setq dimmer-fraction .3) ;; default 0.2
  (dimmer-configure-gnus)
  (dimmer-configure-hydra)
  (dimmer-configure-magit)
  (dimmer-configure-org)
  (dimmer-configure-which-key))
