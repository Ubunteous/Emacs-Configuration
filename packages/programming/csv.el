;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 CSV                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package csv-mode
  :defer t
  :config
  (setq csv-separators '("\t" "," "\|"))
  :mode "\\.csv\\'"
  :hook (csv-mode . (lambda () (progn
								 (csv-align-mode)
								 (visual-line-mode -1)
								 (toggle-truncate-lines)))))
