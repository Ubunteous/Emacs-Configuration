;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               PRISM                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package prism
  :defer t
  :hook
  ((python-mode python-ts-mode) . prism-whitespace-mode)
  (emacs-lisp-mode . prism-mode))
