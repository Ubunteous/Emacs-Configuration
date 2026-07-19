;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               DOCKER               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package docker
  :defer t
  :bind ("C-c c" . docker)
  :config
  (setq docker-command "podman"
	docker-compose-command "podman-compose"))


(use-package dockerfile-ts-mode
  :defer t
  :ensure nil
  :mode ("\\Containerfile\\'" "\\Dockerfile\\'"))
