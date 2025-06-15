;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               VERTICO              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package vertico
  ;; load every extension
  ;; :straight (:files (:defaults "extensions/vertico-directory.el"))
  :ensure (vertico :files (:defaults "extensions/*"))
  :defer t
  :init
  (vertico-mode)
  :config
  (setq read-file-name-completion-ignore-case t
		read-buffer-completion-ignore-case t
		completion-ignore-case t)
  
  (defun vertico-insert ()
    "Insert current candidate in minibuffer or a space if no candidate found."
    (interactive)
    (if (> vertico--total 0)
		(let ((vertico--index (max 0 vertico--index)))
		  (insert (prog1 (vertico--candidate) (delete-minibuffer-contents))))
      (insert " ")))

  (defun my-minibuffer-setup ()
    (set (make-local-variable 'face-remapping-alist)
		 '((default :height 1.25))))
  :general
  (:keymaps 'vertico-map
			"?" 'minibuffer-completion-help
			"C-<return>" 'vertico-exit-input ;; ignore completion
			"M-RET" 'minibuffer-force-complete-and-exit
			;; risky but if it works it can be confortable
			"SPC" 'vertico-insert
			"C-SPC" '(lambda () (interactive) (insert " "))
			"M-TAB" 'minibuffer-complete)
  :hook
  (minibuffer-setup . my-minibuffer-setup))

;; (use-package vertico-multiform
;;   :defer t
;; :ensure nil
;;   :after vertico
;;   :config
;;   (setq vertico-multiform-commands
;; 	'((consult-line
;;            posframe
;;            (vertico-posframe-poshandler . posframe-poshandler-frame-top-center)
;;            (vertico-posframe-border-width . 10)
;;            ;; NOTE: This is useful when emacs is used in both in X and
;;            ;; terminal, for posframe do not work well in terminal, so
;;            ;; vertico-buffer-mode will be used as fallback at the
;;            ;; moment.
;;            (vertico-posframe-fallback-mode . vertico-buffer-mode))
;;           (t posframe)))
;;   (vertico-multiform-mode 1))


;; (use-package vertico-posframe
;;   :defer t
;;   :after vertico
;;   ;; :ensure (vertico-posframe :type git :host github :repo "tumashu/vertico-posframe ")
;;   :init
;;   (vertico-posframe-mode 1)
;;   :custom-face
;;   (vertico-posframe-border ((nil (:background "MediumPurple4"))))
;;   :config
;;   ;; (setq vertico-posframe-height 25)
;;   (setq vertico-posframe-width 10))


;; ;; avy like shortcuts to insert completion candidate
;; (use-package vertico-quick
;;   :defer t
;; :ensure nil
;;   :after vertico
;;   :general (:keymaps 'vertico-map
;; 		     "M-q" 'vertico-quick-insert
;; 		     "C-q" 'vertico-quick-exit))

;; Configure directory extension.
(use-package vertico-directory
  :defer t
  ;; :straight nil
  :ensure nil
  ;; :ensure (:files (:defaults "extensions/vertico-directory.el"))
  ;; I placed straight and it's repos in an unexpected place
  ;; :load-path "files/straight/straight/repos/vertico/extensions/"
  :after vertico
  ;; More convenient directory navigation commands
  :general (:keymaps 'vertico-map
		     "RET" 'vertico-directory-enter
		     "DEL" 'vertico-directory-delete-char
		     "M-DEL" 'vertico-directory-delete-word)
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))



;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  ;; :straight (:type built-in)
  :ensure nil
  :init
  (setq savehist-file "~/.emacs.d/files/savehist.el")
  (savehist-mode))



;; A few more useful configurations...
(use-package emacs
  ;; :straight (:type built-in)
  :ensure nil
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))


;;;;;;;;;;;;;;;;;;
;; MORE CONFIGS ;;
;;;;;;;;;;;;;;;;;;

;; Different scroll margin
;; (setq vertico-scroll-margin 0)

;; Show more candidates
;; (setq vertico-count 20)

;; Grow and shrink the Vertico minibuffer
;; (setq vertico-resize t)

;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
;; (setq vertico-cycle t)

;; ;; Configure directory extension.
;; (use-package vertico-multiform
;;   :defer t
;; :ensure nil
;;   ;; :ensure (:files (:defaults "extensions/vertico-multiform.el"))
;;   :after vertico
;;   :config  
;;   (add-to-list 'vertico-multiform-categories
;;                '(jinx grid (vertico-grid-annotate . 20)))
;;   (vertico-multiform-mode 1)
;;   )

;; (use-package vertico-grid
;;   :defer t
;; :ensure nil
;;   ;; :ensure (:files (:defaults "extensions/vertico-grid.el"))
;;   :after vertico
;;   ;; :config
;;   ;; (setq vertico-multiform-categories
;;   ;; 	'((file grid)
;;   ;;      (consult-grep buffer)))
;;   )

;; ;; Configure the display per command.
;; ;; Use a buffer with indices for imenu
;; ;; and a flat (Ido-like) menu for M-x.
;; ;; (setq vertico-multiform-commands
;; ;; '((consult-imenu buffer indexed)
;; ;;  (execute-extended-command unobtrusive)))

;; ;; Configure the display per completion category.
;; ;; Use the grid display for files and a buffer
;; ;; for the consult-grep commands.
;; (use-package vertico-grid
;;   :defer t
;;   :config
;;   ;; (setq vertico-multiform-categories
;;   ;; 	'((file grid)
;;   ;;      (consult-grep buffer)))
;;   )
