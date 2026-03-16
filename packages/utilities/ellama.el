;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               ELLAMA               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ellama
  :ensure t
  :config
  (setq ellama-auto-scroll t)
  (setq ellama-chat-display-action-function #'display-buffer-full-frame)

  ;; worth checking
  ;; ellama-provider(s)
  ;; ellama-tools-allowed/enabled
  ;; ellama-context-global
  ;; ellama-show-reasoning
  ;; ellama-transient-host/port
  ;; ellama-completion-provider
  ;; ellama-context-border-width 1
  ;; ellama-output-remove-reasoning nil
  ;; ellama-session-remove-reasoning nil

  ;; example
  ;; (setq ellama-provider
  ;;		(make-llm-ollama
  ;;		 :chat-model "codellama" :embedding-model "codellama")))

  ;; show ellama context in header line in all buffers
  (ellama-context-header-line-global-mode +1)
  ;; show ellama session id in header line in all buffers
  (ellama-session-header-line-global-mode +1)
  :general (:keymaps 'personal
					 "i" 'ellama)
  :hook
  ;; send last message in chat buffer with C-c C-c
  (org-ctrl-c-ctrl-c-hook . ellama-chat-send-last-message))
