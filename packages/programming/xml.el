;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 XML                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package nxml
  :ensure nil
  :defer t
  :init
  (defun nxml--reindent ()
	(indent-region (point-min) (point-max))
	(save-buffer))

  (add-hook 'nxml-mode-hook	(lambda () (add-hook 'after-save-hook
												 'nxml--reindent
												 nil 'make-it-local))))
