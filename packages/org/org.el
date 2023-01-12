;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 ORG                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org
  :defer t
  ;; :after jupyter
  :straight (:type built-in)
  :custom-face
  ;; (org-agenda-date ((t (:foreground "light sea green"))))
  (org-agenda-calendar-event ((t (:foreground "light sea green"))))

  (org-imminent-deadline ((t (:foreground "dark sea green" :inherit nil))))
  (org-upcoming-deadline ((t (:foreground "medium see green"))))
  (org-upcoming-distant-deadline ((t (:foreground "light sea green"))))
  :general
  ("C-c a" 'org-agenda-show-mix
   "C-c d" '(lambda () (interactive) (org-capture nil "d")))

  ;; a bit redundant with C-c C-d (org-deadline)
  (:keymaps 'org-capture-mode-map
	    "C-c d" 'org-timestamp-up-day)

  ;; org-agenda-list
  (:keymaps 'org-mode-map
	    "C-n" 'org-next-visible-heading
	    "C-p" 'org-previous-visible-heading
	    "C-f" 'org-forward-heading-same-level
	    "C-b" 'org-backward-heading-same-level

	    "C-c C-n" 'org-babel-next-src-block
	    "C-c C-p" 'org-babel-previous-src-block

	    "C-c j" 'org-insert-jupyter-block
	    
	    ;; overrides persp-list-buffers in org buffers
	    "C-c b" 'org-switchb)
  :config
  ;;;;;;;;;;;;;;;;;;;;;;
  ;;   LATEX EXPORT   ;;
  ;;;;;;;;;;;;;;;;;;;;;;

  ;; preserve line breaks in exports
  (setq org-export-preserve-breaks t)

  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

  ;; latex export classes
  (setq org-latex-classes
	'(("article" "\\documentclass[12pt]{article}"
	   ("\\section{%s}" . "\\section*{%s}")
	   ("\\subsection{%s}" . "\\subsection*{%s}")
	   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	   ("\\paragraph{%s}" . "\\paragraph*{%s}")
	   ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

  ;; more latex export
  (setq org-export-with-author nil
	org-export-with-date nil
	org-export-with-toc nil
	org-export-with-title nil)

  ;; latex export default packages
  (setq org-latex-default-packages-alist
	'(("AUTO" "inputenc" t
	   ("pdflatex"))
	  ;;("T1" "fontenc" t
	  ;; ("pdflatex"))
	  ("" "graphicx" t)
	  ;; ("" "longtable" nil)
	  ;; ("" "wrapfig" nil)
	  ;; ("" "rotating" nil)
	  ;; ("normalem" "ulem" t)
	  ("" "amsmath" t)
	  ("" "amssymb" t)
	  ;; ("" "capt-of" nil)
	  ("" "hyperref" nil)))

  ;; latex export other packages
  (setq org-latex-packages-alist
	'(("margin=2cm" "geometry")))
  ;; ("" "parskip")

  (setq org-latex-hyperref-template ;; for pictures
	"\\hypersetup{pdfborder=0 0 0}\n\n")

  ;; pdf export will open in evince (with C-c C-e l o)
  (add-to-list 'org-file-apps '("\\.pdf" . "evince %s"))

  ;;;;;;;;;;;;;;;
  ;;   BABEL   ;;
  ;;;;;;;;;;;;;;;

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

  ;; babel evaluation prompt
  (setq org-confirm-babel-evaluate nil)

  ;; language support
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell . t)
     (jupyter . t)
     (python . t)))

  ;; This can be used to customise headers
  ;; (setq org-babel-default-header-args:jupyter-julia '((:async . "yes")
  ;; (:session . "jl")
  ;; (:kernel . "julia-1.0")))

  (defun org-insert-jupyter-block ()
    "Insert a jupyter block (with linebreak if mark inactive)"
    (interactive)
    (if mark-active
	(org-insert-structure-template "src jupyter-python")
      (org-insert-structure-template "src jupyter-python\n")))
  
  ;;;;;;;;;;;;;;;;;
  ;;   CAPTURE   ;;
  ;;;;;;;;;;;;;;;;;

  ;; (setq org-directory "~/org") ;; default
  (setq org-default-notes-file (concat org-directory "/emacs/agenda.org"))

  (setq org-capture-templates
	'(("t" "New task for the agenda"
	   entry (file "~/org/emacs/agenda.org")
           "* %?%i %t" :empty-lines-before 1)
	  ("d" "New deadline for the agenda"
	   entry (file "~/org/emacs/agenda.org")
           "* %?%i \nDEADLINE: <%<%Y-%m-%d %a>>" :empty-lines-before 1))) ;; %t <%<%m-%d %a>>

  ;; shift org capture default date to tomorrow
  (advice-add 'org-capture :around
              (lambda (oldfun &rest args)
		(let ((org-overriding-default-time
                       (funcall
			(lambda ()
                          (let ((day (string-to-number (format-time-string "%d")))
				(month (string-to-number (format-time-string "%m")))
				(year (string-to-number (format-time-string "%Y"))))
                            (encode-time 1 1 0 (1+ day) month year))))))
                  (apply oldfun args))))

  (setq org-deadline-warning-days 0
	org-agenda-deadline-leaders '("" "In %3d d.: " "%2d d. ago: "))

  ;; ("j" "Journal" entry (file+datetree "~/org/journal.org")
  ;;  "* %?\nEntered on %U\n  %i\n  %a")))

  ;;;;;;;;;;;;;;;;
  ;;   AGENDA   ;;
  ;;;;;;;;;;;;;;;;

  ;; Note: see agenda files with this variable: org-agenda-files

  (defun org-agenda-show-mix (&optional arg)
    (interactive "P")
    (org-agenda arg "n"))

  ;; change the days shown in the agenda with the following tweaks
  ;; avoid starting the agenda on monday
  ;; show the previous day
  ;; span of 'day, 'week, 'month, 'year, or any number of days (int)
  (setq org-agenda-start-on-weekday nil
	org-agenda-start-day "-3d"
	org-agenda-span 14)

  ;; org agenda align entries content
  ;; (setq org-agenda-prefix-format
  ;; 	(quote
  ;; 	 ((agenda . "%-12c%?-12t% s")
  ;;         (timeline . "% s")
  ;;         (todo . "%-12c")
  ;;         (tags . "%-12c")
  ;;         (search . "%-12c")))
  ;; 	org-agenda-deadline-leaders (quote ("!D!: " "D%2d: " ""))
  ;; 	org-agenda-scheduled-leaders (quote ("" "S%3d: ")))
  ;; (setq org-agenda-tags-column -80)


  ;; deactivate agenda if it slows down startup time too much
  (setq org-agenda-inhibit-startup t)

  ;; Window: current, other, only | Frame: reorganize, other | Tab: other
  (setq org-agenda-window-setup 'only-window
	org-agenda-restore-windows-after-quit t)

  ;;;;;;;;;;;;;;;
  ;;   DIARY   ;;
  ;;;;;;;;;;;;;;;

  ;; I dislike the diary
  ;; (setq diary-file "~/Desktop/Org/diary.org")

  ;;;;;;;;;;;;;;;;;;
  ;;   CALENDAR   ;;
  ;;;;;;;;;;;;;;;;;;

  ;; I dislike the calendar
  ;; (setq calendar-setup 'calendar-only)
  ;; (setq org-agenda-include-diary t)

  ;; org-agenda-span => number of days displayed (day, week, month, year, or n days)

  ;;;;;;;;;;;;;;
  ;;   MISC   ;;
  ;;;;;;;;;;;;;;

  ;; not ideal for babel blocks
  ;; (setq org-indent-mode t)
  ;; (setq org-startup-indented t)

  (setq org-startup-truncated nil) ;; risky with tables and links

  (setq org-use-sub-superscripts nil) ;; _ and ^ do not alter nearby text
  
  ;; do not use image real size in org (as it may be too big)
  (setq org-image-actual-width nil)

  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states) ;; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

  ;; (setq org-support-shift-select 1)) ;; heresy

  :hook
  (org-babel-after-execute . org-redisplay-inline-images))


;; export org citations to latex
(require 'oc-biblatex)
(setq org-cite-export-processors '((latex biblatex) (t basic)))

