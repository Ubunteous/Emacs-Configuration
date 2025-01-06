;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             NERD-ICONS             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package nerd-icons
  :defer t
  ;; :config
  ;; ;; no face/color for dir
  ;; (add-to-list 'nerd-icons-dir-icon-alist
  ;;              '("dir-a" nerd-icons-faicon "nf-fa-book" :face nerd-icons-red))
  
  ;; (add-to-list 'nerd-icons-extension-icon-alist
  ;;              '("file-a" nerd-icons-faicon "nf-fa-book" :face nerd-icons-red))
  )

(use-package nerd-icons-dired
  :defer t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-ibuffer
  :defer t
  :config
  (setq nerd-icons-ibuffer-color-icon t)
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  :hook (marginalia-mode . nerd-icons-completion-marginalia-setup))

;; ;; not tested
;; (use-package nerd-icons-corfu
;;   :after corfu
;;   :config
;;   (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))
