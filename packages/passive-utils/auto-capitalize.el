;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            AUTO-CAPITALIZE         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package auto-capitalize
  :defer t
  :straight
  (auto-capitalize :type git :host github :repo "yuutayamada/auto-capitalize-el")
  :hook (LaTeX-mode . auto-capitalize-mode)
  :config
  (setq auto-capitalize-words `("I" "English")))

;; :hook (after-change-major-mode . auto-capitalize-mode))
