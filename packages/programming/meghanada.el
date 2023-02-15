;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              MEGHANADA             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package meghanada
  :defer t
  :config
  (setq meghanada-java-path "java")
  ;; (setq meghanada-maven-path "mvn")
  :hook java-mode . (lambda ()
		      ;; meghanada-mode on
		      (meghanada-mode t)
		      (flycheck-mode +1)
		      (setq c-basic-offset 2)
		      ;; use code format
		      (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
