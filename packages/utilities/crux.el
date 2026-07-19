;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                CRUX                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package crux
  :defer t
  :config
  (setq crux-reopen-as-root t)
  :bind
  ("C-a" . crux-move-beginning-of-line)

  ;; unused but useful:
  ;; "C-c k" 'crux-kill-other-buffers
  ;; crux-open-with ; open visited file in default external program
  ;; crux-sudo-edit ; edit currently visited file as root

   ("C-k" . crux-smart-kill-line))
