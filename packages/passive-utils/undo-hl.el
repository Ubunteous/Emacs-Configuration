;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                UNDO-HL             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package undo-hl
  ;; :straight
  ;; (undo-hl :type git :host github :repo "casouri/undo-hl")
  :ensure (undo-hl :type git :host github :repo "casouri/undo-hl")
  :hook ((text-mode . undo-hl-mode)
         (prog-mode . undo-hl-mode))
  :custom-face
  (undo-hl-insert ((t (:background "#B6E63E"))))
  (undo-hl-delete ((t (:background "#FB2874"))))
  :custom (setq undo-hl-flash-duration 0.1)) ;; default 0.02
