;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               POETRY               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package poetry
  :ensure t
  :defer t
  :config
  ;; Checks for the correct virtualenv. The default is slow
  (setq poetry-tracking-strategy 'switch-buffer)
  :hook ((python-mode python-ts-mode) . poetry-tracking-mode))
