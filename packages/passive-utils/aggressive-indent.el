;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          AGGRESSIVE-INDENT         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package aggressive-indent
  :defer t
  :config
  (add-to-list 'aggressive-indent-dont-indent-if
	       '(derived-mode-p 'sql-mode))
  :hook ((anaconda-mode . (lambda () (setq aggressive-indent-mode nil)))
	 (prog-mode . aggressive-indent-mode)))
