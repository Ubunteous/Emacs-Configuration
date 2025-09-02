;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               FLYOVER              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package flyover
  :ensure (flyover :type git :host github :repo "konrad1977/flyover")
  :defer t
  :after (flycheck flymake)
  :config
  (setq flyover-levels '(error warning info))
  (setq flyover-use-theme-colors t)

  ;; VISIBILITY
  ;; (setq flyover-hide-checker-name t)
  (setq flyover-show-at-eol nil)
  ;; (setq flyover-hide-when-cursor-is-on-same-line t)
  ;; (setq flyover-show-virtual-line t)

  ;; ARROW
  (setq flyover-virtual-line-type 'straight-arrow)
  ;; (setq flyover-virtual-line-icon "╰──") ;;; default its nil

  ;; ICON
  ;; (setq flyover-info-icon "🛈")
  ;; (setq flyover-warning-icon "⚠")
  ;; (setq flyover-error-icon "✘")
  ;; (setq flyover-icon-left-padding 0.9)
  ;; (setq flyover-icon-right-padding 0.9)

  ;; (setq flyover-wrap-messages t)
  ;; (setq flyover-max-line-length 80)

  (setq flyover-line-position-offset 0) ;; nb lines below incorrect line
  ;; (setq flyover-debounce-interval 0.2) ;; delay before update's
  ;; (setq flyover-checkers '(flycheck flymake))

  ;; (setq flyover-debug nil)

  ;; (setq flyover-background-lightness 45)
  ;; (setq flyover-percent-darker 40)
  ;; (setq flyover-text-tint 'lighter) ;; or 'darker or nil
  ;; (setq flyover-text-tint-percent 50)
  :hook flycheck-mode)
