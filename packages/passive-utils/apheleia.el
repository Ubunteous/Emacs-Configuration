;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              APHELEIA              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package apheleia
  :defer t
  :hook prog-mode
  :config
  ;; (setq apheleia-global-mode 1)

  (setf apheleia-mode-alist '((nix-ts-mode . nixfmt)
			      ;; (c-ts-mode . clang-format)
			      ;; (bash-ts-mode . shfmt)

			      (js-ts-mode . prettier-javascript)
			      (web-mode . prettier-html)
			      (css-ts-mode . prettier-css)
			      
			      ;; (typescript-ts-mode . prettier-typescript)
			      (sql-mode . pgformatter)

			      (clojure-ts-mode . cljfmt)
			      (clojurescript-ts-mode . cljfmt)

			      (gdscript-ts-mode . gdformat)
			      (python-ts-mode . ruff)
			      (csharp-ts-mode . csharpier)
			      
			      ;; change later to typst-ts-mode
			      ;; also add move to apheleia hook if necessary
			      ;; (typst--markup-mode . typstfmt)

			      ;; (java-ts-mode . google-java-format)
			      ;; (rust-ts-mode . rustfmt)
			      ;; (go-ts-mode . gofmt)

			      ;; (haskell-mode . ormolu)
			      (lua-mode . stylua)))

  ;; (setf (alist-get 'ormolu apheleia-formatters)
  ;; 	'("ormolu" "--stdin-input-file" "-"))

  (setf (alist-get 'pgformatter apheleia-formatters)
	'("pg_format" "-"))

  ;; (add-to-list 'apheleia-formatters '(typstfmt "typstfmt" "--stdout"))
  (add-to-list 'apheleia-formatters '(gdformat "gdformat" "-"))
  (add-to-list 'apheleia-formatters '(csharpier "dotnet" "csharpier" "--write-stdout")))
