;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          AGGRESSIVE-INDENT         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package aggressive-indent
  :defer t
  :config
  (add-to-list 'aggressive-indent-dont-indent-if
	       '(derived-mode-p 'sql-mode))
  :hook (prog-mode . (lambda ()
		       (unless (member major-mode '(c-mode c-ts-mode anaconda-mode))
			 (aggressive-indent-mode)))))
