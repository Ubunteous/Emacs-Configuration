;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             LSP-BRIDGE             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Package does not do anything. Maybe has issues finding the lsp?

;; Note: remove corfu when using it
(use-package posframe
  :defer t)

(use-package markdown-mode
  :defer t)

(use-package yasnippet
  :defer t
  :init
  (yas-global-mode 1))

;; (use-package acm
;;   :defer t
;;   :straight (:type git :host github :repo "twlz0ne/acm-terminal"))

(use-package lsp-bridge
  :defer t
  :straight ( :type git :host github :repo "manateelazycat/lsp-bridge"
	      :files (:defaults ".py" "langserver" "acm"))
  :init
  (global-lsp-bridge-mode)
  ;; :config
  (setq lsp-bridge-python-lsp-server 'pylsp)
  ;; (setq lsp-bridge-org-babel-lang-list ?)
  )
