;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          MULTIPLE CURSORS          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package multiple-cursors
  :defer t
  :init
  (defvar-keymap multiple-cursors-keymap
	:doc "Keymap for multiple cursors.")
  :config
  (setq mc/cmds-to-run-once '(meow-next
							  meow-prev
							  meow-left
							  meow-right
							  meow-insert
							  meow-normal-mode))
  :general
  ;; poor interactions with meow
  (:keymaps 'multiple-cursors-keymap
			"a a" 'mc/mark-all-dwim
			"a t" 'mc/mark-all-like-this-dwim
			"a s" 'mc/mark-all-symbols-like-this
			"a w" 'mc/mark-all-words-like-this

			"e b" 'mc/edit-beginnings-of-lines
			"e e" 'mc/edit-ends-of-lines
			"e l" 'mc/edit-lines

			"k" 'mc/mark-pop
			"l" 'mc/edit-lines

			"n c" 'mc/cycle-backward
			"n n" 'mc/mark-next-like-this
			"n g" 'mc/skip-to-next-like-this
			"n l" 'mc/mark-next-lines
			"n s" 'mc/mark-next-symbol-like-this
			"n u" 'mc/unmark-next-like-this
			"n w" 'mc/mark-next-word-like-this

			"p c" 'mc/cycle-forward
			"p p" 'mc/mark-previous-like-this
			"p g" 'mc/skip-to-previous-like-this
			"p l" 'mc/mark-previous-lines
			"p s" 'mc/mark-previous-symbol-like-this
			"p u" 'mc/unmark-previous-like-this
			"p w" 'mc/mark-previous-word-like-this

			"q" 'mc/keyboard-quit
			"s" 'mc/sort-regions
			"v" 'mc/vertical-align

			"x" 'mc/mark-more-like-this-extended

			"#" 'mc/insert-numbers
			"." 'mc/repeat-command
			"SPC" 'mc/vertical-align-with-space)

  (:keymaps 'personal
			"m" (cons "cursor" multiple-cursors-keymap)))
