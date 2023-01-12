;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              HIDE-SHOW             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package hs-mode
  :straight (:type built-in)
  :defer t
  :general
  ;; code folding
  ("C-c f" 'hs-toggle-hiding)
  :hook
  (prog-mode . hs-minor-mode))
