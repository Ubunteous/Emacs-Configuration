;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             CONSULT-DIR            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package consult-dir
  :ensure t
  :bind
  ("C-x C-d" . consult-dir) ;; shadows list-directory
  (:map minibuffer-local-completion-map
		("C-x C-d" . consult-dir)
		("C-x C-j" . consult-dir-jump-file))
  :config
  (setq consult-dir-sort-candidates t))
