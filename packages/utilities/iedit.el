;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                IEDIT               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; M-D and M-R to delete and replace are useful
(use-package iedit
  :defer t
  :config
  (setq iedit-auto-save-occurrence-in-kill-ring nil)
  :general
  ("C-c e" 'iedit-replace))



(defun iedit-replace ()
  (interactive)
  (iedit-mode)
  (iedit-replace-occurrences)
  (iedit--quit))
