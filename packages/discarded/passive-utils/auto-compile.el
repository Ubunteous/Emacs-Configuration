;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            AUTO-COMPILE            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (add-to-list 'load-path "~/files/straight/straight/build/")
;; (add-to-list 'load-path "/path/to/auto-compile")

(use-package auto-compile
  :config
  (setq load-prefer-newer t)

  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode)

  (setq auto-compile-display-buffer nil)
  (setq auto-compile-mode-line-counter t))
