;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;         RAINBOW-DELIMITERS         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package rainbow-delimiters
  :defer t
  :hook (emacs-lisp-mode clojure-ts-mode lisp-interaction-mode)
  :config
  (set-face-attribute 'rainbow-delimiters-depth-1-face nil :foreground "#fefff8"))
