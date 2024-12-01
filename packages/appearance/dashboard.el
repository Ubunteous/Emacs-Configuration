;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             DASHBOARD              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; required by dashboard
(use-package page-break-lines)

(use-package dashboard
  :ensure t
  :after (all-the-icons)
  ;; :after (nerd-icons)
  ;; :init
  ;; (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  :custom
  ;; startup might be slightly slower with icons
  (dashboard-icon-type 'all-the-icons) ;; wrongly set to nil unless in :custom
  (dashboard-set-heading-icons nil)
  (dashboard-set-file-icons t)
  :config
  ;; needed for icons
  (advice-add #'dashboard-replace-displayable :override #'identity)

  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (dashboard-setup-startup-hook)

  ;; (setq dashboard-projects-switch-function 'counsel-projectile-switch-project-by-name)
  ;; (setq dashboard-projects-backend 'projectile)
  
  (setq dashboard-set-navigator t) ;; web
  ;; Format: "(icon title help action face prefix suffix)"
  (setq dashboard-navigator-buttons
	`(;; line1
          ((,
	    (all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
            "Homepage"
            "Browse homepage"
	    (lambda (&rest _) (browse-url "https://github.com/Ubunteous")))
           ("★"
	    "Star"
	    "Reach for the stars"
	    (lambda (&rest _) (browse-url "https://www.youtube.com/watch?v=QH2-TGUlwu4")) warning ))
          ;; line 2
          (
	   (,
	    (all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
            "Linkedin"
            "Browse Linkedin"
            (lambda (&rest _) (browse-url "https://www.linkedin.com/")))
           ("⚑"
	    nil
	    "Go get some help"
	    (lambda (&rest _) (browse-url "https://stackoverflow.com")) warning ))))

  (setq dashboard-page-separator "\n\f\n")
  (setq dashboard-banner-logo-title "Welcome to Emacs")
  (setq dashboard-startup-banner "~/.emacs.d/files/elpaca/builds/dashboard/banners/logo.png")
  ;; (setq dashboard-startup-banner 'logo) ;'official 'logo 1,2,3 (text) or gif/png/txt

  (setq dashboard-items	;; bookmarks, agenda, registers
	'((recents  . 5)
	  ;; (projects . 3)
	  ;; (agenda   . 5))))
	  (bookmarks . 5))))
