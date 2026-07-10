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
												 nil 'make-it-local)))

  (defun nxml--in-start-tag-p ()
	;; Check that we're at the end of a start tag. From the source code of
	;; `nxml-balanced-close-start-tag`.
	(let ((token-end (nxml-token-before))
		  (pos (1+ (point)))
		  (token-start xmltok-start))
	  (or (eq xmltok-type 'partial-start-tag)
		  (and (memq xmltok-type '(start-tag
								   empty-element
								   partial-empty-element))
			   (>= token-end pos)))))

  (defun nxml-finish-element-dwim ()
	(interactive)
	(if (nxml--in-start-tag-p)
		;; If we're at the end of a start tag like `<foo`, complete this to
		;; `<foo></foo>`, then move the point between the start and end tags.
		(nxml-balanced-close-start-tag-inline)
	  ;; Otherwise insert an angle bracket.
	  (insert ">")))

  (defun nxml-newline-and-indent-dwim ()
	"Insert a newline, indenting the current line and the newline appropriately in nxml-mode."
	(interactive)

	(let ((tag-beg-in-line-p (save-excursion (back-to-indentation)
											 (char-equal (char-after) ?<))))
	  (when (and tag-beg-in-line-p
				 (not (char-equal (char-before) ?>))
				 (not (char-equal (char-before) ? )))
		(nxml-finish-element-dwim)))

	(newline-and-indent) ; default behaviour

	(when (char-equal (char-after) ?<)
	  (open-line 1)))
  :general
  (:keymaps 'nxml-mode-map
			">" 'nxml-finish-element-dwim
			"RET" 'nxml-newline-and-indent-dwim))
