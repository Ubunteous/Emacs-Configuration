;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              MARGINALIA             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable richer annotations using the Marginalia package
;; Inherits from completions annotations which may print underlined text
(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :defer t
  :general
  ("M-A" 'marginalia-cycle)
  (:map 'minibuffer-local-map
		"M-A" 'marginalia-cycle)
  :init
  (marginalia-mode)
  :config
  ;; marginalia uses functions for annotations. Use this one to simplify describe-variable
  (defun marginalia-simplify-variable-description ()
	;; Remove class/symbol in describe-variable. Not a toggle.
	(interactive)
	(defun marginalia-annotate-variable (cand)
	  "Annotate variable CAND with its documentation string."
	  (when-let* ((sym (intern-soft cand)))
		(marginalia--fields
		 ((or (documentation-property sym 'variable-documentation)
			  (marginalia--definition-prefix sym))
		  :truncate 1.0 :face 'marginalia-documentation)))))
  )
