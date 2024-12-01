;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               DOCKER               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package docker
  :defer t
  :general
  ("C-c p" 'docker)
  :config
  (setq docker-command "podman"
	docker-compose-command "podman-compose"))


(use-package dockerfile-ts-mode
  :defer t
  :ensure nil
  :mode ("\\Containerfile\\'" "\\Dockerfile\\'"))
