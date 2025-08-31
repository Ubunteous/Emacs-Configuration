;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               DIFF-HL              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package diff-hl
  :defer t
  :custom-face
  (diff-hl-insert ((t (:foreground "gold" :background "gold")))) ;; #a6e12d
  (diff-hl-change ((t (:foreground "#f5c791" :background "#f5c791"))))
  (diff-hl-delete ((t (:foreground "#f82570" :background "#f82570"))))  
  ;; :init
  ;; (global-diff-hl-mode)
  ;; (diff-hl-dired-mode)
  :hook
  ((magit-pre-refresh . diff-hl-magit-pre-refresh)
   (magit-post-refresh . diff-hl-magit-post-refresh)
   (prog-mode . diff-hl-mode)))
