;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              HYPERBOLE             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; needs ibuffer and dired mode maps
(use-package hyperbole
  :defer t
  ;; :ensure (hyperbole :files ("*" "man/*" (:exclude "man")))
  :ensure (hyperbole :type git :host github :repo "emacsmirror/hyperbole"))
