;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            EGLOT-BOOSTER           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package eglot-booster
  :defer t
  :ensure (eglot-booster :type git :host github :repo "jdtsmith/eglot-booster")
  :after eglot
  ;; :config
  ;; Check that emacs-lsp-booster process is running
  ;; Check the stderr buffer (e.g. for lsp-mode, *pyright::stderr* buffer;
  ;; for eglot, the  EGLOT (...) stderr* buffer, note the leading space); see emacs_lsp_booster logs
  ;; (eglot-booster-mode)

  ;; prevent boosting remote (tramp) servers
  ;; (setq eglot-booster-no-remote-boost t)
  :hook prog-mode)
