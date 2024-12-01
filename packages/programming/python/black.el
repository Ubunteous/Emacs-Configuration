;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                BLACK               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package blacken
  :defer t
  :hook (python-mode python-ts-mode))

;; (use-package python-black
;;   :defer t
;;   :after python
;;   :hook (python-mode . python-black-on-save-mode)) ;; this will use black with every python file

;; requires a pyproject.toml for a per project configuration
;; :hook (python-mode . python-black-on-save-mode-enable-dwim))
