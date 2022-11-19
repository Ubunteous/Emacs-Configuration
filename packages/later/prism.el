;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               PRISM                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package prism
  :defer t
  :hook
  (python-mode . prism-whitespace-mode)
  (emacs-lisp-mode . prism-mode))
