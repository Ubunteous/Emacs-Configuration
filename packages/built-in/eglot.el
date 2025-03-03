;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                EGLOT               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package eglot
  :ensure nil
  :defer t
  :custom
  (eglot-autoshutdown t)
  :general
  (:keymaps 'eglot-mode-map
			"C-c l b" 'eldoc
			"C-c l p" 'eldoc-box-help-at-point
            ;; "C-c C-o" 'python-sort-imports ;; requires python module (isort)
            ;; "C-c C-f" 'eglot-format-buffer)
            "C-c l r" 'eglot-rename)
  :config
  ;; don't trust the docstring. nil/0 blocks anyway
  ;; (setq eglot-sync-connect nil)

  ;; reduces minibuffer clutter
  ;; (setq eldoc-echo-area-use-multiline-p nil)

  ;; (setq eldoc-echo-area-prefer-doc-buffer t)

  ;; deactivate echo area to only keep buffer/popup
  ;; (setq eldoc-display-functions '(eldoc-display-in-buffer))

  ;; echo area with one line (maybe useful in clojure)
  ;; (setq eldoc-display-functions '(eldoc-display-in-echo-area))
  ;; (setq eldoc-echo-area-use-multiline-p 1) ;; truncate to 1 line

  ;;;;;;;;;;;;;;;;;;;;;
  ;; native ts modes ;;
  ;;;;;;;;;;;;;;;;;;;;;

  ;; this fails. eglot wants non-ts mode only
  ;; (add-to-list 'eglot-server-programs '(python-ts-mode . ("pyright")))

  ;; native modes extend to their ts counterpart. maybe due to treesit-auto
  (add-to-list 'eglot-server-programs '(c-mode . ("ccls"))) ;; also does c++
  (add-to-list 'eglot-server-programs '(c++-mode . ("ccls"))) ;; also does c++

  (add-to-list 'eglot-server-programs '(python-mode . ("pyright")))
  ;; (add-to-list 'eglot-server-programs '(bash-mode . ("bash-language-server")))

  ;; (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
  (add-to-list 'eglot-server-programs '(sql-mode . ("postgres_lsp")))
  ;; (add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer")))
  ;; (add-to-list 'eglot-server-programs '(java-mode . ("jdt-language-server")))
  (add-to-list 'eglot-server-programs '(js-ts-mode . ("typescript-language-server")))
  ;; (add-to-list 'eglot-server-programs '(typescript-mode . ("typescript-language-server")))

  ;; ;; missing HEX package manager
  ;; (add-to-list 'eglot-server-programs '(elixir-mode . ("elixir-ls")))

  ;; DO NOT FORGET TO ADD A HOOK AFTER THE SERVER

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ts-mode not available natively ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; regular typst mode vs treesit
  ;; (add-to-list 'eglot-server-programs '(typst--markup-mode . ("typst-lsp")))
  ;; (add-to-list 'eglot-server-programs '(typst-ts-mode . ("typst-lsp")))

  ;; (add-to-list 'eglot-server-programs '(LaTeX-mode . ("texlab")))
  (add-to-list 'eglot-server-programs '(lua-mode . ("lua-language-server")))
  ;; (add-to-list 'eglot-server-programs '(haskell-mode . ("haskell-language-server-wrapper")))

  ;; built-in
  (add-to-list 'eglot-server-programs '(csharp-ts-mode . ("OmniSharp" "-lsp")))
  ;; (add-to-list 'eglot-server-programs '(csharp-ts-mode . ("csharp-ls")))
  
  ;; note: gdscript is currently slowed down by :completionProvider
  ;; (add-to-list 'eglot-server-programs '(gdscript-ts-mode . (""))) ;; not needed

  ;; somehow missing documentation popup/hover. check with clojurians later
  (add-to-list 'eglot-server-programs '(clojure-ts-mode . ("clojure-lsp")))
  ;; (add-to-list 'eglot-server-programs '(nix-ts-mode . ("nil")))
  (add-to-list 'eglot-server-programs '(nix-ts-mode . ("nixd")))

  ;;;;;;;;;;;;;
  ;; HASKELL ;;
  ;;;;;;;;;;;;;

  ;; (setq-default eglot-workspace-configuration
  ;;               '((haskell
  ;;                  (plugin
  ;;                   (stan
  ;;                    (globalOn . :json-false))))))  ;; disable stan
  ;; (setq eglot-confirm-server-initiated-edits nil)  ;; allow edits withou

  ;;;;;;;;;;;;;;;;;;
  ;; PERFORMANCES ;;
  ;;;;;;;;;;;;;;;;;;

  (setq eglot-sync-connect nil) ;; disabling elgot freeze the UI for up to 3s when you open file maybe large one
  ;; (setq eglot-events-buffer-size 0) ;; disabling event logging in eglot
  ;; (fset #'jsonrpc--log-event #'ignore) ;; remove laggy typing. reduces lsp-json to eglot interactions

  (setq eglot--highlights nil)

  ;; prevent eldoc popup from appearing all the time
  ;; (setq eglot-ignored-server-capabilities '(:hoverProvider)) ;; also deactivate commands
  (setq eglot-ignored-server-capabilites '(:documentHighlightProvider))

  ;; (eglot-autoshutdown t)
  ;; (eglot-extend-to-xref nil)

  (setq eglot-stay-out-of '(yasnippet))
  :hook
  ((
    c-ts-mode
    c++-ts-mode ;; somehow, needs normal mode for ts-mode
    ;; bash-ts-mode

    ;; go-mode
    ;; sql-mode
    ;; rust-ts-mode
    ;; java-ts-mode
    js-ts-mode
    ;; typescript-ts-mode

    lua-mode
    ;; typst--markup-mode
    ;; typst-ts-mode
    ;; LaTeX-mode
    ;; haskell-mode / haskell-ts-mode

    ;; python-ts-mode
    gdscript-ts-mode
    csharp-ts-mode
    
    ;; elixir-mode
    nix-ts-mode
    clojure-ts-mode) . eglot-ensure))


;; makes eldoc info appear at point
(use-package eldoc-box
  ;; :hook (eglot-managed-mode . eldoc-box-hover-at-point-mode)
  :defer t)

;; (use-package eglot
;;   :commands eglot
;;   :init
;;   (setq eglot-stay-out-of '(flymake))
;;   :custom
;;   (eglot-ignored-server-capabilites '(:documentHighlightProvider))
;;   (eglot-autoshutdown t)
;;   :hook
;;   ;; (eglot-managed-mode . eldoc-box-hover-mode)
;;   (eglot-managed-mode . fk/company-enable-snippets)
;;   :config
;;   (add-to-list 'eglot-server-programs '(python-mode . ("pyright-langserver" "--stdio")))
;;   (with-eval-after-load 'eglot
;;     (load-library "project")))
