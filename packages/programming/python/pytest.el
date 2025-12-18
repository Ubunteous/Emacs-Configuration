;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               PYTEST               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package python-pytest
  :defer t
  :config
  (setq python-pytest-confirm t)
  (setq python-pytest-unsaved-buffers-behavior 'save-current))
