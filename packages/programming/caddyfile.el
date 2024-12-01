;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              CADDYFILE             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package caddyfile-mode
  :defer t
  :mode (("Caddyfile\\'" . caddyfile-mode)
         ("caddy\\.conf\\'" . caddyfile-mode))
  :hook caddyfile-mode . (lambda ()
			   (setq-local tab-width 4)
			   (setq-local indent-tabs-mode nil)))
