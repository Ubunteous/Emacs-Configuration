;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                EGLOT               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package eglot
  :defer t
  :custom
  ;; (add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))
  (eglot-autoshutdown t)
  :hook (python-mode . eglot-ensure))

;; :config
;; (setq eglot-ignored-server-capabilites (quote (:documentHighlightProvider))))

;; (use-package eglot
;;   :commands eglot
;;   :init
;;   (setq eglot-stay-out-of '(flymake))
;;   :custom
;;   (eglot-ignored-server-capabilites '(:documentHighlightProvider))
;;   (eglot-autoshutdown t)
;;   :hook
;;   ;; (eglot-managed-mode . eldoc-box-hover-mode)
;;   (eglot-managed-mode . fk/company-enable-snippets)
;;   :config
;;   (add-to-list 'eglot-server-programs '(python-mode . ("pyright-langserver" "--stdio")))
;;   (with-eval-after-load 'eglot
;;     (load-library "project")))
