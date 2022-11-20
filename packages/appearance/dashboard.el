;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             DASHBOARD              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; required by dashboard
(use-package page-break-lines)

(use-package dashboard
  :ensure t
  :init
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  :config
  ;;(setq dashboard-set-navigator t) ;; web
  (dashboard-setup-startup-hook)
  (setq dashboard-set-navigator t)
  ;; Format: "(icon title help action face prefix suffix)"
  (setq dashboard-navigator-buttons
	`(;; line1
          ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
            "Homepage"
            "Browse homepage"
	    (lambda (&rest _) (browse-url "https://github.com/Ubunteous")))
           ("★"
	    "Star"
	    "Reach for the stars"
	    (lambda (&rest _) (browse-url "https://www.youtube.com/watch?v=QH2-TGUlwu4")) warning ))
          ;; line 2
          ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
            "Linkedin"
            "Browse Linkedin"
            (lambda (&rest _) (browse-url "https://www.linkedin.com/")))
           ("⚑"
	    nil
	    "Go get some help"
	    (lambda (&rest _) (browse-url "https://stackoverflow.com")) warning ))))
  
  (setq dashboard-page-separator "\n\f\n")
  (setq dashboard-banner-logo-title "Welcome to Emacs")
  (setq dashboard-startup-banner "~/.emacs.d/files/dashboard/emacs.png")
  ;; (setq dashboard-startup-banner 'logo) ;'official 'logo 1,2,3 (text) or gif/png/txt
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  ;; (setq dashboard-projects-backend 'projectile)
  (setq dashboard-items	;; bookmarks, agenda, registers
	'((recents  . 5)
	  ;; (projects . 3)
	  (bookmarks . 5)
	  (agenda   . 5))))
