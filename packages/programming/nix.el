;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     PROGRAMMING LANGUAGE: NIX      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; This is a major mode for editing Nix expressions.
;;; It provides syntax highlighting, sane defaults, and experimental indentation support.

(use-package nix-mode
  :defer t
  ;; :hook (nix-mode . eglot-ensure)
  ;; :config
  ;; (add-to-list 'eglot-server-programs '(nix-mode . ("nil")))
  :mode ("\\.nix\\'"))

(use-package nix-ts-mode
  :defer t
  ;; :hook (nix-ts-mode . eglot-ensure)
  ;; :config
  ;; (add-to-list 'eglot-server-programs '(nix-ts-mode . ("nil")))
  :mode "\\.nix\\'")

;; (use-package nix-drv-mode
;;   :ensure nix-mode
;;   :mode "\\.drv\\'")

;; (use-package nix-shell
;;   :ensure nix-mode
;;   :commands (nix-shell-unpack nix-shell-configure nix-shell-build))

;; (use-package nix-repl
;;   :ensure nix-mode
;;   :commands (nix-repl))

;; See nix-company.el
