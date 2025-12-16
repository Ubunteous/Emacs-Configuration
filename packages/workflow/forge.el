;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                FORGE               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; MAKE A OAUTH TOKEN for github:
;; repo: grants full read/write access to private and public repositories.
;; user: grants access to profile information.
;; admin > read:org grants read-only access to organization membership. 

;; MAKE A OAUTH TOKEN for gitlab:
;; api: all or nothing

;; check emacs-pr-review for more

(use-package forge
  :ensure (:tag "v0.3.0")
  :after magit)
