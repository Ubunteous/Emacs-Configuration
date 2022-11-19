;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           SYMBOL-OVERLAY           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package symbol-overlay
  :defer t
  :general
  ("M-i" 'symbol-overlay-put)
  ("M-n" 'symbol-overlay-switch-forward)
  ("M-p" 'symbol-overlay-switch-backward)
  ("<f7>" 'symbol-overlay-mode)
  ("<f8>" 'symbol-overlay-remove-all)
  ("M-v" 'symbol-overlay-map))


