;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               CONSULT              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Example configuration for Consult
(use-package consult
  :defer t
  :general
  ;; C-c bindings (mode-specific-map)
  ;; ("C-c h" 'consult-history)
  ;; ("C-c m" 'consult-mode-command)
  ;; ("C-c k" 'consult-kmacro)
  ;; C-x bindings (ctl-x-map)
  ("C-x M-:" 'consult-complex-command ;; orig. repeat-complex-command
   "C-x b" 'consult-buffer ;; orig. switch-to-buffer
   "C-x 4 b" 'consult-buffer-other-window ;; orig. switch-to-buffer-other-window
   "C-x 5 b" 'consult-buffer-other-frame ;; orig. switch-to-buffer-other-frame
   ;; "C-x r b" 'consult-bookmark ;; orig. bookmark-jump. adds a preview. create bookmark if missing
   "C-x p b" 'consult-project-buffer ;; orig. project-switch-to-buffer
   ;; Custom M-# bindings for fast register access
   "M-#" 'consult-register-load
   "M-'" 'consult-register-store ;; orig. abbrev-prefix-mark (unrelated)
   "C-M-#" 'consult-register
   ;; Other custom bindings
   "M-y" 'consult-yank-pop ;; orig. yank-pop
   "<help> a" 'consult-apropos ;; orig. apropos-command
   ;; M-g bindings (goto-map)
   "M-g e" 'consult-compile-error
   "M-g f" 'consult-flymake ;; Alternative: consult-flycheck
   "M-g g" 'consult-goto-line ;; orig. goto-line
   "M-g M-g" 'consult-goto-line ;; orig. goto-line
   "M-g o" 'consult-outline ;; Alternative: consult-org-heading
   "M-g m" 'consult-mark
   "M-g k" 'consult-global-mark
   "M-g i" 'consult-imenu
   "M-g I" 'consult-imenu-multi
   ;; M-s bindings (search-map)
   "M-s d" 'consult-find
   "C-c o" '(lambda () (interactive) (consult-find "~/org/"))
   "M-s D" 'consult-locate
   "M-s g" 'consult-grep
   "M-s G" 'consult-git-grep
   "M-s r" 'consult-ripgrep
   "M-s l" 'consult-line
   "M-s L" 'consult-line-multi
   "M-s m" 'consult-multi-occur
   "M-s k" 'consult-keep-lines
   "M-s u" 'consult-focus-lines
   ;; Isearch integration
   "M-s e" 'consult-isearch-history)
  (:keymaps 'isearch-mode-map
			"M-e" 'consult-isearch-history ;; orig. isearch-edit-string
			"M-s e" 'consult-isearch-history ;; orig. isearch-edit-string
			"M-s l" 'consult-line ;; needed by consult-line to detect isearch
			"M-s L" 'consult-line-multi) ;; needed by consult-line to detect isearch
  ;; Minibuffer history
  (:keymaps 'minibuffer-local-map
			"M-s" 'consult-history ;; orig. next-matching-history-element
			"M-r" 'consult-history) ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)
  ;; The :init configuration is always executed (Not lazy)
  :init
  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
		register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
		xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config
  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key (kbd "M-."))
  ;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key (kbd "M-.")
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; (kbd "C-+")

  ;; influences consult-line and consult-grep
  (setq consult-point-placement 'match-end))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          CONSULT-UTILITIES         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package consult-notes
;;   :defer t
;;   :config
;;   (setq consult-notes-file-dir-sources '(("Org"  ?o  "~/org/Projets/") ;; narrowing key o
;; 					 ("Alter" ?a "~/org/Alter/roam/" :hidden t))) ;; Set notes dir(s), see below
;;   ;; Set org-roam integration, denote integration, or org-heading integration e.g.:
;;   (setq consult-notes-org-headings-files '("~/org/Alter/roam/index/sequences.org"
;;                                            ;; "org/Alter/roam/index/"
;; 					   ))

;;   ;; search only for text files in denote dir
;;   ;; (setq consult-notes-denote-files-function (function denote-directory-text-only-files))

;;   (consult-notes-org-headings-mode)
;;   (when (locate-library "org-roam")
;;     (consult-notes-org-roam-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          CONSULT-FUNCTIONS         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; -*- lexical-binding: t -*-

(defun consult-line-delayed-async (async)
  (lambda (action)
    (if (and (stringp action) (not (equal action "")))
        (let ((lines))
          (with-current-buffer (window-buffer (minibuffer-selected-window))
            (save-excursion
              (goto-char (point-min))
              (while (search-forward-regexp action nil t 1)
                (push (consult--location-candidate
                       (consult--buffer-substring (line-beginning-position)
                                                  (line-end-position)
                                                  'fontify)
                       (point-marker) (line-number-at-pos))
                      lines))))
          (funcall async 'flush)
          (funcall async (nreverse lines)))
      (funcall async action))))

(defun consult-line-delayed ()
  (interactive)
  (consult--read
   (thread-first (consult--async-sink)
		 (consult--async-refresh-immediate)
		 (consult-line-delayed-async)
		 (consult--async-split)
		 (consult--async-throttle 0.01 0.01))
   :sort nil
   :lookup #'consult--lookup-location
   :state (consult--jump-state)))


(defun consult-info-emacs ()
  "Search through Emacs info pages."
  (interactive)
  (consult-info "emacs" "efaq" "elisp" "cl" "compat"))

(defun mode-name ()
  "Get the language associated to the current major-mode."
  (let ((mode (symbol-name major-mode)))
    (if (and (> (length mode) 6)
	     (equal (substring mode -7) "ts-mode"))
	(setq suffix-pos -8) ;; ts-mode
      (setq suffix-pos -5))

    (setq mode (substring (symbol-name major-mode) 0 suffix-pos))
    mode))


(defun consult-doc () ;; (start end)
  "Open the org doc of the appropriate language."
  ;; (interactive "r")
  (interactive)
  ;; only show 2 windows after function call
  (when (not (eq (length (window-list)) 1))
    (delete-other-windows))

  (let* ((doc-file (concat (mode-name) ".org"))

		 (dir (cond ((string-equal doc-file "clojure.org") "clojure/")
					(t "")))

		 (file-path (concat "~/org/Informatics/Languages/"
							dir
							doc-file))

		 ;; (region-text (when (region-active-p)
		 ;; 				(buffer-substring start end)))
		 )

	(catch 'nofile
      (when (not (file-exists-p file-path))
		(throw 'nofile (error (concat "File: " file-path " not found."))))

	  ;; needs to be chained or other-window won't work
	  (progn
		(split-window-right)
		(other-window 1)
		(if (get-buffer doc-file)
			(switch-to-buffer doc-file)
		  (find-file (concat file-path)))))
	
	(org-cycle-overview)
	(consult-org-heading)
	;; (insert region-text)
	(read-only-mode)
	;; (org-cycle)
	;; (use-local-map (copy-keymap org-mode-map))
	))

(use-package consult-todo
  :defer t
  :after consult
  :config
  (defconst consult-todo--narrow
	'((?t . "TODO")
      (?f . "FIXME")
      (?b . "DEBUG")
      (?p . "PROGRESS")
	  (?d . "DONE"))
	"Default mapping of narrow and keywords."))
