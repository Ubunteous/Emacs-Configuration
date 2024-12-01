;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               LSP-MODE             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package lsp-mode
  :defer t
  :config
  (setq lsp-keymap-prefix "C-c l")

  ;; missing: which-key-add-key-based-replacements
  ;; (lsp-enable-which-key-integration t)
  :hook (python-mode python-ts-mode))

;; what should I do about this?
;; (add-to-list 'load-path (expand-file-name "lib/lsp-mode" user-emacs-directory))
;; (add-to-list 'load-path (expand-file-name "lib/lsp-mode/clients" user-emacs-directory))

(use-package lsp-pyright
  :ensure t
  ;; :config
  ;; (setq lsp-pyright-use-library-code-for-types t) ;; set this to nil if getting too many false positive type errors
  ;; (setq lsp-pyright-stub-path (concat (getenv "HOME") "/src/python-type-stubs")) ;; example
  :hook (python-ts-mode . (lambda ()
                            (require 'lsp-pyright)
                            (lsp)))) ;; or lsp-deferred

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               COMPANY              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company
  :after lsp-mode
  :hook prog-mode
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection))
  (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook company-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                LSP-UI              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package lsp-ui
  :defer t
  :config
  (setq lsp-ui-doc-position 'bottom)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-show-hover nil)
  :hook lsp-mode)

;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

;; (lsp-ui-peek-jump-backward)
;; (lsp-ui-peek-jump-forward)

;; (lsp-ui-peek-enable)
;; (lsp-ui-doc-enable)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             CONSULT-LSP            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package consult-lsp
;;   :defer t
;;   :after consult)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               DAP-MODE             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package dap-mode
  :defer t
  :config
  ;; Enabling only some features
  (dap-auto-configure-mode) ;; auto setup

  ;; (setq lsp-enable-dap-auto-configure nil)
  ;; (setq dap-auto-configure-features '(sessions locals controls tooltip))

  (require 'dap-python)
  ;; if you installed debugpy, you need to set this
  ;; https://github.com/emacs-lsp/dap-mode/issues/306
  (setq dap-python-debugger 'debugpy))
