;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               PYTEST               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package python-pytest
  :defer t
  :custom
  (python-pytest-confirm t)
  (setq python-pytest-unsaved-buffers-behavior 'save-current))
