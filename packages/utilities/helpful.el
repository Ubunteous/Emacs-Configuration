;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               HELPFUL              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package helpful
  :defer t
  :config
  ;; always open help in the same space/window
  (add-to-list 'display-buffer-alist
			   ;; ori: display-buffer-reuse-mode-window))
			   ;; alt: (display-buffer-reuse-window display-buffer-pop-up-window) (inhibit-same-window . t))
			   '("*Help*" display-buffer-same-window))

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
  :general
  ;; Note that the built-in `describe-function' includes both functions
  ;; and macros. `helpful-function' is functions only, so we provide
  ;; `helpful-callable' as a drop-in replacement.
  ("C-h f" #'peek-helpful-callable)
  ("C-h v" #'peek-helpful-variable)
  ("C-h k" #'peek-helpful-key)
  ;; ("C-h S" #'peek-helpful-symbol)
  ;; ("C-h M" #'peek-helpful-macro)

  ;; Lookup the current symbol at point. C-c C-d is a common keybinding
  ;; for this in lisp modes.
  ("C-c C-d" #'peek-helpful-at-point)
  ;; ("C-c C-c" #'helpful-at-point)

  ;; Look up *F*unctions (excludes macros).

  ;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
  ;; already links to the manual, if a function is referenced there.
  ("C-h F" #'peek-helpful-function)
  ("C-h C-S-k" #'describe-keymap)

  ;; By default, C-h C is bound to describe `describe-coding-system'. I
  ;; don't find this very useful, but it's frequently useful to only
  ;; look at interactive functions.
  ("C-h C" #'peek-helpful-command)

  ;; isearch within helpful
  (:keymaps 'helpful-mode-map
			"s" 'swiper-isearch
			[remap revert-buffer] 'helpful-update))
