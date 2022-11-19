;;; init.el --- Summary
;;; Commentary:
;;; Code:

;; Requirements:
;; git command for straight
;; M-x all-the-icons-install-fonts for all-the-icons
;; gcc to build sqlite3 for org-roam
;; NixOS only: nix rather than straight.el to install vter
;; Devdocs: use devdocs install to install documentation

;; emacs-client
;; (server-start)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             OPTIMISATION           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Adjust garbage collection thresholds during startup, and thereafter
(setq gc-cons-threshold (* 128 1024 1024) )
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 20 1024 1024) )))

;; no need to resize anything since xmonad deals with it already
(setq frame-inhibit-implied-resize t)

;; saves some time on startup by changing when straight looks for changes
;; (setq straight-check-for-modifications '(check-on-save find-when-checking))
(setq straight-check-for-modifications nil) ;; doom style

(setq-default
 inhibit-startup-screen t               ; Disable start-up screen
 inhibit-startup-message t              ; Disable startup message
 inhibit-startup-echo-area-message t    ; Disable initial echo message
 initial-scratch-message ""             ; Empty the initial *scratch* buffer
 initial-buffer-choice t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               STRAIGHT             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 '(straight-base-dir "~/.emacs.d/files/straight/")
 '(straight-build-cache-fixed-name "~/.emacs.d/files/straight/build-cache.el"))

;; straight (requires git)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "files/straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp))
    ;; move straight away from the base directory. combine it with no-littering.el
    (rename-file "~/.emacs.d/straight/" "~/.emacs.d/files/")
    (find-file "~/.emacs.d/files/")) ;; it's dirty but it works
  (load bootstrap-file nil 'nomessage))

;; prevents the user from relying on package-install
(put 'package-install 'disabled "\nDO NOT USE package-install anymore.\nRely on straight-use-package instead")

;; Disable package.el in favour of straight.el
(setq package-enable-at-startup nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             USE-PACKAGE            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install use-package with straight-use-package
(straight-use-package 'use-package)
;; configure use-package to always use straight
(use-package straight
  :custom (straight-use-package-by-default t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               GENERAL              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; don't you dare defer this essential package
(use-package general)

;; switch to bindings list when opened
(defun general-list-keybindings ()
  (interactive)
  (general-describe-keybindings)
  (pop-to-buffer "*General Keybindings*")
  (delete-other-windows))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              LISP FILES            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file "~/.emacs.d/straight.el")

;; (load-file "~/.emacs.d/custom/pull-down-packages.el")
(load-file "~/.emacs.d/custom/pull-down-guide.el")
(load-file "~/.emacs.d/custom/preferences.el")

;; set custom file in which emacs will add stuff on its own
(setq custom-file "~/.emacs.d/custom/customize.el")
(load custom-file)

;;; init.el ends here
