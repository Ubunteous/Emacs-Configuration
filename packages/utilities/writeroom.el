;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              WRITEROOM             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package writeroom-mode
  :defer t
  ;; :init
  ;; (add-hook 'writeroom-mode-enable-hook (lambda () (centaur-tabs-mode -1) (display-line-numbers-mode -1)))
  ;; (add-hook 'writeroom-mode-disable-hook (lambda () (centaur-tabs-mode 1) (display-line-numbers-mode 1)))
  :general
  (:keymaps 'writeroom-mode-map
			"C-M-<" #'writeroom-decrease-width
			"C-M->" #'writeroom-increase-width
			"C-M-=" #'writeroom-adjust-width)
  :config
  (setq writeroom-width 60
		writeroom-fullscreen-effect "maximized")
  ;; writeroom-added-width-left -10)
  (setq writeroom-restore-window-config t)

  ;; (add-to-list writeroom-global-effects my-writeroom-theme)
  :hook
  ((magit-status-mode
	apropos-mode
	helpful-mode
	dired-mode
	org-agenda-mode)

   ;; special-mode is used by Eldoc
   (special-mode . (lambda ()
					 (progn
					   (setq-local writeroom-width 90)
					   (writeroom-mode))))

   ;; switch to writeroom if there is only one window open
   (org-mode . (lambda ()
				 (when (= (count-windows) 1)
				   (writeroom-mode))))

   ;; (writeroom-mode-enable . (lambda ()
   ;; 			      (display-line-numbers-mode -1)
   ;; 			      (flycheck-mode -1)))

   ;; (writeroom-mode-disable . (lambda ()
   ;; 			       (display-line-numbers-mode 1)
   ;; 			       (flycheck-mode 1)))

   (writeroom-mode . centaur-tabs-local-mode)))

;; (defun my-writeroom-theme (arg)
;;   (cond
;;    ((= arg 1)
;;     (display-line-numbers-mode -1)
;;     (flycheck-mode -1))
;;    ((= arg -1)
;;     (display-line-numbers-mode 1)
;;     (flycheck-mode 1))))
