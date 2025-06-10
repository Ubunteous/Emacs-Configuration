;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               HL-TODO              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package hl-todo
  :defer t
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-keyword-faces
		'(("TODO"   . "#FF0000")
          ("FIXME"  . "#FF0000")
          ("DEBUG"  . "#A020F0")
		  ("GOTCHA" . "#FF4500")
		  ("DEPRECATED" . "#BEBEBE")
		  ("PROGRESS" . "#FFA500")
          ("STUB"   . "#1E90FF")
		  ("DONE"   . "#1EFF90"))))

;; Other keywords from KDE syntax highlighting
;; ALERT
;; ATTENTION
;; DANGER
;; HACK
;; SECURITY

;; BUG
;; FIXME
;; DEPRECATED
;; TASK
;; TODO
;; TBD
;; WARNING
;; CAUTION
;; NOLINT
;; NOQA
