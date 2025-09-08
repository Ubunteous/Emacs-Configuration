;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           EXPAND-REGION            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Note: pressing 0 or C-g stops the expansion
;; Note: expand region has its own repeat map (=)

(use-package expand-region
  :defer t
  :config
  (setq expand-region-smart-cursor t)
  ;; (setq expand-region-subword-enabled nil)
  :general ("C-=" 'er/expand-region))
