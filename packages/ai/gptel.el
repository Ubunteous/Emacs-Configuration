;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                GPTEL               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This package serves to automate these requests:
;; curl https://api.openai.com/v1/chat/completions \
;; -H "Content-Type: application/json" \
;; -H "Authorization: Bearer api-key" \
;; -d '{
;; "model": "gpt-4o-mini",
;; "store": true,
;; "messages": [
;;		 {"role": "user", "content": "write a haiku about ai"}
;;		 ]
;; }'

;; Place your api-key in ~/.authinfo
;; machine api.openai.com login apikey password TOKEN (where TOKEN is the key)
;; machine googleapis.com login apikey password TOKEN (where TOKEN is the key)

;; Use minuet.el for auto-suggestions
(use-package gptel
  :defer t
  :config
  (setq gptel--system-message "Respond concisely.")
  (setq gptel-model 'gemini-flash-latest)

  (setq gptel-backend
		(gptel-make-gemini "Gemini"
		  :key
		  (plist-get (car (auth-source-search
						   :host "googleapis.com"
						   :user "apikey"))
					 :secret)
		  :stream t))

  (defun gptel-switch-backend ()
	(interactive)
	;; There probably is a way to have multiple providers. Remove this function if you figure it out
	(if (eq gptel-model 'gemini-flash-latest)
		(progn
		  (setq gptel-model 'gpt-5.4-mini
				gptel-backend
				(gptel-make-openai "ChatGPT" :key 'gptel-api-key :stream t)
				backend gptel-backend)
		  (message "Model set to ChatGPT"))
	  (progn
		(setq gptel-model 'gemini-flash-latest
			  gptel-backend
			  (gptel-make-gemini "Gemini"
				:key
				(plist-get (car (auth-source-search
								 :host "googleapis.com"
								 :user "apikey"))
						   :secret)
				:stream t)))
	  (message "Model set to Gemini")))

  (gptel-make-preset 'chatgpt
	:description "Preset for chatgpt"
	:backend "ChatGPT"
	:model 'gpt-5.4-mini)

  (gptel-make-preset 'gemini
	:description "Preset for chatgpt"
	:backend "Gemini"
	:model 'gemini-flash-latest)
  :bind (:map gptel-mode-map
			  ("C-c C-h" . gptel-menu)))
