;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            CHATGPT-SHELL           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package shell-maker
  :defer)

(use-package chatgpt-shell
  :defer t
  :config
  (setq chatgpt-shell-model-version "gemini-2.5-flash")

  ;; ~/.authinfo: machine api.openai.com password OPENAI_KEY
  ;; lazy loaded via lambda (prevents unexpected passphrase prompt)
  (setq chatgpt-shell-openai-key
		(lambda ()
		  (auth-source-pick-first-password :host "api.openai.com")))

  (setq chatgpt-shell-google-key
		(lambda ()
		  (auth-source-pick-first-password :host "googleapis.com")))


  ;;;;;;;;;;;;
  ;; USEFUL ;;
  ;;;;;;;;;;;;

  ;; (setq chatgpt-shell-models ...)
  ;; (setq chatgpt-shell-insert-dividers nil) ; between prompt / response
  ;; (setq chatgpt-shell-root-path "~/.cache/emacs")
  ;; (setq chatgpt-shell-system-prompts ...)
  ;; (setq chatgpt-shell-default-prompts ...)
  ;; (setq chatgpt-shell-openai-reasoning-effort "medium")

  ;;;;;;;;;;;;;
  ;; HEADERS ;;
  ;;;;;;;;;;;;;

  ;; chatgpt-shell-babel-headers
  ;; chatgpt-shell-prompt-header-write-git-commit
  ;; chatgpt-shell-prompt-header-generate-unit-test
  ;; chatgpt-shell-prompt-header-refactor-code
  ;; chatgpt-shell-prompt-header-proofread-region
  ;; chatgpt-shell-prompt-header-whats-wrong-with-last-command

  ;;;;;;;;;;
  ;; MISC ;;
  ;;;;;;;;;;

  ;; (setq chatgpt-shell-highlight-blocks t)
  ;; (setq chatgpt-shell-prompt-compose-display-action ...)
  ;; (setq chatgpt-shell-display-function ...)
  ;; (setq chatgpt-shell-welcome-function ...)
  ;; (setq chatgpt-shell-logging nil) ; slows things down
  ;; (setq chatgpt-shell-compose-auto-transient nil)
  ;; (setq chatgpt-shell-source-block-actions nil)
  ;; (setq chatgpt-shell-always-create-new t)
  ;; (setq chatgpt-shell-transmitted-context-length ...)
  ;; (setq chatgpt-shell-language-mapping ...) ; language to emacs mode
  ;; (setq chatgpt-shell-streaming t)
  ;; (setq chatgpt-shell-model-temperature nil)
  ;; (setq chatgpt-shell-request-timeout 600)
  )
