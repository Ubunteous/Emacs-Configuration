;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              VTERM                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package vterm
  ;; :ensure t
  :straight (:type built-in)
  :init
  ;; increase vterm's font
  (add-hook 'vterm-mode-hook
            (lambda ()
	      (text-scale-increase 3)))

  :config (setq vterm-kill-buffer-on-exit t)

  ;; don't whine when I kill you or exit emacs
  ;; (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

  ;; don't whine when I exit emacs
  (setq confirm-kill-processes nil))
