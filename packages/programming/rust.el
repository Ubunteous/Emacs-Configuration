;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                RUST                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package rust-mode
  :defer t
  :config
  (setq rust-format-on-save t)
  (setq rust-mode-treesitter-derive t)
  :mode "\\.rs\\'"
  :hook
  (rust-mode . (lambda ()
				 (setq indent-tabs-mode nil)
				 (prettify-symbols-mode))))

;; (use-package flycheck-rust
;;   :defer t
;;   ;; :after rust-mode
;;   :hook
;;   (rust-mode . (lambda () (flycheck-rust-setup))))

;; other packages: wemacs-racer, cargo.el/cargo-mode, rustic
