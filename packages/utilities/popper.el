;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               POPPER               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This package is an alternative to popwin and shackle

(use-package popper
  :defer t
  :general
  ("C-`" 'popper-toggle)
  ("M-`" 'popper-cycle)
  ("C-M-`" 'popper-toggle-type)
  :config ;; init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          help-mode
          compilation-mode))

  ;; project.el, project root or fall back to  default-directory
  (setq popper-group-function #'popper-group-by-directory)
  ;; (setq popper-group-function #'popper-group-by-project)

  ;; ;; modify position of pop ups (defaults to bottom of the screen)
  ;; (setq popper-display-function #'display-buffer-in-child-frame)

  ;; ;; hide popup without showing it (notifies in the echo area)
  ;; (setq popper-reference-buffers
  ;; 	'(("Output\\*$" . hide)
  ;; 	  (completion-list-mode . hide)
  ;; 	  occur-mode
  ;; 	  "\\*Messages\\*"))
  :hook
  ;; For echo area hints
  (elpaca-after-init (popper-mode popper-echo-mode)))
