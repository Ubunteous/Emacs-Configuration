;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               OB-NIX               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ob-nix
  :defer t
  :config
  (setq ob-nix-command "nix-instantiate --strict"))
