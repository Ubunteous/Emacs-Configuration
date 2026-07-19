;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             AGENT-SHELL            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package agent-shell
  :ensure t
  :config
  ;; ;; password auth (default)
  ;; (setq agent-shell-google-authentication
  ;;		(agent-shell-google-make-authentication :login t))

  ;; api key auth
  (setq agent-shell-google-authentication
		(agent-shell-google-make-authentication
		 :api-key (lambda ()
					;; (auth-source-pass-get "secret" "google-api-key")
					(auth-source-pick-first-password :host "googleapis.com"))))

  ;; default agent
  (setq agent-shell-preferred-agent-config (agent-shell-google-make-gemini-config))

  ;; ;; avoid configuring every agent via mcp config
  ;; (setq agent-shell-mcp-servers
  ;;		'(((name . "notion")
  ;;          (type . "http")
  ;;          (headers . [])
  ;;          (url . "https://mcp.notion.com/mcp"))))

  ;;;;;;;;;;;;
  ;; USEFUL ;;
  ;;;;;;;;;;;;

  ;; (setq agent-shell-agent-configs ...)
  ;; (setq agent-shell-file-completion-enabled t)
  ;; (setq agent-shell-highlight-blocks nil)
  ;; (setq agent-shell-session-strategy 'new-deferred)
  ;; (setq agent-shell-show-welcome-message t)
  ;; (setq agent-shell-text-file-capabilities t)
  ;; (setq agent-shell-thought-process-expand-by-default nil)
  ;; (setq agent-shell-user-message-expand-by-default nil)
  ;; (setq agent-shell-write-inhibit-minor-modes '(aggressive-indent-minor-mode))
  :bind (:map agent-shell-mode-map
			  ("RET" . newline)
			  ("C-c C-c" . shell-maker-submit)
			  ("C-c C-k" . agent-shell-interrupt)))
