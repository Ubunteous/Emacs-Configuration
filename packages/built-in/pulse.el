;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                PULSE               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package pulse
  :ensure nil
  :init
  (defun pulse-line (&rest _)
	"Pulse the current line."
	(pulse-momentary-highlight-one-line (point)))
  (dolist (command '(scroll-up-command
					 scroll-down-command
					 ;; other-window
					 ace-window
					 recenter-top-bottom))
	(advice-add command :after #'pulse-line))

  (setq pulse-iterations 32)
  :custom-face
  (pulse-highlight-start-face ((t (:background "light sea green")))))
