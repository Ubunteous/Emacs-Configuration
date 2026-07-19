;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               POPPER               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This package is an alternative to popwin and shackle

(use-package popper
  :defer t
  :bind
  ("C-`" . popper-toggle)
  ("M-`" . popper-cycle)
  ("C-M-`" . popper-toggle-type)
  ;; popper-cycle-backwards
  ;; popper-kill-latest-popup
  :config
  ;; buffer regexp, names against, major-mode (symbol), predicate of one argument (buffer)
  (setq popper-reference-buffers
		'("\\*Messages\\*"
		  "Output\\*$"
		  "\\*Async Shell Command\\*"
		  help-mode
		  compilation-mode))

  (defun popper-display-popup-at-right (buffer &optional alist)
	"Display popup-buffer BUFFER at the right of the screen."
	(display-buffer-in-side-window
	 buffer
	 (append alist
			 `((window-height . ,popper-window-height)
			   (side . right)
			   (slot . 0)))))

  (defun popper-select-popup-at-right (buffer &optional alist)
	"Display and switch to popup-buffer BUFFER at the right of the screen."
	(let ((window (popper-display-popup-at-right buffer alist)))
	  (select-window window)))

  ;; modify position of pop ups (defaults to bottom of the screen)
  (setq popper-display-function #'popper-select-popup-at-right) ; #'display-buffer-in-child-frame

  ;; ;; project.el, project root or fall back to  default-directory
  ;; ;; popper-group-by-directory/project/projectile/perspective
  ;; (setq popper-group-function #'popper-group-by-directory) ; #'popper-group-by-project)

  ;; (setq popper-mode-line ...)
  ;; (setq popper-display-control t) ; user, nil, t
  :hook
  ;; For echo area hints
  (elpaca-after-init . (lambda () (popper-mode) (popper-echo-mode))))
