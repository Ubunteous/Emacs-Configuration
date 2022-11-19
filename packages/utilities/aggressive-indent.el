;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          AGGRESSIVE-INDENT         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package aggressive-indent
  :defer t
  :hook ((anaconda-mode . (lambda () (setq aggressive-indent-mode nil)))
	 (prog-mode . aggressive-indent-mode)))
