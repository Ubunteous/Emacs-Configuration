;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                WGREP               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package wgrep
  :defer t
  :config
  (setq wgrep-auto-save-buffer t)
  ;; change default key binding to switch to wgrep
  ;; (setq wgrep-enable-key "r")
  ;; apply all changes even if read-only
  ;; (setq wgrep-change-readonly-file t)
  )
