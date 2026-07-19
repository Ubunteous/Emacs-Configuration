;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              AIDERMACS             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package aidermacs
  :defer t
  :config
  ;; ;; Set API_KEY in .bashrc, that will automatically picked up by aider or in elisp
  ;; (setenv "ANTHROPIC_API_KEY" "sk-...")
  ;; ;; defun my-get-openrouter-api-key yourself elsewhere for security reasons
  ;; (setenv "OPENROUTER_API_KEY" (my-get-openrouter-api-key))

  ;; (setq aidermacs-auto-accept-architect t)
  (setq aidermacs-backend 'vterm) ; defaults to comint
  ;; Enable file watching
  ;; (setq aidermacs-watch-files t)

  ;; Enable/disable showing diffs after changes (default: t)
  (setq aidermacs-show-diff-after-change t)

  ;; ;; Enable auto-commits
  ;; (setq aidermacs-auto-commits t)

  (setq aidermacs-exit-kills-buffer t)

  ;; ;; Always add these files as read-only to all Aidermacs sessions
  ;; ;; For files that exists outside the project directory
  ;; (setq aidermacs-global-read-only-files '("~/.aider/AI_RULES.md"))
  ;; ;; For files that exists within the project directory
  ;; (setq aidermacs-project-read-only-files '("CONVENTIONS.md" "README.md"))

  ;; See the Configuration section below
  (setq aidermacs-default-chat-mode 'architect)
  (setq aidermacs-default-model "sonnet")
  :bind (:map
		 personal-misc-bindings-keymap
			  ("i" . aidermacs-transient-menu)))
