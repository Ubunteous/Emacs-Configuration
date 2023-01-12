;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           MODAL EDITING            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package god-mode
  :defer t
  :general
  ("C-c c" 'god-mode-all)
  ;; (:keymaps 'god-local-mode-map
  ;; 	    "C-x C-z" 'undo
  ;; 	    "C-z" 'repeat)
  :config
  (defun god-update-cursor ()
    "Update my cursor"    
    (setq cursor-type
	  (if god-local-mode
	      'hollow
	    'box)))
  ;; cursor is the name of the face

  ;; (setq god-exempt-major-modes nil)
  ;; (setq god-exempt-predicates nil)
  :hook
  ((god-mode-enabled . god-update-cursor)
   (god-mode-disabled . god-update-cursor)))

;; god-exempt-major-mod may be useful to avoid problems

;; (use-package god-mode
;;   :preface
;;   (setq god-mode-cursor-color "#FFF8DC")
;;   :bind
;;   (("C-;" . god-mode-all)
;;    :map god-local-mode-map
;;    ("j" . avy-goto-word-or-subword-1))
;;   :hook
;;   (god-mode-enabled . (lambda ()
;;                         (set-face-attribute 'cursor nil :background god-mode-cursor-color)
;;                         ;; beacon-mode doesn't work properly with same color as cursor
;;                         (setq beacon-color (doom-darken god-mode-cursor-color 0.001))))
;;   (god-mode-disabled . (lambda ()
;;                          (set-face-attribute 'cursor nil :background fk/cursor-color)
;;                          ;; beacon-mode doesn't work properly with same color as cursor
;;                          (setq beacon-color (doom-darken fk/cursor-color 0.001)))))
