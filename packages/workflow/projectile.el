;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              PROJECTILE            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package projectile
  :defer t
  :init
  (setq
   projectile-cache-file "~/.emacs.d/files/projectile/projectile.cache"
   projectile-list-file "~/.emacs.d/files/projectile/projects"
   projectile-known-projects-file "~/.emacs.d/files/projectile/projectile.cache"
   )
  :config
  (projectile-mode +1)
  :general ("C-c p" '(keymap projectile-command-map)))
