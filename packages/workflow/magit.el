;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                MAGIT               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; remove last unmerged commit (set as unstaged change)
;; (magit-reset-soft "HEAD~1"))

;; git porcelaine
(use-package magit
  :defer t
  :config
  (setq magit-remote-add-set-remote.pushDefault nil))
