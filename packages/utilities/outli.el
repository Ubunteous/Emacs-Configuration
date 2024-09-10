;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                OUTLI               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package outli
  :ensure (outli :type git :host github :repo "jdtsmith/outli")
  ;; :after lispy ; uncomment only if you use lispy; it also sets speed keys on headers!
  :bind (:map outli-mode-map ; convenience key to get back to containing heading
	      ("C-c C-p" . (lambda () (interactive) (outline-back-to-heading))))
  :hook (prog-mode text-mode))
