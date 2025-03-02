;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            ADAPTIVE-WRAP           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; line wrap follows first line's indentation
(use-package adaptive-wrap
  :ensure (:type git :host github :repo "emacsmirror/adaptive-wrap")
  :defer t
  :hook (visual-line-mode . adaptive-wrap-prefix-mode))
