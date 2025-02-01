;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             SMARTPARENS            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; learn it with sp-cheat-sheet
(use-package smartparens
  :defer t
  :config
  (require 'smartparens-config)
  :hook (prog-mode . smartparens-strict-mode))
