;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                VUNDO               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package vundo
  :commands (vundo)
  ;; :straight (vundo :type git :host github :repo "casouri/vundo")
  :ensure (vundo :type git :host github :repo "casouri/vundo")
  :config
  ;; Take less on-screen space.
  (setq vundo-compact-display t)

  ;; ;; Better contrasting highlight.
  ;; ONLY USE ONE CUSTOM-SET
  ;; (custom-set-faces
  ;;  '(vundo-node ((t (:foreground "#808080"))))
  ;;  '(vundo-stem ((t (:foreground "#808080"))))
  ;;  '(vundo-highlight ((t (:foreground "#FFFF00")))))

  :general
  (:keymaps 'vundo-mode-map
			;; Use `HJKL` VIM-like motion, also Home/End to jump around.

			"d d" 'vundo-diff
			"d u" 'vundo-diff-unmark
			"d m" 'vundo-diff-mark

			"m" 'vundo-backward
			"<left>" 'vundo-backward
			"n" 'vundo-next
			"<down>" 'vundo-next
			"e" 'vundo-previous
			"<up>" 'vundo-previous
			"i" 'vundo-forward
			"<right>" 'vundo-forward

			"q" 'vundo-quit

			"s r" 'vundo-stem-root
			"s e" 'vundo-stem-end
			"s m" 'vundo-next-root

			"s s" 'vundo-save
			"s l" 'vundo-goto-last-saved
			"s n" 'vundo-goto-next-saved

			"C-g" 'vundo-quit
			"RET" 'vundo-confirm)
  ("C-c k" 'vundo))
