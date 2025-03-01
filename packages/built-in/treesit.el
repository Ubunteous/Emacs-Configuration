;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             TREE-SITTER            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package treesit
  :defer t
  :ensure nil
  ;; :custom
  ;; (treesit-font-lock-level 4)
  ;; :hook (anaconda-mode . python-ts-mode) ;; causes an infinite loop
  ;; :mode ("\\.py\\'" . python-ts-mode) ;; to fix python-ts-mode error in org files => failure
  :config
  ;; (global-tree-sitter-mode)
  (customize-set-variable 'treesit-font-lock-level 4)
  ;; (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
  )

;; (add-to-list 'major-mode-remap-alist
;; 	     '(python-mode . python-ts-mode)
;; 	     '(nix-mode . nix-ts-mode)
;; 	     '(gdscript-mode . gdscript-ts-mode))

;; find mode faces with customize-apropos-faces RET ^font-lock-
;; use treesit-inspect-node-at-point to discover if parser is available

;; Check if a grammar is available with:
;; (treesit-language-available-p 'python)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            TREESIT-FOLD            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Note that treesit-fold is similar to hs-mode
;; (use-package treesit-fold
;;   :defer t
;;   :ensure (ts-fold :type git :host github :repo "emacs-tree-sitter/treesit-fold")
;;   :hook
;;   ;; (tree-sitter-after-on . ts-fold-indicators-mode) ;; ts-fold unavailable with treesit
;;   (python-ts-mode . treesit-fold-mode))

;; (use-package ts-fold-indicators
;;   :defer t
;;   :ensure  (ts-fold-indicators :type git :host github :repo "emacs-tree-sitter/ts-fold")
;;   ;; :hook ts-fold-mode)
;;   )


;; ;; Example of ts-fold-range-alist's structure
;; '((c-mode     . c-folding-definitions) ;; <language>-folding-definitions is structured as shown below
;;   (css-mode   . css-folding-definitions)
;;   (go-mode    . go-folding-definitions)
;;   (scala-mode . scala-folding-definitions)
;;   ...)

;; ;; Examle of a folding definition alist
;; (setq css-folding-definitions
;;       (block   . ts-fold-range-seq)
;;       (comment . ts-fold-range-c-like-comment))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            TREESIT-AUTO            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; choose between lang-mode and lang-ts-mode
(use-package treesit-auto
  :defer t
  :hook prog-mode
  :config

  ;; use (apropos "-ts-mode$") for emacs built in list
  ;; note: elisp and latex do not have a ts module
  ;; note: nix, gdscript and clojure ts are not built into emacs
  ;; javascript and python removed for org compat
  (setq treesit-auto-langs '(c cpp c-sharp css bash javascript haskell python)) ;; also: rust java go and maybe Haskell

  ;; (setq treesit-auto-recipe-list
  ;; 	`(,(make-treesit-auto-recipe
  ;; 	    :lang 'python
  ;; 	    :ts-mode 'python-ts-mode
  ;; 	    :remap 'anaconda-mode
  ;; 	    :url "https://github.com/tree-sitter/tree-sitter-python"
  ;; 	    :revision "master"
  ;; 	    :source-dir "src"
  ;; 	    :ext "\\.py[yw]?\\'")))

  ;; if non nil download missing lang-ts-mode
  ;; (setq treesit-auto-install 'prompt)

  ;; (global-treesit-auto-mode)
  (treesit-auto-add-to-auto-mode-alist 'all))

;;;;;

;; remove treesit sexp motions
;; (defun mp-remove-treesit-sexp-changes ()
;;   (when (eq forward-sexp-function #'treesit-forward-sexp)
;;     (setq forward-sexp-function nil))
;;   (when (eq transpose-sexps-function #'treesit-transpose-sexps)
;;     (setq transpose-sexps-function #'transpose-sexps-default-function))
;;   (when (eq forward-sentence-function #'treesit-forward-sentence)
;;     (setq forward-sentence-function #'forward-sentence-default-function)))

;; (add-hook 'prog-mode-hook #'mp-remove-treesit-sexp-changes)

;;;;;;;;;;;;;;;;;;;;;
;; OLD TREE SITTER ;;
;;;;;;;;;;;;;;;;;;;;;

;; tree sitter is an external package. treesit is built-in
;; (use-package tree-sitter
;;   :defer t
;;   :ensure nil
;;   ;; :config
;;   ;; (global-tree-sitter-mode)
;;   :hook ((anaconda-mode . tree-sitter-mode)
;; 	 ;; (python-mode . tree-sitter-mode)
;; 	 (emacs-lisp-mode . tree-sitter-mode)))


;; installer made for tree-sitter (not built-in)
;; (use-package tree-sitter-langs
;;   :ensure nil
;;   :defer t)
