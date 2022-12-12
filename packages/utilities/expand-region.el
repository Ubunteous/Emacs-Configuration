;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           EXPAND-REGION            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Note: pressing 0 or C-g stops the expansion
;; Note: expand region has its own repeat map (=)

(use-package expand-region
  :defer t
  :general ("C-=" 'er/expand-region))
