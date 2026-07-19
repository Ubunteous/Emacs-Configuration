;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               HELPFUL              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package helpful
  :defer t
  :init
  ;; always open help in the same space/window
  (add-to-list 'display-buffer-alist
			   ;; ori: display-buffer-reuse-mode-window))
			   ;; alt: (display-buffer-reuse-window display-buffer-pop-up-window) (inhibit-same-window . t))
			   '("*Help*" display-buffer-same-window))
  :config
  (defmacro peek-command (command next-mode)
	;; Make a new COMMAND which respects previous window layout.
	(let ((name (intern (format "peek-%s" command))))
	  `(defun ,name ()
		 (interactive)

		 ;; potential issue if using peek-command from next-mode with current-window-configuration as nil
		 (unless (string= (symbol-name major-mode) ,next-mode)
		   (setq peek--initial-window-configuration (current-window-configuration)))

		 (call-interactively #',command)

		 (when (string= (symbol-name major-mode) ,next-mode)
		   (local-set-key (kbd "q") (lambda () (interactive)
									  (kill-buffer (current-buffer))
									  (set-window-configuration peek--initial-window-configuration)))))))

  (peek-command helpful-key "helpful-mode")
  (peek-command helpful-command  "helpful-mode")
  (peek-command helpful-at-point "helpful-mode")
  (peek-command helpful-callable "helpful-mode")
  (peek-command helpful-function "helpful-mode")
  (peek-command helpful-variable "helpful-mode")
  ;; (peek-command helpful-symbol "helpful-mode")
  ;; (peek-command helpful-macro "helpful-mode")
  :bind
  ;; Note that the built-in `describe-function' includes both functions
  ;; and macros. `helpful-function' is functions only, so we provide
  ;; `helpful-callable' as a drop-in replacement.
  (:map help-map
		("f" . peek-helpful-callable)
		("v" . peek-helpful-variable)
		("k" . peek-helpful-key)
		;; ("S" #'peek-helpful-symbol)
		;; ("M" #'peek-helpful-macro)

		;; Look up *F*unctions (excludes macros).

		;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
		;; already links to the manual, if a function is referenced there.
		("F" . peek-helpful-function)
		("C-S-k" . describe-keymap)

		;; By default, C-h C is bound to describe `describe-coding-system'. I
		;; don't find this very useful, but it's frequently useful to only
		;; look at interactive functions.
		("C" . peek-helpful-command))

  (:map mode-specific-map
		;; ("C-c" #'helpful-at-point)

		;; Lookup the current symbol at point. C-c C-d is a common keybinding
		;; for this in lisp modes.
		("C-d" . peek-helpful-at-point))

  ;; isearch within helpful
  (:map helpful-mode-map
		("s" . swiper-isearch)
		([remap revert-buffer] . helpful-update)))
