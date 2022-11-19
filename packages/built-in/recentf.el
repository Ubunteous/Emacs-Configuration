;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               RECENTF              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; recentf stuff (such as files with C-x C-f? or M-x?)
(use-package recentf
  :straight (:type built-in)
  :defer t
  :init
  ;; (recentf-mode 1)
  :config
  (setq recentf-max-menu-items 25)

  (custom-set-variables
   '(recentf-save-file "~/.emacs.d/files/recentf/recentf"))
  :general
  ("C-c C-r" 'recentf-open-files))
