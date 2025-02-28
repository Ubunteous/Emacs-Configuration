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
   '("efcecf09905ff85a7c80025551c657299a4d18c5fcfedd3b2f2b6287e4edd659" "524fa911b70d6b94d71585c9f0c5966fe85fb3a9ddd635362bfabd1a7981a307" "3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077" "24168c7e083ca0bbc87c68d3139ef39f072488703dcdd82343b8cab71c0f62a7" "e3a1b1fb50e3908e80514de38acbac74be2eb2777fc896e44b54ce44308e5330" "37c8c2817010e59734fe1f9302a7e6a2b5e8cc648cf6a6cc8b85f3bf17fececf" "eb02853c4a789d2cd00cc0c6e8e37532690fe70b5fddfc24e259f291048c5ad1" "fb83a50c80de36f23aea5919e50e1bccd565ca5bb646af95729dc8c5f926cbf3" "b6269b0356ed8d9ed55b0dcea10b4e13227b89fd2af4452eee19ac88297b0f99" "b02eae4d22362a941751f690032ea30c7c78d8ca8a1212fdae9eecad28a3587f" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "78b52dbcfc163b4f85c4b8fc3c415f721d49f250708bce73a5a448798ed0a786" "828657dee73e7add633117164b41794e06971d65ece73c085c31091c55439fa7" "c8b83e7692e77f3e2e46c08177b673da6e41b307805cd1982da9e2ea2e90e6d7" "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041" default))
 '(initial-scratch-message ";; This is where the fun begins")
 '(org-agenda-files nil)
 '(package-selected-packages '(eglot dashboard vterm))
 '(prescient-save-file "~/.emacs.d/files/prescient/prescient-save.el")
 '(recentf-save-file "~/.emacs.d/files/recentf/recentf")
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
     (electric-indent-mode)
     (ispell-dictionary . "fr")
     (ispell-dictionary . fr)
     (major-mode-remap-alist)
     (TeX-view-program-list quote
							("Evince" "evince 'output/Oeuvres à Découvrir.pdf'"))
     (TeX-view-program-list quote
							("Evince" "evince 'oeuvres/Oeuvres à Découvrir.pdf'"))
     (LaTeX-command . "latex -jobname 'Oeuvres à Découvrir' -output-directory ./output")
     (writeroom-width . 60)
     (eval setq writeroom-width 100)
     (eval setq writeroom-mode nil)
     (writeroom-major-modes)
     (writeroom-width . 100)
     (writeroom-mode)
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
     (org-cite-export-processors)
     (org-latex-default-packages-alist)
     (org-latex-packages-alist)
     (Org-export-preserve-breaks)
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
 '(send-mail-function 'sendmail-send-it)
 '(straight-base-dir "~/.emacs.d/files/straight/")
 '(straight-build-cache-fixed-name "~/.emacs.d/files/straight/build-cache.el")
 '(straight-find-flavor '(newermt))
 '(straight-package-neutering-mode t)
 '(straight-use-package-mode t)
 '(vertico-posframe-border-width 10))


;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(all-the-icons-dired-dir-face ((t (:foreground "SteelBlue3"))))
;;  '(font-latex-sedate-face ((t (:foreground "#66d9ee"))) t)
;;  '(swiper-background-match-face-1 ((nil (:background "light sea green"))) t)
;;  '(swiper-background-match-face-2 ((nil (:background "light sea green"))) t)
;;  '(swiper-background-match-face-3 ((nil (:background "light sea green"))) t)
;;  '(swiper-background-match-face-4 ((nil (:background "light sea green"))) t)
;;  '(swiper-line-face ((nil (:foreground nil))) t)
;;  '(swiper-match-face-1 ((nil (:background "tomato"))) t)
;;  '(swiper-match-face-2 ((nil (:background "light sea green"))) t)
;;  '(swiper-match-face-3 ((nil (:background "light sea green"))) t)
;;  '(swiper-match-face-4 ((nil (:background "light sea green"))) t)
;;  '(widget-field ((t (:extend t :background "midnight blue" :foreground "#d4d4d6" :box (:line-width 1 :color "#57584f"))))))

;;; customize ends here
;; (custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;; )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(meow-insert-cursor ((t (:background "light sea green"))))
 '(meow-normal-cursor ((t (:background "#fefff8")))))
