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
;; 	     {"role": "user", "content": "write a haiku about ai"}
;; 	     ]
;; }'

;; Place your api-key in ~/.authinfo
;; machine api.openai.com login apikey password TOKEN (where TOKEN is the key)
;; machine googleapis.com login apikey password TOKEN (where TOKEN is the key)
(use-package gptel
  :defer t
  :config
  (setq gptel-model 'gemini-2.5-flash-lite
		gptel-backend
		(gptel-make-gemini "Gemini"
		  :key
		  (plist-get (car (auth-source-search
						   :host "googleapis.com"
						   :user "apikey"))
					 :secret)
		  :stream t)))
