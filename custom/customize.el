(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bookmark-default-file "~/.emacs.d/files/bookmark-default.el")
 '(safe-local-variable-directories '("/home/ubunteous/org/Wiki/Oeuvres à Découvrir/"))
 '(safe-local-variable-values
   '((eval setq-local org-roam-db-location
		   (expand-file-name "org-roam.db"
							 (concat org-roam-directory "/database")))
	 (eval setq-local org-roam-directory
		   (expand-file-name
			(concat
			 (locate-dominating-file default-directory
									 ".dir-locals.el")
			 "org-roam"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(meow-insert-cursor ((t (:background "light sea green"))))
 '(meow-normal-cursor ((t (:background "#fefff8")))))
