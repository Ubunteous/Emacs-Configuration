;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 ORG                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org
  :defer t
  :straight (:type built-in)
  :general
  (org-mode-map "C-c j"
		'(lambda () (interactive)
		   (org-insert-structure-template "src jupyter-python\n")))
  :config
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

  (setq org-startup-truncated nil) ;; risky with tables and links
  (setq org-indent-mode t)

  ;; do not use image real size in org (as it may be too big)
  (setq org-image-actual-width nil)

  ;; preserve line breaks in exports
  (setq org-export-preserve-breaks t)
  
  ;; latex export classes
  (setq org-latex-classes
	'(("article" "\\documentclass[12pt]{article}"
	   ("\\section{%s}" . "\\section*{%s}")
	   ("\\subsection{%s}" . "\\subsection*{%s}")
	   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	   ("\\paragraph{%s}" . "\\paragraph*{%s}")
	   ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

  ;; latex export default packages
  (setq org-latex-default-packages-alist
	'(("AUTO" "inputenc" t
	   ("pdflatex"))
	  ("T1" "fontenc" t
	   ("pdflatex"))
	  ("" "graphicx" t)
	  ;; ("" "longtable" nil)
	  ;; ("" "wrapfig" nil)
	  ;; ("" "rotating" nil)
	  ;; ("normalem" "ulem" t)
	  ("" "amsmath" t)
	  ("" "amssymb" t)
	  ;; ("" "capt-of" nil)
	  ("" "hyperref" nil))
	)

  ;; latex export other packages
  (setq org-latex-packages-alist
	'(("margin=2cm" "geometry")))
  ;; ("" "parskip")

  (setq org-latex-hyperref-template ;; for pictures
	"\\hypersetup{pdfborder=0 0 0}\n\n")

  ;; no wacky auto indent in org source blocks
  ;; alternative: (setq org-src-preserve-indentation t)
  (setq org-edit-src-content-indentation 0)
  
  ;; org structure
  (setq org-structure-template-alist
	'(("c" . "center\n")
	  ("C" . "comment\n")
	  ("s" . "src\n")
	  ("p" . "src python\n")
	  ("j" . "src jupyter-python\n")))
  
  ;; (add-to-list 'org-structure-template-alist '("j" . "#+BEGIN_SRC jupyter-python :session py :async yes"))

  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states) ;; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

  ;; babel evaluation prompt
  (setq org-confirm-babel-evaluate nil)

  ;; language support
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell . t)
     (python . t)
     (jupyter . t))))


;; (setq org-support-shift-select 1)) ;; heresy
