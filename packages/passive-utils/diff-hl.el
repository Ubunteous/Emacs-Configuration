;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               DIFF-HL              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package diff-hl
  :defer t
  :custom-face
  (diff-hl-insert ((t (:foreground "lime green" :background "lime green")))) ;; #a6e12d
  (diff-hl-change ((t (:foreground "orange" :background "orange"))))
  (diff-hl-delete ((t (:foreground "firebrick2" :background "firebrick2"))))
  ;; :init
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
  :hook
  ((magit-pre-refresh . diff-hl-magit-pre-refresh)
   (magit-post-refresh . diff-hl-magit-post-refresh)
   (prog-mode . diff-hl-mode)))
