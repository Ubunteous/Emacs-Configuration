;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                RUST                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package rust-mode
  :defer t
  :config
  (setq rust-format-on-save t)
  (setq rust-mode-treesitter-derive t)
  :mode "\\.rs\\'"
  :bind
  (:map rust-mode-map
		("C-c s" . cargo-run))
  :hook
  (rust-mode . (lambda ()
				 (setq indent-tabs-mode nil)
				 (prettify-symbols-mode))))

(defun cargo-run ()
  "Run Node on DIRECTORY (defaults to project root)."
  (interactive)

  (save-buffer)
  (let* ((project-p (project-current nil))
		 (default-file (if project-p
						   (concat (project-root project-p) "src/main.rs")
						 (buffer-file-name)))
		 (default-directory (if project-p
								(project-root project-p)
							  (file-name-directory default-file))))

	(compilation-start (concat "cargo run " (shell-quote-argument (expand-file-name default-file t))))))

;; (use-package flycheck-rust
;;   :defer t
;;   ;; :after rust-mode
;;   :hook
;;   (rust-mode . (lambda () (flycheck-rust-setup))))

;; (use-package cargo
;;   :defer t
;;   :mode "\\.rs\\'"
;;   ;; :bind
;;   ;; ("..." . cargo-minor-mode-command-map)
;;   )

;; (use-package cargo-mode
;;   :defer t
;;   ;; :config
;;   ;; (setq cargo-mode-command-build "build"
;;   ;;		cargo-mode-command-test "test"
;;   ;;		cargo-mode-command-clippy "clippy")

;;   ;; (setq cargo-mode-use-comint nil)

;;   ;; (setq cargo-mode-default-params
;;   ;;   '((("r" "run") . "--bin example")
;;   ;;     (("t" "test") . "-- --no-capture")
;;   ;;     ("doc" . "--open")))
;;   )

(use-package rustic
  :defer t
  :mode "\\.rs\\'"
  :config
  (setq rustic-lsp-client 'eglot)
  (setq rustic-lsp-setup-p nil)

  ;; (setq rustic-cargo-use-last-stored-arguments t)
  ;; (setq rustic-lsp-server 'rust-analyzer)
  ;; (setq rustic-format-trigger nil)
  ;; (setq rustic-load-optional-libraries t)
  ;; (setq rustic-test/clean/compile/lints/clippy/install/nextest-arguments/(exec-command))
  ;; (setq rustic-babel-auto-wrap-main t)
  ;; (setq rustic-compilation-directory nil)
  ;; (setq rustic-cargo-open-new-project t)
  ;; (setq rustic-use-rust-save-some-buffers nil)
  ;; (setq rustic-cargo-test-disable-warnings nil)
  ;; (setq rustic-babel-display-compilation-buffer nil)
  ;; (setq rustic-cargo-auto-add-missing-dependencies t)

  ;; rustic-cargo-run-use-comint t
  rustic-babel-display-error-popup
  :hook
  (rust-mode . rustic-doc-mode)
  (eglot--managed-mode . (lambda () (flymake-mode -1))))
