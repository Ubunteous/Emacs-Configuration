;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                EGLOT               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package eglot
  :ensure nil
  :defer t
  :init
  (defvar-keymap eglot-keymap
	:doc "Keymap for eglot bindings.")

  (defvar-keymap xref-keymap
	:doc "Keymap for xref bindings.")

  (defun peek-eldoc ()
	(interactive)
	(setq peek--initial-window-configuration (current-window-configuration))
	(call-interactively #'eldoc-print-current-symbol-info)

	;; make up for delay before buffer shows up
	(run-with-timer .1 nil (lambda ()
							 (when (string= "special-mode" major-mode)
							   (delete-other-windows (get-buffer-window (current-buffer)))
							   (local-set-key (kbd "q") (lambda () (interactive)
														  (kill-buffer (current-buffer))
														  (set-window-configuration peek--initial-window-configuration)))))))
  :config
  (setq xref-search-program #'ripgrep)
  ;; (setq xref-marker-ring-length 16)
  ;; (setq xref-auto-jump-to-first-xref nil)

  (setq eglot-autoshutdown t)
  (setopt eglot-server-programs '())
  ;; don't trust the docstring. nil/0 blocks anyway
  ;; (setq eglot-sync-connect nil)

  ;; reduces minibuffer clutter
  ;; (setq eldoc-echo-area-use-multiline-p nil)
  ;; (setq eldoc-help-at-pt t)
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
  (add-to-list 'eglot-server-programs '(c-mode . ("ccls")))
  (add-to-list 'eglot-server-programs '(c++-mode . ("ccls")))

  ;; (add-to-list 'eglot-server-programs '(gdscript-mode . ("localhost" 6005)))

  (add-to-list 'eglot-server-programs '(python-mode . ("pyright"))) ;; or "basedpyright"
  ;; (add-to-list 'eglot-server-programs '(bash-mode . ("bash-language-server")))

  (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
  (add-to-list 'eglot-server-programs '(sql-mode . ("postgres_lsp")))
  ;; (add-to-list 'eglot-server-programs '(rust-mode .
  ;;												  ;; ("rust-analyzer")
  ;;												  ("rust-analyzer" :initializationOptions (:check (:command "clippy")))
  ;;												  ))

  ;; (add-to-list 'eglot-server-programs '(java-mode . ("jdt-language-server")))
  (add-to-list 'eglot-server-programs '(js-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(typescript-mode . ("typescript-language-server" "--stdio")))

  (add-to-list 'eglot-server-programs '(kotlin-mode . ("kotlin-language-server")))

  ;; missing HEX package manager
  (add-to-list 'eglot-server-programs '(elixir-mode . ("elixir-ls")))
  ;; (add-to-list 'eglot-server-programs '(elixir-mode . ("expert_linux_amd64" "--stdio"))) ; official language server

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
  ;; (add-to-list 'eglot-server-programs '(gdscript-ts-mode . ("localhost" 6005))) ;; not needed

  ;; somehow missing documentation popup/hover. check with clojurians later
  (add-to-list 'eglot-server-programs '(clojure-mode . ("clojure-lsp")))

  ;; (add-to-list 'eglot-server-programs '(nix-ts-mode . ("nil")))
  ;; (add-to-list 'eglot-server-programs '(nix-ts-mode . ("nixd")))

  ;; Prefer nixd to nil, and enable in nix-ts-mode too
  (add-to-list 'eglot-server-programs
			   `((nix-mode nix-ts-mode) . ,(eglot-alternatives '("nixd" "nil"))))

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

  ;; (setq eglot-ignored-server-capabilites '(:documentHighlightProvider))
  (setq eglot-ignored-server-capabilites '(
										   :hoverProvider ; Documentation on hover (eldoc popup)
										   ;; :completionProvider ; Code completion
										   ;; :signatureHelpProvider ; Function signature help
										   ;; :definitionProvider ; Go to definition
										   ;; :typeDefinitionProvider ; Go to type definition
										   ;; :implementationProvider ; Go to implementation
										   ;; :declarationProvider ; Go to declaration
										   ;; :referencesProvider ; Find references
										   :documentHighlightProvider ; Highlight symbols automatically
										   :documentSymbolProvider ; List symbols in buffer
										   :workspaceSymbolProvider ; List symbols in workspace
										   :codeActionProvider ; Execute code actions
										   :codeLensProvider ; Code lens
										   :documentFormattingProvider ; Format buffer
										   :documentRangeFormattingProvider ; Format portion of buffer
										   :documentOnTypeFormattingProvider ; On-type formatting
										   ;; :renameProvider ; Rename symbol
										   :documentLinkProvider ; Highlight links in document
										   :colorProvider ; Decorate color references
										   :foldingRangeProvider ; Fold regions of buffer
										   :executeCommandProvider ; Execute custom commands
										   ;; :inlayHintProvider ; Inlay hints
										   ))

  (setq eglot-stay-out-of '(yasnippet))

  ;; (eglot-autoshutdown t)

  ;;;;;;;;;;
  ;; XREF ;;
  ;;;;;;;;;;

  ;; (eglot-extend-to-xref nil)
  (setq xref-search-program #'ripgrep)
  ;; (setq xref-marker-ring-length 16)
  ;; (setq xref-auto-jump-to-first-xref nil)

  ;; example to add elements to xref marker stack to use xref-go-back. useful with consult-ripgrep/line
  ;; (defun add-point-to-find-tag-marker-ring (&rest r)
  ;;	"Advising function to use `find-tag-marker-ring' (R ignored)."
  ;;	(xref-push-marker-stack))
  ;; (advice-add 'find-function :before 'add-point-to-find-tag-marker-ring)
  :general
  (:keymaps 'eglot-keymap
			;; use instead C-h . for display-local-help
			"a a" 'eglot-code-actions
			"a o" 'eglot-code-action-organize-imports
			"a q" 'eglot-code-action-quickfix
			"a i" 'eglot-code-action-inline
			"a e" 'eglot-code-action-extract
			"a r" 'eglot-code-action-rewrite

			"b e" 'eglot-events-buffer
			"b f" 'eglot-format-buffer
			"b l" 'eglot-list-connections
			"b r" 'eglot-stderr-buffer

			"d" 'eglot-find-declaration
			"e" 'eldoc

			"f" 'eglot-format
			"C-f" 'eglot-format-buffer

			"i" 'eglot-find-implementation
			;; "C-o" 'python-sort-imports ;; requires python module (isort)
			"p" 'eldoc-box-help-at-point
			"r" 'eglot-rename
			"R" 'eglot-reconnect
			"s" 'eglot-shutdown
			"S" 'eglot-shutdown-all
			"t" 'eglot-find-typeDefinition)

  (:keymaps 'xref-keymap
			"," 'xref-go-back
			"C-," 'xref-go-forward
			"C-." 'xref-find-apropos
			"?" 'xref-find-references
			";" 'xref-find-definitions
			"q" 'xref-query-replace-in-results
			"f" 'xref-find-references-and-replace)
  (:keymaps 'personal
			"g" (cons "eglot" eglot-keymap)
			"x" (cons "xref" xref-keymap))
  :hook
  ;; ;; built-in eslint ignores configuration file

  ;; ;; no need to disable flymake. typescript-language-server expects a jsconfig.json file
  ;; (js-ts-mode . (lambda () (add-to-list 'eglot-stay-out-of 'flymake)))

  ((c-ts-mode
	c++-ts-mode ;; somehow, needs normal mode for ts-mode
	;; bash-ts-mode

	go-mode
	;; sql-mode

	;; ;; rust-analyzer consummes too much ram
	;; rust-mode
	;; rust-ts-mode

	;; java-ts-mode
	js-ts-mode
	typescript-ts-mode

	lua-mode
	;; typst--markup-mode
	;; typst-ts-mode
	;; LaTeX-mode
	;; haskell-mode / haskell-ts-mode

	;; python-ts-mode
	gdscript-ts-mode
	csharp-ts-mode

	;; kotlin-mode
	elixir-mode
	nix-ts-mode
	clojure-mode) . eglot-ensure))

;; ;; makes eldoc info appear at point
;; (use-package eldoc-box
;;   ;; :hook (eglot-managed-mode . eldoc-box-hover-at-point-mode)
;;   :defer t)

;; ;; does not appear to do much to make flycheck errors appear
;; (use-package flycheck-eglot
;;   :defer t
;;   :after (flycheck eglot)
;;   ;; :config
;;   ;; (global-flycheck-eglot-mode 1)
;;   :hook
;;   (clojure-mode . flycheck-eglot-mode))
