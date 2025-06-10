(use-package no-littering
  :defer t
  :init
  (setq no-littering-etc-directory
		(expand-file-name "files/" user-emacs-directory))
  (setq no-littering-var-directory
		(expand-file-name "files/" user-emacs-directory))
  (require 'no-littering)
  :config
  ;;;;;;;;;;;;;;;;;;
  ;; Backup files ;;
  ;;;;;;;;;;;;;;;;;;

  (setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))

  ;;;;;;;;;;;;;;;;;;;;;
  ;; Auto save files ;;
  ;;;;;;;;;;;;;;;;;;;;;

  ;; auto-save-mode doesn't create the path automatically!
  (make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)
  (setq auto-save-list-file-prefix (expand-file-name "tmp/auto-saves/sessions/" user-emacs-directory)
		auto-save-file-name-transforms `((".*" ,(expand-file-name "tmp/auto-saves/" user-emacs-directory) t)))

  ;;;;;;;;;;;;;;;;;;;;;
  ;; Emacs directory ;;
  ;;;;;;;;;;;;;;;;;;;;;

  ;; Files created relatively to emacs directory (includes transients)
  (setq user-emacs-directory (expand-file-name "~/.cache/emacs"))

  ;;;;;;;;;;;;;;;;;;;;;
  ;; Not recommended ;;
  ;;;;;;;;;;;;;;;;;;;;;

  ;; not recommended. deactivate backup files
  ;; (setq make-backup-files nil)

  ;; not recommended. deactivate lock files
  ;; (setq create-lockfiles nil)
  )
