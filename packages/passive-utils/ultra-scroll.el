;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            ULTRA-SCROLL            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ultra-scroll
  :defer t
  :ensure (ultra-scroll :type git :host github :repo "jdtsmith/ultra-scroll")
  :config
  (ultra-scroll-mode 1)
  :hook
  (elpaca-after-init . (lambda () ((setq scroll-conservatively 101 ; important!
					 scroll-margin 0)))))
