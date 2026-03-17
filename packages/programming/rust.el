;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                RUST                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package rust-mode
  :defer t
  :config
  (setq rust-format-on-save t)
  (setq rust-mode-treesitter-derive t)
  :mode "\\.rs\\'"
  :general
  ("C-c s" 'cargo-run)
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

;; other packages: wemacs-racer, cargo.el/cargo-mode, rustic
