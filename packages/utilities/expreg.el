;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               EXPREG               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package expreg
  :defer t
  :ensure (expreg :type git :host github :repo "casouri/expreg")
  :config
  ;; (setq expreg-restore-point-on-quit t)
  
  (repeat-it
   expreg
   '(("=" expreg-expand "expand")
	 ("+" expreg-contract "contract")))
  :general
  ("C-=" 'expreg-expand
   "C-+" 'expreg-contract))

