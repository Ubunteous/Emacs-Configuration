;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            ORG-POMODORO            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-pomodoro
  :defer t
  :config
  (setq org-pomodoro-length .05
	org-pomodoro-short-break-length .05
	org-pomodoro-long-break-length 0.05
	org-pomodoro-ask-upon-killing nil

	org-pomodoro-play-sounds nil
	))
