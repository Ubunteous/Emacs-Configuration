;;; customize -- Summary
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(all-the-icons-dired-monochrome nil)
 '(auto-save-list-file-name
   (concat user-emacs-directory "files/auto-save-list/.saves-5642-nixos~") t)
 '(auto-save-list-file-prefix
   (concat user-emacs-directory "files/auto-save-list/.saves-"))
 '(bookmark-default-file "~/.emacs.d/files/bookmark/bookmarks")
 '(custom-safe-themes
   '("833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "78b52dbcfc163b4f85c4b8fc3c415f721d49f250708bce73a5a448798ed0a786" "828657dee73e7add633117164b41794e06971d65ece73c085c31091c55439fa7" "c8b83e7692e77f3e2e46c08177b673da6e41b307805cd1982da9e2ea2e90e6d7" "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041" default))
 '(initial-scratch-message ";; This is where the fun begins")
 '(org-agenda-files
   '("/home/ubunteous/org/emacs/agenda.org" "/home/ubunteous/Desktop/Latex/Job/Contacts.org"))
 '(prescient-save-file "~/.emacs.d/files/prescient/prescient-save.el" t)
 '(recentf-save-file "~/.emacs.d/files/recentf/recentf")
 '(safe-local-variable-values
   '((eval setq-local org-roam-db-location
	   (expand-file-name "org-roam.db"
			     (concat org-roam-directory "/database")))
     (eval setq-local org-roam-directory
	   (expand-file-name
	    (concat
	     (locate-dominating-file default-directory ".dir-locals.el")
	     "org-roam")))))
 '(straight-base-dir "~/.emacs.d/files/straight/")
 '(straight-build-cache-fixed-name "~/.emacs.d/files/straight/build-cache.el")
 '(straight-find-flavor '(newermt))
 '(straight-package-neutering-mode t)
 '(straight-use-package-mode t))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(all-the-icons-dired-dir-face ((t (:foreground "SteelBlue3"))))
 '(font-latex-sedate-face ((t (:foreground "#66d9ee"))) t)
 '(swiper-background-match-face-1 ((nil (:background "light sea green"))))
 '(swiper-background-match-face-2 ((nil (:background "light sea green"))))
 '(swiper-background-match-face-3 ((nil (:background "light sea green"))))
 '(swiper-background-match-face-4 ((nil (:background "light sea green"))))
 '(swiper-line-face ((nil (:foreground nil))))
 '(swiper-match-face-1 ((nil (:background "tomato"))))
 '(swiper-match-face-2 ((nil (:background "light sea green"))))
 '(swiper-match-face-3 ((nil (:background "light sea green"))))
 '(swiper-match-face-4 ((nil (:background "light sea green"))))
 '(widget-field ((t (:extend t :background "midnight blue" :foreground "#d4d4d6" :box (:line-width 1 :color "#57584f"))))))

;;; customize ends here
