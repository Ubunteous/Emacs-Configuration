;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              PRESCIENT             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package prescient
  :defer t
  :config
  (prescient-persist-mode +1)

  (custom-set-variables
   '(prescient-save-file "~/.emacs.d/files/prescient/prescient-save.el")))
