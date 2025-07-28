;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          AGGRESSIVE-INDENT         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package aggressive-indent
  :defer t
  ;; :config
  ;; (add-to-list 'aggressive-indent-dont-indent-if
  ;; 			   '(derived-mode-p 'sql-mode)
  ;; 			   '(derived-mode-p 'gdscript-mode))
  :hook (prog-mode . (lambda ()
					   (unless (member major-mode '(c-mode c-ts-mode anaconda-mode gdscript-ts-mode sql-mode))
						 (aggressive-indent-mode)))))
