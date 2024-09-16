;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              PRESCIENT             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package prescient
  :defer t
  :config
  (prescient-persist-mode +1)

  ;; USED TO BE A CUSTOM SET
  (setq prescient-save-file "~/.emacs.d/files/prescient/prescient-save.el"))
