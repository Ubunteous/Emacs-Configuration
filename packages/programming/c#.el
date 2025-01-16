;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 C#                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; missing bindings to build and run. also test and debug

(use-package csharp
  :defer t
  :ensure nil
  :general
  (:keymaps 'csharp-ts-mode-map
	    ;; this somehow prevents indentation
	    "RET" 'smart-insert-semicolon)
  :hook (csharp-mode . read-only-mode))

;; (use-package sharper
;;   :defer t
;;   :general ("C-c #" 'sharper-main-transient))

;; (use-package csproj-mode
;;   :defer t
;;   :ensure (name :type git :host github :repo "omajid/csproj-mode")
;;   :mode "\\.csproj\\'")

;; (use-package dotnet
;;   :defer t
;;   ;; :config
;;   ;; (setq dotnet-mode-keymap-prefix (kbd "<ADD YOUR PREFIX HERE>"))
;;   :hook csharp-ts-mode)
