(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((org-latex-classes
      ("article" "\\documentclass[11pt]{article}\12\12[PACKAGES]\12\\usepackage[inline]{enumitem}\12\\setlist[itemize]{nosep}\12\12[EXTRA]"
       ("\\section{%s}" . "\\section*{%s}")
       ("\\subsection{%s}" . "\\subsection*{%s}")
       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
       ("\\paragraph{%s}" . "\\paragraph*{%s}")
       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
     (TeX-master . "Oeuvres")
     (org-export-preserve-breaks)
     (org-image-actual-width . 750)
     (TeX-view-program-list quote
							("Evince" "evince 'output/Oeuvres à Découvrir.pdf'"))
     (TeX-view-program-list quote
							("Evince" "evince 'oeuvres/Oeuvres à Découvrir.pdf'"))
     (LaTeX-command . "latex -jobname 'Oeuvres à Découvrir' -output-directory ./output")
     (TeX-master . "Oeuvres à Découvrir")
     (auto-insert-alist)
     (eval use-package org-contrib :config
		   (require 'ox-extra)
		   (ox-extras-activate
			'(ignore-headlines)))
     (eval progn
		   (org-babel-goto-named-src-block "startup")
		   (org-babel-execute-src-block)
		   (outline-hide-sublevels 1))
     (eval local-set-key
		   (kbd "C-c s")
		   '(lambda nil
			  (interactive)
			  (org-export-dispatch "lO")))
     (eval local-set-key "C-c s"
		   '(lambda nil
			  (interactive)
			  (org-export-dispatch "lO")))
     (eval local-set-key "d"
		   '(lambda nil
			  (interactive)
			  (org-export-dispatch "lO")))
     (eval local-set-key "C-c s" 'org-beamer-compile)
     (eval use-local-map
		   (copy-keymap org-mode-map))
     (eval define-key my-org-buffer-local-mode-map
		   (kbd "C-c s")
		   'org-beamer-compile)
	 (org-latex-default-packages-alist
      ("" "lmodern" nil))
     (org-latex-hyperref-template)
     (org-latex-default-packages-alist)
     (org-latex-packages-alist)
     (org-image-actual-width)
     (Org-image-actual-width . 300)
     (eval setq-local org-roam-db-location
		   (expand-file-name "org-roam.db"
							 (concat org-roam-directory "/database")))
     (eval setq-local org-roam-directory
		   (expand-file-name
			(concat
			 (locate-dominating-file default-directory ".dir-locals.el")
			 "org-roam")))))
 '(send-mail-function 'sendmail-send-it))
