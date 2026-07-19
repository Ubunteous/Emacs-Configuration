;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 CSV                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package csv-mode
  :defer t
  :ensure nil
  :config
  (setq csv-separators '("\t" "," "\|"))
  :mode "\\.csv\\'"
  :hook (csv-mode . (lambda () (progn
								 (csv-align-mode)
								 (visual-line-mode -1)
								 (toggle-truncate-lines)
								 (setq-local require-final-newline nil)))))
