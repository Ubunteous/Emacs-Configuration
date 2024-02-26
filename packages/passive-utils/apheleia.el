;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              APHELEIA              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package apheleia
  :defer t
  :hook prog-mode
  :config
  ;; (setq apheleia-global-mode 1)

  (setq apheleia-mode-alist '((nix-ts-mode . nixfmt)
			      ;; (c-ts-mode . clang-format)
			      ;; (bash-ts-mode . shfmt)

			      (clojure-ts-mode . cljfmt)
			      (clojurescript-ts-mode . cljfmt)

			      (gdscript-ts-mode . gdformat)
			      (python-ts-mode . ruff)

			      ;; (haskell-mode . ormolu)
			      (lua-mode . stylua)))

  (setf (alist-get 'ormolu apheleia-formatters)
	'("ormolu" "--stdin-input-file" "-"))

  (add-to-list 'apheleia-formatters '(gdformat "gdformat" "-")))
