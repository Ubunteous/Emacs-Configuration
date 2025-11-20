;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               MINUET               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package minuet
  :defer t
  ;; :bind
  ;; (("M-y" . #'minuet-complete-with-minibuffer) ;; use minibuffer for completion
  ;;  ("M-i" . #'minuet-show-suggestion) ;; use overlay for completion
  ;;  ("C-c m" . #'minuet-configure-provider)
  ;;  :map minuet-active-mode-map
  ;;  ;; These keymaps activate only when a minuet suggestion is displayed in the current buffer
  ;;  ("M-p" . #'minuet-previous-suggestion) ;; invoke completion or cycle to next completion
  ;;  ("M-n" . #'minuet-next-suggestion) ;; invoke completion or cycle to previous completion
  ;;  ("M-A" . #'minuet-accept-suggestion) ;; accept whole completion
  ;;  ;; Accept the first line of completion, or N lines with a numeric-prefix:
  ;;  ;; e.g. C-u 2 M-a will accepts 2 lines of completion.
  ;;  ("M-a" . #'minuet-accept-suggestion-line)
  ;;  ("M-e" . #'minuet-dismiss-suggestion))
  ;; :config
  ;; (setq minuet-provider 'openai) ;; configure with M-x minuet-configure-provider
  ;; (minuet-set-optional-options minuet-openai-fim-compatible-options :max_tokens 64)

  ;;;;;;;;;;;;;;;;;;
  ;; OLLAMA SETUP ;;
  ;;;;;;;;;;;;;;;;;;
  
  ;; (setq minuet-n-completions 1) ; recommended for Local LLM for resource saving
  ;; (setq minuet-provider 'openai-fim-compatible)
  ;; (setq minuet-context-window 512) ;; put a larger value if computer can process it
  ;; (plist-put minuet-openai-fim-compatible-options :end-point "http://localhost:11434/v1/completions")
  ;; (plist-put minuet-openai-fim-compatible-options :name "Ollama")
  ;; (plist-put minuet-openai-fim-compatible-options :api-key "TERM")
  ;; (plist-put minuet-openai-fim-compatible-options :model "qwen2.5-coder:3b")
  ;; (minuet-set-optional-options minuet-openai-fim-compatible-options :max_tokens 56)
  :hook
  (prog-mode-hook . minuet-auto-suggestion-mode))
