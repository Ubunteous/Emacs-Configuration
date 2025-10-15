;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             AGENT-SHELL            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package shell-maker
  :defer t
  :ensure (shell-maker :type git :host github :repo "xenodium/shell-maker"))

(use-package acp
  :defer t
  :ensure (acp :type git :host github :repo "xenodium/acp.el"))

(use-package agent-shell
  :defer t
  :ensure (agent-shell :type git :host github :repo "xenodium/agent-shell"))
