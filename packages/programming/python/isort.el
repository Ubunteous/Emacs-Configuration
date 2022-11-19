;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                ISORT               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package python-isort
  :defer t
  :hook (python-mode . python-isort-on-save-mode))

;; not maintained
;; (use-package py-isort
;;   :defer t
;;   :hook (before-save . py-isort-before-save))
