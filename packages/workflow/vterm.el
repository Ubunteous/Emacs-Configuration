;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              VTERM                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package vterm
  :defer t
  ;; :straight (:type built-in)
  :config
  (setq vterm-kill-buffer-on-exit t)

  ;; don't whine when I kill you or exit emacs
  ;; (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

  ;; don't whine when I exit emacs
  (setq confirm-kill-processes nil)
  :hook
  (vterm-mode . (lambda () (text-scale-increase 3))))
