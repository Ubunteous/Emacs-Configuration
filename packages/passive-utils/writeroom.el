;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              WRITEROOM             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package writeroom-mode
  :defer t
  ;; :init
  ;; (add-hook 'writeroom-mode-enable-hook (lambda () (centaur-tabs-mode -1) (display-line-numbers-mode -1)))
  ;; (add-hook 'writeroom-mode-disable-hook (lambda () (centaur-tabs-mode 1) (display-line-numbers-mode 1)))
  :bind
  (:map writeroom-mode-map
		("C-M-<" . writeroom-decrease-width)
		("C-M->" . writeroom-increase-width)
		("C-M-=" . writeroom-adjust-width))
  (:map dired-mode-map
		("(" . dired-toggle-details-and-writeroom))
  :config
  (defun dired-toggle-details-and-writeroom ()
	(interactive)
	(let ((dired-simplify-p (if dired-hide-details-mode -1 1))) ; toggle writeroom+dired hide details
	  (dired-hide-details-mode dired-simplify-p)
	  (writeroom-mode dired-simplify-p)))

  (setq writeroom-width 60
		writeroom-fullscreen-effect "maximized")
  ;; writeroom-added-width-left -10)

  ;; bad restoration in some cases (in org mode, first M-x writeroom-mode recalls previous buffer)
  ;; (setq writeroom-restore-window-config t)

  ;; (add-to-list writeroom-global-effects my-writeroom-theme)
  :hook
  (((magit-status-mode
	 apropos-mode
	 helpful-mode
	 dired-mode
	 org-agenda-mode)
	. writeroom-mode)

   ;; switch to writeroom if there is only one window open
   (org-mode . (lambda ()
				 (when (= (count-windows) 1)
				   (writeroom-mode))))

   ;; (writeroom-mode-enable . (lambda ()
   ;;				  (display-line-numbers-mode -1)
   ;;				  (flycheck-mode -1)))

   ;; (writeroom-mode-disable . (lambda ()
   ;;				   (display-line-numbers-mode 1)
   ;;				   (flycheck-mode 1)))

   (writeroom-mode . centaur-tabs-local-mode)))

;; (defun my-writeroom-theme (arg)
;;   (cond
;;    ((= arg 1)
;;     (display-line-numbers-mode -1)
;;     (flycheck-mode -1))
;;    ((= arg -1)
;;     (display-line-numbers-mode 1)
;;     (flycheck-mode 1))))
