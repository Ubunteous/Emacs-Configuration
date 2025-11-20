;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             TYPESCRIPT             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package typescript-mode
  :defer t
  :ensure nil ;; emacs-typescript/typescript.el
  :config
  (setq typescript-ts-mode-indent-offset 4)
  :general
  (:keymaps 'typescript-ts-mode-map
			"C-c C-c" 'recompile)
  :mode ("\\.ts\\'" . typescript-ts-mode)
  :hook
  (typescript-ts-mode . (lambda ()
						  (unless (file-exists-p "package.json")
							(set (make-local-variable 'compile-command)
								 (concat "bun run "
										 (file-name-sans-extension buffer-file-name)))))))


;; needs a tsconfig file in root dir
;; generate it with: tsc --init
(use-package tide
  :defer t
  ;; :after (company flycheck)
  :config
  (setq tide-node-executable "bun")
  :hook ((typescript-ts-mode . tide-setup)
		 (tsx-ts-mode . tide-setup)
		 ;; (typescript-ts-mode . tide-hl-identifier-mode)
		 (before-save . tide-format-before-save)))


;; (use-package ob-typescript
;;   :defer t
;;   :config
;;   (setq org-babel-command:typescript "npx -p typescript -- tsc"))
