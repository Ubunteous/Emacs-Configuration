;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               CONSULT              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Example configuration for Consult
(use-package consult
  :defer t
  :custom-face
  (consult-preview-match ((t (:foreground "#272821" :background "light sea green"))))
  (consult-preview-line ((t (:background "unspecified"))))
  :init
  (defvar-keymap consult-search-keymap
	:doc "Keymap for search functions in consult.")
  (defvar-keymap consult-goto-keymap
	:doc "Keymap for motion functions in consult.")
  (defvar-keymap consult-keymap
	:doc "Keymap for general functions in consult.")

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

   ;; ;; do not seem to exist
   ;; consult--source-bookmark consult--source-file-register
   ;; consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key (kbd "M-.")
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; (kbd "C-+")

  ;; influences consult-line and consult-grep
  (setq consult-point-placement 'match-end)
  :general
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

   "C-x r s" 'consult-register-store ;; shadows copy-to-register
   "C-x r i" 'consult-register ;; shadows insert-register

   "C-c y" consult-goto-keymap
   "C-c u" consult-search-keymap)

  (:keymaps 'consult-keymap
			"a" 'consult-org-agenda
			"b" 'consult-bookmark
			"d" 'consult-find
			"D" 'consult-locate
			"e" 'consult-compile-error
			"f" 'consult-flymake ;; Alternative: consult-flycheck
			"F" 'consult-recent-file
			"g" 'consult-goto-line ;; orig. goto-line
			"G" 'consult-goto-line ;; orig. goto-line
			"h" 'consult-doc
			"H" 'consult-man
			"C-h" 'consult-info
			"S-h" 'consult-info-emacs
			"i" 'consult-imenu
			"I" 'consult-imenu-multi
			"C-i" 'consult-isearch-history
			"k" 'consult-keep-lines
			"K" 'consult-kmacro
			"l" 'consult-line
			"L" 'consult-line-multi
			"m" 'consult-mark
			"M" 'consult-global-mark
			"o" 'consult-outline ;; Alternative: consult-org-heading
			"O" 'consult-multi-occur
			;; "r" 'consult-grep
			"r" 'consult-ripgrep
			;; "R" 'consult-git-grep
			"R" 'consult-org-dir
			"s" 'consult-register ;; better interface than -load
			"S" 'consult-register-store
			"u" 'consult-focus-lines)

  (:keymaps 'consult-goto-keymap
			"e" 'consult-compile-error
			"f" 'consult-flymake ;; Alternative: consult-flycheck
			"g" 'consult-goto-line ;; orig. goto-line
			"G" 'consult-goto-line ;; orig. goto-line
			"i" 'consult-imenu
			"I" 'consult-imenu-multi
			"k" 'consult-global-mark
			"m" 'consult-mark
			"o" 'consult-outline) ;; Alternative: consult-org-heading
  (:keymaps 'consult-search-keymap
			;; M-s bindings (search-map)
			"e" 'consult-isearch-history
			"d" 'consult-find
			"D" 'consult-locate
			"g" 'consult-grep
			"G" 'consult-git-grep
			"k" 'consult-keep-lines
			"l" 'consult-line
			"L" 'consult-line-multi
			"m" 'consult-multi-occur
			"o" 'consult-org-dir
			"r" 'consult-ripgrep
			"u" 'consult-focus-lines)
  (:keymaps 'isearch-mode-map
			"M-e" 'consult-isearch-history ;; orig. isearch-edit-string
			"M-s e" 'consult-isearch-history ;; orig. isearch-edit-string
			"M-s l" 'consult-line ;; needed by consult-line to detect isearch
			"M-s L" 'consult-line-multi) ;; needed by consult-line to detect isearch
  ;; Minibuffer history
  (:keymaps 'minibuffer-local-map
			"M-s" 'consult-history ;; orig. next-matching-history-element
			"M-r" 'consult-history) ;; orig. previous-matching-history-element
  (:keymaps 'personal
			"c" (cons "consult" consult-keymap)
			"r" 'consult-doc)
  :hook
  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  (completion-list-mode . consult-preview-at-point-mode))

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

(defun consult-org-dir ()
  (interactive)
  (consult-fd "~/org/"))

;;;;;;;;;;;;;;;;;
;; CONSULT DOC ;;
;;;;;;;;;;;;;;;;;

(defvar consult-doc-dir "~/org/Informatics/Languages/")

(defvar consult-doc--mode-mappings '((bash . "sh")
									 (emacs-lisp . "elisp")
									 (clojure . "clojure/clojure.org")))

(defun consult--doc-mode-name ()
  "Get the language associated to the current major-mode."
  (let* ((mode-symbol (symbol-name major-mode)) ; from doc: never alter symbol-name directly
		 (mode-name (thread-last
					  mode-symbol
					  (string-remove-suffix "-mode")
					  (string-remove-suffix "-ts"))))
	(or (alist-get (intern mode-name) consult-doc--mode-mappings)
		mode-name)))

(defun consult--doc-prompt-file ()
  ;; Ask for a documentation filename for specific mode.
  (completing-read "Choose a documentation file"
				   (mapcar 'cdr consult-doc--mode-mappings)))

(defun consult-doc (arg)
  "Open the org doc of the appropriate language."
  (interactive "P")

  (let* ((mode (if current-prefix-arg
				   (consult--doc-prompt-file)
				 (consult--doc-mode-name)))
		 (doc-file (concat mode ".org"))
		 (filepath (concat consult-doc-dir doc-file)))

	(catch 'nofile
	  (when (not (file-exists-p filepath))
		(throw 'nofile (error (concat "File: " filepath " not found\nConsider adding a consult-doc mapping for " (symbol-name major-mode))))))

	(if (get-buffer doc-file)
		(switch-to-buffer doc-file)
	  (find-file filepath))

	(progn
	  (org-cycle-overview)
	  (consult-org-heading)

	  (org-show-subtree)
	  (forward-line 2)
	  (read-only-mode))))

;;;;;;;;;;;;;;;;;;;
;; CONSULT TO DO ;;
;;;;;;;;;;;;;;;;;;;

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
