;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;         RAINBOW-DELIMITERS         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package rainbow-delimiters
  :defer t
  :hook (emacs-lisp-mode clojure-mode)
  :custom-face
  (rainbow-delimiters-depth-1-face ((t (:foreground "#fefff8")))))
