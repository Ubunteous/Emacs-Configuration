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
  :hook
  ((writeroom-mode . centaur-tabs-local-mode)

   ;; switch to writeroom if there is only one window open
   (org-mode . (lambda ()
		 (when (= (count-windows) 1)
		   (writeroom-mode))))
   
   (writeroom-mode-enable . (lambda ()
			      (display-line-numbers-mode -1)
			      (flycheck-mode -1)))

   (writeroom-mode-disable . (lambda ()
			       (display-line-numbers-mode 1)
			       (flycheck-mode 1)))))
