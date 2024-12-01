;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              OB-ASYNC              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ob-async
  :defer t
  :config
  ;; Python has its own async
  (setq ob-async-no-async-languages-alist '("python" "jupyter-python")))
