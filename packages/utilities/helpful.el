;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               HELPFUL              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package helpful
  :defer t
  :config
  ;; always open help in the same space/window
  (add-to-list 'display-buffer-alist
			   '("*Help*" display-buffer-reuse-mode-window))
  :general
  ;; Note that the built-in `describe-function' includes both functions
  ;; and macros. `helpful-function' is functions only, so we provide
  ;; `helpful-callable' as a drop-in replacement.
  ("C-h f" #'helpful-callable)
  ("C-h v" #'helpful-variable)
  ("C-h k" #'helpful-key)

  ;; Lookup the current symbol at point. C-c C-d is a common keybinding
  ;; for this in lisp modes.
  ("C-c C-d" #'helpful-at-point)
  ;; ("C-c C-c" #'helpful-at-point)

  ;; Look up *F*unctions (excludes macros).

  ;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
  ;; already links to the manual, if a function is referenced there.
  ("C-h F" #'helpful-function)
  ("C-h C-S-k" #'describe-keymap)

  ;; By default, C-h C is bound to describe `describe-coding-system'. I
  ;; don't find this very useful, but it's frequently useful to only
  ;; look at interactive functions.
  ("C-h C" #'helpful-command)

  ;; isearch within helpful
  (:keymaps 'helpful-mode-map
			"s" 'swiper-isearch
			[remap revert-buffer] 'helpful-update))
