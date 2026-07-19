;; -*- lexical-binding: t; -*-

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

  :bind
  (:map vundo-mode-map
		("e"	. vundo-previous) ; 'vundo-stem-end

		("j" . vundo-diff-mark)
		("J" . vundo--inspect)
		("k" . vundo-stem-end)

		("i" . vundo-forward) ; 'vundo--inspect
		("m" . vundo-backward) ; 'vundo-diff-mark
		("n" . vundo-next))

  (:map personal-misc-bindings-keymap
		("u" . vundo)))
