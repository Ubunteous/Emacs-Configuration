;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   PROGRAMMING LANGUAGE: HASKELL    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package haskell-mode
  :mode "\\.hs\\'"
  :hook ((haskell-mode . turn-on-haskell-indent)
	 (haskell-mode . (lambda () (aggressive-indent-mode -1)))
	 (haskell-mode . (lambda () (electric-indent-mode)))))

;; (use-package nix-haskell-mode
;;   :hook (haskell-mode . nix-haskell-mode))

;; no syntax highlighting
;; (use-package haskell-mode
;;   :ensure (haskell-ts-mode :type git :host codeberg :repo "pranshu/haskell-ts-mode")
;;   :mode "\\.hs\\'")
