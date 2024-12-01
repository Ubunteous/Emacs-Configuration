;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             PERSPECTIVE            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package perspective
  :defer t
  :general
  ("C-c b" 'persp-list-buffers)
  ;;("C-x b" 'persp-switch-to-buffer*)
  ;;("C-x k" 'persp-kill-buffer*)
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here

  ;; for perspective + consult mode
  (consult-customize consult--source-buffer :hidden t :default nil)
  (add-to-list 'consult-buffer-sources persp-consult-source)
  :init
  (persp-mode))

;; avoid intrusive window splits
;; (customize-set-variable 'display-buffer-base-action
;;   '((display-buffer-reuse-window display-buffer-same-window)
;;     (reusable-frames . t)))

;; (customize-set-variable 'even-window-sizes nil)     ; avoid resizing
