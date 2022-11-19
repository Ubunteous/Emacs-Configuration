;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               VERTICO              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package vertico
  ;; load every extension
  :straight (:files (:defaults "extensions/vertico-directory.el"))
  :defer t
  :init
  (vertico-mode)
  :config
  (setq read-file-name-completion-ignore-case t
	read-buffer-completion-ignore-case t
	completion-ignore-case t)
  :general
  (:keymaps 'vertico-map
	    "?" 'minibuffer-completion-help
	    "M-RET" 'minibuffer-force-complete-and-exit
	    "M-TAB" 'minibuffer-complete))

;; Different scroll margin
;; (setq vertico-scroll-margin 0)

;; Show more candidates
;; (setq vertico-count 20)

;; Grow and shrink the Vertico minibuffer
;; (setq vertico-resize t)

;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
;; (setq vertico-cycle t)

;; Enable vertico-multiform
;; (vertico-multiform-mode)

;; Configure the display per command.
;; Use a buffer with indices for imenu
;; and a flat (Ido-like) menu for M-x.
;; (setq vertico-multiform-commands
;; '((consult-imenu buffer indexed)
;;  (execute-extended-command unobtrusive)))

;; Configure the display per completion category.
;; Use the grid display for files and a buffer
;; for the consult-grep commands.
;; (setq vertico-multiform-categories
;; 	'((file grid)
;;      (consult-grep buffer)))




;; Configure directory extension.
(use-package vertico-directory
  :defer t
  :straight nil
  ;; I placed straight and it's repos in an unexpected place
  :load-path "files/straight/straight/repos/vertico/extensions/"
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
  :straight (:type built-in)
  :init
  (setq savehist-file "~/.emacs.d/files/savehist.el")
  (savehist-mode))



;; A few more useful configurations...
(use-package emacs
  :straight (:type built-in)
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
