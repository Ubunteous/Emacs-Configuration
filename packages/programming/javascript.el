;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             JAVASCRIPT             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; currently using skewer for live preview and tools => vite replaced it
;; see later indium for an alternative

(use-package js2-mode
  :defer t
  :general
  (:keymaps 'js2-minor-mode-map
			"C-c C-c" 'node-run
			"M-;" 'js2-jump-to-definition
			"RET" 'smart-insert-semicolon)

  ;; :mode ("\\.js\\'" . js2-mode) ;; major mode
  ;; :mode (("\\.js\\'" . js2-mode)
  ;;	 ("\\.jsx?\\'" . js2-jsx-mode))
  ;; as minor mode with js-mode for react
  ;; :interpreter (("node" . js2-mode)
  ;;		("node" . js2-jsx-mode))
  :config
  (setq org-babel-js-cmd "node")

  (defun node-run ()
	"Run Node on DIRECTORY (defaults to project root)."
	(interactive)
	(let* ((project-p (project-current nil))
		   (default-file (if project-p
							 (concat (project-root project-p) "src/index.js")
						   (buffer-file-name)))
		   (default-directory (if project-p
								  (project-root project-p)
								(file-name-directory default-file))))

	  (save-buffer)
	  (compilation-start (concat "node " (shell-quote-argument (expand-file-name default-file t))))))

  (add-to-list 'compilation-error-regexp-alist 'node)

  ;; 1-file, 2-line, 3-column (groups delimited by \\(...\\))
  (add-to-list 'compilation-error-regexp-alist-alist
			   '(node "\\(/[[:alpha:]/\s]+.js\\):\\([[:digit:]]+\\)" 1 2))
  :hook (((js-mode js-ts-mode typescript-ts-mode) . js2-minor-mode)))

;; ;; cannot be lazy loaded easily
;; (use-package js-comint
;;   :defer t
;;   ;; :config
;;   ;; (setq js-comint-program-command "node")
;;   ;; (setq js-comint-program-arguments '("--interactive"))
;;   )

;; (use-package flymake-jsts
;;   :defer t
;;   :ensure (flymake-jsts :type git :host github :repo "orzechowskid/flymake-jsts")
;;   :hook eglot-managed-mode-hook . (flymake-jsts-eslint-enable))
