;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          HIGHLIGHT-CHANGES         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package highlight-changes
  :ensure nil
  :defer t
  :init
  (defun highlight-changes-mode-turn-off ()
	(and highlight-changes-mode (highlight-changes-mode -1)))

  (defun highlight-changes-auto ()
	(interactive)
	;; Use it after highlight-changes-mode
	(if (or (not (boundp 'highlight-changes-mode))
			(eq highlight-changes-mode nil))

		(progn
		  (highlight-changes-mode 1)
		  (when (buffer-file-name)
			(highlight-changes-mode-turn-on)
			(add-hook 'after-save-hook #'highlight-changes-mode-turn-on nil t)
			(add-hook 'before-save-hook #'highlight-changes-mode-turn-off nil t)))

	  (progn
		(highlight-changes-mode -1)
		(remove-hook 'after-save-hook #'highlight-changes-mode-turn-on t)
		(remove-hook 'before-save-hook #'highlight-changes-mode-turn-off t)))))
