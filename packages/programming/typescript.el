;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             TYPESCRIPT             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package typescript-mode
  :defer t
  :elpaca nil
  :general
  (:keymaps 'typescript-ts-mode-map
	    "C-c C-c" 'recompile)
  :config
  :mode ("\\.ts\\'" . typescript-ts-mode)
  :hook ((typescript-ts-mode) . (lambda ()
				  (setq-local compile-command
					      (concat "ts-node "
						      (if buffer-file-name
							  (shell-quote-argument
							   (file-name-sans-extension buffer-file-name))))))))

;; needs a tsconfig file in root dir
;; generate it with: tsc --init
(use-package tide
  :defer t
  ;; :after (company flycheck)
  :hook ((typescript-ts-mode . tide-setup)
	 (tsx-ts-mode . tide-setup)
	 (typescript-ts-mode . tide-hl-identifier-mode)
	 (before-save . tide-format-before-save)))


;; (use-package ob-typescript
;;   :defer t
;;   :config
;;   (setq org-babel-command:typescript "npx -p typescript -- tsc"))
