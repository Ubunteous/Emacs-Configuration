;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             CLAUDE-CODE            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package inheritenv
  :straight (:type git :host github :repo "purcell/inheritenv"))

(use-package claude-code
  :defer t
  :ensure (claude-code.el :type git :host github :repo "stevemolitor/claude-code.el")
  :config
  (setq claude-code-terminal-backend 'vterm
		claude-code-vterm-multiline-delay 0.01
		;; vterm-max-scrollback 100000
		claude-code-vterm-buffer-multiline-output t)
  ;; (setopt vterm-min-window-width 40)

  ;; (setq claude-code-confirm-kill nil)
  ;; (setq claude-code-sandbox-program t)
  ;; (setq claude-code-toggle-auto-select t)
  ;; (setq claude-code-enable-notifications nil)
  ;; (setq claude-code-no-delete-other-windows t)

  ;; (defun my-claude-notify-with-sound (title message)
  ;;   "Display a Linux notification with sound."
  ;;   (when (executable-find "notify-send")
  ;;     (call-process "notify-send" nil nil nil title message))
  ;;   ;; Play sound if paplay is available
  ;;   (when (executable-find "paplay")
  ;;     (call-process "paplay" nil nil nil "/usr/share/sounds/freedesktop/stereo/message.oga")))
  ;; (setq claude-code-notification-function #'my-claude-notify-with-sound)

  ;; :general (:map 'personal-keymap "i" claude-code-command-map) ; not working yet
  :hook
  ((claude-code-process-environment-functions . monet-start-server-function)
   (claude-code-mode . monet-mode)))
