;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               DIFF-HL              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package diff-hl
  :defer t
  :init
  (defvar-subkeymap personal-misc-bindings-keymap "l" diff-hl-keymap "Keymap for diff-hl.")
  ;; (global-diff-hl-mode)
  ;; (diff-hl-dired-mode)
  :config
  (set-face-attribute 'diff-hl-insert nil :foreground "lime green" :background "lime green") ;; #a6e12d
  (set-face-attribute 'diff-hl-change nil :foreground "orange" :background "orange")
  (set-face-attribute 'diff-hl-delete nil :foreground "firebrick2" :background "firebrick2")

  (set-fringe-mode '(4 . 0))

  ;; (setq diff-hl-bmp-max-width 4)
  ;; (setq diff-hl-side 'right) ;; full right of editor
  ;; (setq diff-hl-auto-hide-margin t)
  ;; (setq diff-hl-draw-borders nil)

  (repeat-it diff-hl
			 '(("[" diff-hl-previous-hunk "prev")
			   ("]" diff-hl-next-hunk "next")))
  :bind
  (:map diff-hl-keymap
		("m" . diff-hl-mark-hunk)
		("]" . diff-hl-next-hunk)
		("*" . diff-hl-show-hunk)
		("S" . diff-hl-stage-dwim)
		("s" . diff-hl-stage-some)
		("n" . diff-hl-revert-hunk)
		("u" . diff-hl-unstage-file)
		("[" . diff-hl-previous-hunk)
		("=" . diff-hl-diff-goto-hunk)
		("}" . diff-hl-show-hunk-next)
		("r" . diff-hl-set-reference-rev)
		("{" . diff-hl-show-hunk-previous)
		("c" . diff-hl-stage-current-hunk)
		("R" . diff-hl-reset-reference-rev))
  :hook
  ;; note: diff-hl-dir(ed)-mode provides integrations with vc/dired
  ((magit-pre-refresh . diff-hl-magit-pre-refresh)
   (magit-post-refresh . diff-hl-magit-post-refresh)
   (prog-mode . diff-hl-mode)))
