;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              ORDERLESS             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package orderless
  :ensure t
  ;; :custom
  ;; (completion-styles '(orderless basic))
  ;; (completion-category-overrides '((file (styles basic partial-completion)))))
  :config
  (setq completion-styles
	'(partial-completion substring flex))
  ;; '(partial-completion substring first-initialism flex))
  ;; '(partial-completion substring initials flex))

  (setq completion-category-overrides
	'((file (styles . (partial-completion substring)))
	  (buffer (styles . (basic partial-completion substring)))
	  ;; (project-file (styles . (partial-completion substring)))
	  (info-menu (styles . (substring))))))

;; (defun first-initialism (pattern index _total)
;;   (if (= index 0) 'orderless-initialism))
