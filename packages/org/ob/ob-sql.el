;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               OB-SQL               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ob-sql-mode
  :defer t
  :ensure (:type git :host github :repo "nikclayton/ob-sql-mode")
  ;; :config
  ;; (require 'ob-sql-mode)
  ;; ;; no prompt to evaluate sql block
  ;; (setq org-confirm-babel-evaluate
  ;; 	(lambda (lang body)
  ;;         (not (string= lang "sql-mode"))))
  )
