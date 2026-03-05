;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               DIFF-HL              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package diff-hl
  :defer t
  :custom-face
  (diff-hl-insert ((t (:foreground "lime green" :background "lime green")))) ;; #a6e12d
  (diff-hl-change ((t (:foreground "orange" :background "orange"))))
  (diff-hl-delete ((t (:foreground "firebrick2" :background "firebrick2"))))
  :init
  (defvar-keymap diff-hl-keymap
	:doc "Keymap for diff-hl.")
  ;; (global-diff-hl-mode)
  ;; (diff-hl-dired-mode)
  :config
  (set-fringe-mode '(4 . 0))

  ;; (setq diff-hl-bmp-max-width 4)
  ;; (setq diff-hl-side 'right) ;; full right of editor
  ;; (setq diff-hl-auto-hide-margin t)
  ;; (setq diff-hl-draw-borders nil)

  (repeat-it diff-hl
			 '(("[" diff-hl-previous-hunk "prev")
			   ("]" diff-hl-next-hunk "next")))
  :general
  (:keymaps 'diff-hl-keymap
			"m" 'diff-hl-mark-hunk
			"]" 'diff-hl-next-hunk
			"*" 'diff-hl-show-hunk
			"S" 'diff-hl-stage-dwim
			"s" 'diff-hl-stage-some
			"n" 'diff-hl-revert-hunk
			"u" 'diff-hl-unstage-file
			"[" 'diff-hl-previous-hunk
			"=" 'diff-hl-diff-goto-hunk
			"}" 'diff-hl-show-hunk-next
			"r" 'diff-hl-set-reference-rev
			"{" 'diff-hl-show-hunk-previous
			"c" 'diff-hl-stage-current-hunk
			"R" 'diff-hl-reset-reference-rev)
  (:keymaps 'personal
			"l" diff-hl-keymap)
  :hook
  ;; note: diff-hl-dir(ed)-mode provides integrations with vc/dired
  ((magit-pre-refresh . diff-hl-magit-pre-refresh)
   (magit-post-refresh . diff-hl-magit-post-refresh)
   (prog-mode . diff-hl-mode)))
