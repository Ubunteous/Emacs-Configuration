;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            COMMON-LISP             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package common-lisp-mode
  :defer t
  :elpaca nil
  :mode ("\\.cl\\'"))

(use-package slime
  :defer t
  :config
  (setq inferior-lisp-program "sbcl")
  :hook lisp-mode)

;; (use-package sly
;;   :defer t
;;   :config
;;   (setq inferior-lisp-program "sbcl")
;;   :hook lisp-mode)
