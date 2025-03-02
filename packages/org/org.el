;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 ORG                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org
  :defer t
  ;; :after jupyter
  ;; :after ox-latex
  ;; :straight (:type built-in)
  :ensure nil
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
			"C-c s" '(lambda () (interactive) (org-export-dispatch "lo"))

			;; removed as I need the default bindings for navigation
			;; "C-n" 'org-next-visible-heading
			;; "C-p" 'org-previous-visible-heading
			;; "C-f" 'org-forward-heading-same-level
			;; "C-b" 'org-backward-heading-same-level

			"C-c C-n" 'org-babel-next-block-end
			"C-c C-p" 'org-babel-previous-block-end
			
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
		'(("article"
		   ;; deal with indentation later
		   "\\documentclass[12pt]{article}

[PACKAGES]
\\usepackage[inline]{enumitem}
\\setlist[itemize]{nosep}

[EXTRA]"
		   ("\\section{%s}" . "\\section*{%s}")
		   ("\\subsection{%s}" . "\\subsection*{%s}")
		   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		   ("\\paragraph{%s}" . "\\paragraph*{%s}")
		   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
		   )))

  ;; more latex export settings
  (setq org-export-with-author nil
		org-export-with-date nil
		org-export-with-toc nil
		org-export-with-title nil
		org-latex-caption-above nil)

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
		  ("" "hyperref" nil)
		  ))

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
		'(("a" . "src C :includes <stdio.h> <stdlib.h>\n")
		  ("C" . "comment\n")
		  ("c" . "src clojure\n")
		  ("e" . "src elisp\n")
		  ("f" . "src python\n")
		  ;; ("g" . "src go\n")
		  ("h" . "src html\n")
		  ("i" . "src js\n")
		  ("l" . "src lilypond :file lily.png\n")
		  ("m" . "center\n")
		  ("n" . "src nix\n")
		  ("p" . "src powershell\n")
		  ;; ("p" . "src python\n")
		  ;; ("Q" . "src sql-mode\n")
		  ("q" . "src sql\n")
		  ("r" . "src\n")
		  ("s" . "src shell\n")
		  ("t" . "src janet\n")
		  ("#" . "src csharp\n")
		  ("u" . "src lua\n")
		  ("u" . "src jupyter-python\n")
		  ("w" . "src css\n")
		  ;; ("x" . "src restclient\n")
		  ))

  ;; defaults to gcc
  ;; (setq org-babel-C-compiler "clang")

  ;; babel evaluation prompt
  (setq org-confirm-babel-evaluate nil)

  ;; Inf-clojure, cider, babashka (slime, nbb)
  (setq org-babel-clojure-backend 'cider)

  ;; language support
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell . t)
     ;; (latex . t)
     (clojure . t)
     ;; (C . t)
     ;; (go . t)
     ;; (typescript . t)
     ;; (js . t)
     (jupyter . t)
     ;; (powershell . t)
     ;; (python . t)
     (sql . t)
     (sql-mode . t)
     ;; (nix . t)
     ;; (janet . t)
     (csharp . t)
     ;; (html . t)
     ;; (lua . t)
     ;; (org . t)
     ;; (lilypond . t)
	 ;; (restclient . t)
     ))

  ;; This can be used to customise headers
  ;; (setq org-babel-default-header-args:jupyter-julia '((:async . "yes")
  ;; (:session . "jl")
  ;; (:kernel . "julia-1.0")))

  ;;;;;;;;;;;;;;;;;
  ;;   CAPTURE   ;;
  ;;;;;;;;;;;;;;;;;

  ;; (setq org-directory "~/org") ;; default
  (setq org-default-notes-file (concat org-directory "~/.notes"))

  (setq org-capture-templates
		'(("t" "New task for the agenda"
		   entry (file "~/org/agenda.org")
           "* %?%i %t" :empty-lines-before 1)
		  ("d" "New deadline for the agenda"
		   entry (file "~/org/agenda.org")
           "* %?%i \nDEADLINE: <%<%Y-%m-%d %a>>" :empty-lines-before 1) ;; %t <%<%m-%d %a>>
		  ("s" "Slipbox"
		   entry (file "~/org/Alter/inbox.org")
		   "* %?\n")
		  ))

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

  ;; set everywhere #+STARTUP: overview
  (setq org-startup-folded t)

  ;; space after section. no space after list on alt+enter
  (setq org-blank-before-new-entry '((heading . t) (plain-list-item)))

  ;; 29.2 bug: emacs always edit in dedicated buffer
  ;; => This is due to the treesit auto package or major-mode-remap-alist
  ;; Disable editing source code in dedicated buffer
  ;; => Too intrusive. (electric-indent-mode 0) should suffice
  ;; (defun org-edit-src-code nil)

  ;; follow org link on enter (like left click or C-c C-o)
  (setq org-return-follows-link  t)

  ;; collapse some sections when opening an org file
  ;; (setq org-startup-folded 'show2levels)

  ;; open #+Include: file in same window with C-c ' (org-edit-special)
  (setf (cdr (assoc 'file org-link-frame-setup)) 'find-file)

  (setq org-src-preserve-indentation t)

  (setq org-startup-truncated nil) ;; risky with tables and links

  (setq org-use-sub-superscripts nil) ;; _ and ^ do not alter nearby text

  ;; do not use image real size in org (as it may be too big)
  ;; (setq org-image-actual-width nil)
  (setq org-image-actual-width 300)

  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states) ;; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

  ;; (setq org-support-shift-select 1)) ;; heresy

  (setq org-use-speed-commands t)
  ;; :hook
  ;; might be risky if it cancels normal image display
  ;; (org-babel-after-execute . org-redisplay-inline-images)

  ;;;;;;;;;;;;;;;;;;;;;
  ;;   HTML EXPORT   ;;
  ;;;;;;;;;;;;;;;;;;;;;

  (setq org-html-postamble nil
		org-html-head-include-default-style nil
		org-html-meta-tags nil
		org-html-xml-declaration nil)

  ;; don't touch those
  ;; (setq org-html-doctype-alist nil)
  ;; (setq org-html-doctype "")

  )


;; export org citations to latex
;; (require 'oc-biblatex)
;; (setq org-cite-export-processors '((latex biblatex) (t basic)))

;;;;;;;;;;;;;;;;;;;
;;   FUNCTIONS   ;;
;;;;;;;;;;;;;;;;;;;

(defun org-babel-previous-block-end ()
  "Go to the last line of code of the previous source block."
  (interactive)
  (org-babel-previous-src-block)
  (search-forward "#+end\_src")
  (previous-line)
  (org-end-of-line))


(defun org-babel-next-block-end ()
  "Go to the last line of code of the next source block."
  (interactive)
  (org-babel-next-src-block)
  (search-forward "#+end\_src")
  (previous-line)
  (org-end-of-line))


(defun org-collapse-top-level-heading ()
  "Go to top * heading and close it."
  (interactive)
  ;; go to main header if not within it (too deep)
  (let ((start-level (funcall outline-level)))
    (when (> start-level 1)
      (outline-up-heading 1))
    ;; fold
    (org-fold-hide-subtree)))


(defun org-babel-eval-wipe-error-buffer ()
  "Redefine this function to delete the Org Babel buffer."
  (let ((ob-buffer (get-buffer org-babel-error-buffer-name)))
    (when ob-buffer
      ;;   (progn
      ;;    (other-window 1)
      ;;    (kill-buffer-refocus)
      ;;    ;; (delete-window ob-buffer)
      ;;    )

      (delete-other-windows))))

;; (defun org-latex-compile ()
;;   "Export to LaTeX and open pdf."
;;   (interactive)
;;   (save-buffer)
;;   (org-export-dispatch "lo"))

;; (defun org-beamer-compile ()
;;   "Export to Beamer LaTeX and open pdf."
;;   (interactive)
;;   (save-buffer)
;;   (org-export-dispatch "lO"))
