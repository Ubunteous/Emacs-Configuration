;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               COUNSEL              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package counsel
  :defer t
  :general
  ("M-x" 'counsel-M-x
   "M-y" 'counsel-yank-pop
   "C-x C-f" 'counsel-find-file)
  :config
  (setq counsel-find-file-ignore-regexp "[#~]$")) ; hide emacs files
;; (setq counsel-find-file-ignore-regexp "\\.elc\\'"))
;;("C-c c" . counsel-compile)) ; C-c c already used for org-mode
