;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            ALL-THE-ICONS           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package all-the-icons
  :defer t
  :if (display-graphic-p))
;;(all-the-icons-icon-for-dir "file-directory"
;;:face '((t (:foreground "SteelBlue3")))))


(use-package all-the-icons-dired
  :defer t
  :after (all-the-icons dired)
  :hook (dired-mode . all-the-icons-dired-mode)
  :diminish all-the-icons-dired-mode
  :config
  (setq all-the-icons-dired-monochrome nil)
  :custom-face (all-the-icons-dired-dir-face ((t (:foreground "SteelBlue3")))))
;;:custom-face (set-face-foreground 'all-the-icons-dired-dir-face "SteelBlue3"))


(use-package all-the-icons-completion
  :defer t
  :after (all-the-icons marginalia) ;selectrum/vertico
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init (all-the-icons-completion-mode))


(use-package all-the-icons-ibuffer
  :defer t
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))
