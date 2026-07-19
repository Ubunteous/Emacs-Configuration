;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               OUTLINE              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package outline
  :ensure nil
  :defer t
  :config
  (setq outline-minor-mode-cycle t)
  (setq outline-minor-mode-highlight t)
  (setq outline-minor-mode-cycle-filter (lambda () (bolp)))

  (let ((cmds '(("C-c C-u" outline-up-heading)
				("C-c C-n" outline-next-visible-heading)
				("C-c C-p" outline-previous-visible-heading)
				("C-c <down>" outline-next-visible-heading)
				("C-c <up>"   outline-previous-visible-heading)
				;; ("M-<down>"  outline-next-visible-heading)
				;; ("M-<up>"    outline-previous-visible-heading)
				;; ("M-<left>"  outline-hide-subtree)
				;; ("M-<right>" outline-show-subtree)
				)))
	(dolist (command cmds)
	  (outline-minor-mode-cycle--bind
	   outline-minor-mode-cycle-map
	   (kbd (nth 0 command)) (nth 1 command)
	   (lambda (cmd)
		 (when (and (outline-on-heading-p t) (bolp)
					;; Exclude emacs-lisp-mode:
					;; outline-minor-mode-highlight
					;; BETTER:
					;; (buffer-file-name (current-buffer))
					;; buffer-read-only
					)
		   cmd)))))

  (defun outline-everywhere-minor-mode ()
	;; Enable in modes with reasonable ‘outline-regexp’:
	(when (and (seq-some #'local-variable-p '(outline-search-function outline-regexp))
			   (not (string-match-p "\\.h\\'" (buffer-name)))
			   (or (not (derived-mode-p '(org-mode markdown-mode liquid-generic-ts-mode))) ; liquid only for big files
				   (derived-mode-p '(markdown-ts-mode))))
	  ;; Don't override major mode font-lock
	  (setq-local outline-minor-mode-highlight nil)
	  (outline-hide-sublevels 1)
	  (outline-minor-mode +1)))
  :bind (:map outline-navigation-repeat-map
			  ("<down>" . outline-next-visible-heading)
			  ("<up>" . outline-previous-visible-heading)
			  ("+" . outline-show-subtree)
			  ("-" . outline-hide-subtree)
			  ("*" . outline-show-subtree)
			  ("\\" . outline-hide-leaves)
			  ("/ s" . outline-show-by-heading-regexp)
			  ("/ h" . outline-hide-by-heading-regexp)
			  ;; ("/ s" . outline-show-by-heading-regexp)
			  ;; ("/ h" . outline-hide-by-heading-regexp)
			  )
  :hook (
		 ;; (find-file . outline-everywhere-minor-mode)
		 (archive-extract . outline-everywhere-minor-mode)
		 (apropos-mode . outline-everywhere-minor-mode)
		 (shortdoc-mode . outline-everywhere-minor-mode)

		 ;; xref buffers
		 (xref-after-update . (lambda ()
								(setq-local outline-minor-mode-highlight nil
											outline-default-state 1
											outline-default-rules '((match-regexp . "ChangeLog\\|test/manual/etags"))
											outline-minor-mode-cycle-filter nil)
								;; Already enabled by default in ‘xref--xref-buffer-mode’,
								;; but need to re-apply the settings above.
								(outline-minor-mode +1)))))
