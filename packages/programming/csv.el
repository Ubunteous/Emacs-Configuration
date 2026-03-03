;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 CSV                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package csv-mode
  :defer t
  :ensure nil
  :hook ((csv-mode . csv-align-mode)
		 (csv-mode . (lambda () (progn (visual-line-mode -1)
									   (toggle-truncate-lines))))))
