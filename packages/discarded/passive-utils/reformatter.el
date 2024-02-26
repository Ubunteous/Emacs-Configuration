;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             REFORMATTER            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package reformatter
  :defer t
  :hook
  (c-ts-mode . clang-format-on-save-mode)
  (bash-ts-mode . shfmt-on-save-mode)

  (nix-ts-mode . nixfmt-on-save-mode)
  (lua-mode . ruff-format-on-save-mode)

  (clojure-ts-mode . cljfmt-on-save-mode)
  (clojure-ts-clojurescript-mode . cljfmt-on-save-mode)
  (haskell-mode . ormolu-format-on-save-mode)
  
  (python-ts-mode . ruff-format-on-save-mode)
  (gdscript-ts-mode . gdformat-on-save-mode)
  :config
  ;; formatters should ideally use stdin/stdout

  (reformatter-define ruff-format
    :program "ruff"
    :args `("format" "--stdin-filename", buffer-file-name "-")
    :lighter " ruff")

  (reformatter-define gdformat
    :program "gdformat"
    :stdin nil
    :stdout nil
    :args (list input-file)
    :lighter " gdfmt")

  (reformatter-define clang-format
    :program "clang-format"
    :args (list input-file)
    :lighter " clgfmt")

  (reformatter-define shfmt
    :program "shfmt"
    ;; :stdin nil
    ;; :stdout nil "-w"
    :args (list input-file)
    :lighter " Shfmt")

  (reformatter-define stylua
    :program "stylua"
    :args `("--stdin-filepath", buffer-file-name "-")
    :lighter " Sty")

  (reformatter-define ormolu-format
    :program "ormolu"
    :args `("--stdin-input-file", buffer-file-name "-")
    :lighter " Orm")

  (reformatter-define cljfmt
    :program "cljfmt"
    :args `("fix", buffer-file-name "-")
    :lighter " cljfmt")
  
  (reformatter-define nixfmt
    :program "nixfmt"
    :lighter " nixfmt"))
