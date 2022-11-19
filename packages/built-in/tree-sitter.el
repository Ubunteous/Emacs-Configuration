;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             TREE-SITTER            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package tree-sitter
  :defer t
  :config
  (global-tree-sitter-mode))
;; (add-to-list 'tree-sitter-major-mode-language-alist '(emacs-lisp-mode . el)))


(use-package tree-sitter-langs
  :defer t)


;; load paths not detected
;; (use-package elisp-tree-sitter
;;   :defer t
;;   :straight (:type built-in))
