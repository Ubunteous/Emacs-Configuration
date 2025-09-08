;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                CRUX                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package crux
  :defer t
  :config
  (setq crux-reopen-as-root t)
  :general
  ("C-a" 'crux-move-beginning-of-line
   ;; "C-c k" 'crux-kill-other-buffers
   "C-k" 'crux-smart-kill-line))
