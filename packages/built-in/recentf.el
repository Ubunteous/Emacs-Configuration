;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               RECENTF              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; use-package seems to be ignored

;; recentf stuff (such as files with C-x C-f? or M-x?)
(use-package recentf
  :ensure nil
  ;; :straight (:type built-in)
  ;; :defer t
  ;; :custom
  ;; (recentf-save-file "~/.emacs.d/files/recentf-save.el")
  :config
  (recentf-mode 1) ;; on by default
  (setq recentf-max-menu-items 25)
  (setq recentf-max-saved-items 25)
  (setq recentf-auto-cleanup 'never)

  ;; USED TO BE A CUSTOM SET
  ;; (setq recentf-save-file "~/.emacs.d/files/recentf/recentf")
  ;; (setq recentf-save-file "~/.emacs.d/files/recentf-save.el")
  (setopt recentf-save-file "~/.emacs.d/files/recentf-save.el")

  ;; (setq recentf-exclude ("/\\(\\(\\(COMMIT\\|NOTES\\|PULLREQ\\|MERGEREQ\\|TAG\\)_EDIT\\|MERGE_\\|\\)MSG\\|\\(BRANCH\\|EDIT\\)_DESCRIPTION\\)\\'"))
  :general
  ("C-c C-r" 'recentf-open-files)
  :hook
  (find-file . recentf-save-list))

;; only necessary if recent-save-file is not loaded with custom
;;  (elpaca-after-init . (lambda () (load-file
;; 				    (expand-file-name
;; 				     "~/.emacs.d/files/recentf-save.el"))))))
