;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               NOTDEFT              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package notdeft
  :defer t
  ;; :straight (:type git :host github :repo "hasu/notdeft" :files ("*.el" "xapian"))
  :ensure (:type git :host github :repo "hasu/notdeft" :files ("*.el" "xapian"))
  :config
  (setq notdeft-directories '("~/org/")))
