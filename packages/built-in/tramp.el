;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                TRAMP               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; use with /ssh:host@domain:/path or /su::/path

(use-package tramp
  :defer t
  :ensure nil
  :config
  (setq tramp-verbose 6)
  (setq tramp-default-method "scp")
  (setq tramp-default-user nil)
  (setq tramp-default-host "nixos")
  (setq tramp-default-remote-shell "/bin/sh")

  (setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

  ;; tramp-default-user-alist
  ;; tramp-default-host-alist
  ;; tramp-default-method-alist
  )
