;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                MAGIT               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; remove last unmerged commit (set as unstaged change)
;; (magit-reset-soft "HEAD~1"))

;; (use-package compat
;;   :defer t
;;   :ensure (compat :type git :host github :repo "emacs-compat/compat"))

(use-package transient
  :defer t
  :ensure (transient :type git :host github :repo "magit/transient")
  :config
  (transient-define-prefix hrm-help-transient ()
	"Help commands."
	["Help Commands"
	 ["Mode & Bindings"
	  ("m" "Mode" describe-mode)
	  ("M" "Minor Modes" consult-minor-mode-menu)
	  ("b" "Major Bindings" which-key-show-full-major-mode)
	  ("B" "Minor Bindings" which-key-show-full-minor-mode-keymap)
	  ("d" "Descbinds" describe-bindings) ; or embark-bindings
	  ("t" "Top Bindings  " which-key-show-top-level)
	  ]
	 ["Describe"
	  ("C" "Command" helpful-command)
	  ("f" "Function" helpful-callable)
	  ("v" "Variable " helpful-variable)
	  ("k" "Key" helpful-key)
	  ("s" "Symbol" helpful-symbol)
	  ("l" "Library" apropos-library)
	  ]
	 ["Info on"
	  ("C-c" "Command" Info-goto-emacs-command-node)
	  ("C-f" "Function" info-lookup-symbol)
	  ("C-v" "Variable" info-lookup-symbol) ; fails if transient-detect-key-conflicts
	  ("C-k" "Key" Info-goto-emacs-key-command-node)
	  ("C-s" "Symbol" info-lookup-symbol)
	  ]
	 ["Goto Source"
	  ""
	  ("F" "Function" find-function-other-frame)
	  ("V" "Variable" find-variable-other-frame)
	  ("K" "Key" find-function-on-key-other-frame)
	  ""
	  ("L" "Library" find-library-other-frame)
	  ]
	 ["Apropos"
	  ("ac" "Command" apropos-command)
	  ("af" "Function" apropos-function)
	  ("av" "Variable" apropos-variable)
	  ("aV" "Value" apropos-value)
	  ("aL" "Local Value" apropos-local-value)
	  ("ad" "Documentation" apropos-documentation)
	  ]
	 ]
	[
	 ["Internals"
	  ("I" "Input Method" describe-input-method)
	  ("G" "Language Env" describe-language-environment)
	  ("S" "Syntax" describe-syntax)
	  ("T" "Categories" describe-categories)
	  ("O" "Coding System" describe-coding-system)
	  ("o" "Coding Briefly" describe-current-coding-system-briefly)
	  ("T" "Display Table" describe-current-display-table)
	  ("e" "Echo Messages" view-echo-area-messages)
	  ("H" "Lossage" view-lossage)
	  ]
	 ["Describe"
	  ("." "At Point" helpful-at-point)
	  ("c" "Key Short" describe-key-briefly)
	  ("p" "Key Map" describe-keymap)
	  ("A" "Face" describe-face)
	  ("i" "Icon" describe-icon)
	  ("w" "Where Is" where-is)
	  ("=" "Position" what-cursor-position)
	  ("g" "Shortdoc" shortdoc-display-group)
	  ]
	 ["Info Manuals"
	  ("C-i" "Info" info)
	  ("C-4" "Other Window" info-other-window)
	  ("C-e" "Emacs" info-emacs-manual)
	  ;; ("C-l" "Elisp" info-elisp-manual)
	  ("C-r" "Pick Manual" info-display-manual)
	  ]
	 ["External"
	  ("N" "Man" consult-man)
	  ;; ("W" "Dictionary" lookup-word-at-point)
	  ;; ("D" "Dash" dash-at-point)
	  ]
	 ]
	)

  (transient-define-prefix motion-transient ()
	["Motion"
	 ["mark"
	  ("C-<SPC>" "set-mark-command" set-mark-command)
	  ("C-x C-x" "Swap point/mark" exchange-point-and-mark)

	  ;; pop-to-buffer
	  ;; pop-to-mark-command
	  ("C-x C-@" "pop-global-mark" pop-global-mark)
	  ("M-g m" "consult-mark" consult-mark)
	  ("C-x C-p" "mark-page" mark-page)
	  ("C-M-@" "mark-sexp" mark-sexp)
	  ("C-M-h" "mark-defun" mark-defun)

	  ;; mark-paragraph
	  ("C-x h" "mark-whole-buffer" mark-whole-buffer)
	  ]
	 ["xref"
	  ("C-M-," "xref-go-forward" xref-go-forward)
	  ("M-;" "xref-find-definition" xref-find-definitions)
	  ("M-?" "xref-find-ref" xref-find-references)
	  ("C-M-." "xref-find-apropos" xref-find-apropos)
	  ]
	 ["hideshow"
	  ("C-c @ C-t" "hs-hide-all" hs-hide-all)
	  ("C-c @ C-a" "hs-show-all" hs-show-all)
	  ("C-c @ C-e" "hs-toggle-hiding" hs-toggle-hiding)
	  ("C-c @ C-d" "hs-hide-block" hs-hide-block)
	  ("C-c @ C-l" "hs-hide-level" hs-hide-level)
	  ("C-c @ C-s" "hs-show-block" hs-show-block)
	  ]
	 ["avy"
	  ("c" "Go to char" avy-goto-char)
	  ("d" "Go to char 2" avy-goto-char2)
	  ("e" "Go to end of line" avy-goto-end-of-line)
	  ("i" "isearch" avy-isearch)
	  ("l" "Go to line" avy-goto-line)
	  ("m" "Pop mark" avy-pop-mark)
	  ("n" "Next" avy-next)
	  ("p" "Previous" avy-prev)
	  ("t" "Timer" avy-goto-char-timer)
	  ]
	 ]
	)
  :general
  ("C-o" 'motion-transient) ;; shadows open-line
  ("C-S-h" 'hrm-help-transient)
  ("C-c i v" 'vim-transient)
  :hook
  (prog-mode . hs-minor-mode))

(use-package magit
  ;; fixes emacs 29 issue with old transient package (dependency)
  ;; :ensure (:tag "v3.3.0")
  ;; :after compat
  :after transient
  :defer t
  :custom-face
  (smerge-markers ((t (:background "deep sky blue"))))
  (smerge-lower ((t (:background "brown"))))
  :config
  ;; ;; updates modeline with branch. higher cost than hook
  ;; (setq auto-revert-check-vc-info t
  ;;       auto-revert-interval 10)

  ;; show  all options in transient
  (setq transient-default-level 7)

  ;; full screen magit
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (setq magit-bury-buffer-function 'magit-restore-window-configuration)
  
  (setq magit-remote-add-set-remote.pushDefault nil)
  (setopt magit-format-file-function #'magit-format-file-all-the-icons)

  ;; Friendly reminder that your message is too long.
  ;; If you need more text use Tim Pope's recommendation:
  ;; + Consider first line as email text subject (summary)
  ;; + Then insert blank line (plays well with git log/rebase --interactive)
  ;; + Use optionally the following lines as an email body (you can use bullets)
  ;; + Try to not go over 72 chars (for 80 chars terms/pagers + 4*2 chars margin)
  (setq git-commit-summary-max-length 50)

  ;; (defun ora-nextmagit-simple-commit ()
  ;; 	;; commit file at point with message containing file+suffix
  ;; 	(interactive)
  ;; 	(magit-with-toplevel
  ;;     (save-window-excursion
  ;; 		(let* ((item (magit-current-section))
  ;; 			   (fname (oref item value))
  ;; 			   action log)
  ;; 		  (ignore-errors
  ;; 			(magit-stage))
  ;; 		  (search-forward fname)
  ;; 		  (setq action (if (looking-back "^new file.*" (line-beginning-position))
  ;; 						   "Add"
  ;; 						 "Update"))
  ;; 		  (magit-commit-add-log)
  ;; 		  (while (not (setq log (magit-commit-message-buffer)))
  ;; 			(sit-for 0.01))
  ;; 		  (with-current-buffer log
  ;; 			(insert action)
  ;; 			(with-editor-finish nil))))))

  ;; (defun ora-nextmagit-copy-message ()
  ;; 	;; copy commit message
  ;; 	(interactive)
  ;; 	(let* ((item (magit-current-section))
  ;; 		   (hash (oref item value)))
  ;;     (kill-new
  ;;      (shell-command-to-string
  ;; 		(format "git log -n 1 --pretty=format:%%s %s" hash)))))

  (defun magit-branch-and-checkout (branch start-point &optional args)
	"Create and checkout BRANCH at branch or revision START-POINT."
	(interactive (append (list
						  (magit-read-string-ns "Create and checkout branch named")
						  "HEAD")
						 (list (magit-branch-arguments))))
	(if (string-match-p "^stash@{[0-9]+}$" start-point)
		(magit-run-git "stash" "branch" branch start-point)
      (magit-call-git "checkout" args "-b" branch start-point)
      (magit-branch-maybe-adjust-upstream branch start-point)
      (magit-refresh)))
  
  (defun ora-magit-parent-commit ()
	(interactive)
	(let* ((commit (save-excursion
					 (goto-char (point-min))
					 (buffer-substring-no-properties (point-min) (line-end-position))))
		   (parent (shell-command-to-string (format "git get-merge %s" commit))))
      (when parent
		(let ((parent-commit (and (string-match "commit \\(.*\\)" parent)
								  (match-string 1 parent))))
		  (magit-show-commit parent-commit)))))

  ) ;; for v4.3.0+

(use-package magit-blame-color-by-age
  :ensure (magit-blame-color-by-age :type git :host github :repo "jdtsmith/magit-blame-color-by-age")
  :after magit
  :config (magit-blame-color-by-age-mode))

;; (defadvice vc-git-mode-line-string (after plus-minus (file) compile activate)
;;   (setq ad-return-value
;; 	(concat ad-return-value
;; 		(let ((plus-minus (vc-git--run-command-string
;; 				   file "diff" "--numstat" "--")))
;; 		  (and plus-minus
;; 		       (string-match "^\\([0-9]+\\)\t\\([0-9]+\\)\t" plus-minus)
;; 		       (format " +%s-%s" (match-string 1 plus-minus) (match-string 2 plus-minus)))))))
