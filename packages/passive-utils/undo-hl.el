;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                UNDO-HL             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package undo-hl
  :defer t
  :diminish
  :ensure (undo-hl :type git :host github :repo "casouri/undo-hl")
  :config
  (setq undo-hl-flash-duration 0.1) ;; default 0.02
  (set-face-attribute 'undo-hl-insert nil :background "#B6E63E")
  (set-face-attribute 'undo-hl-delete nil :background "#FB2874")
  :hook ((text-mode . undo-hl-mode)
		 (prog-mode . undo-hl-mode)))
