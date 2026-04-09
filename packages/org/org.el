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
  (org-block-begin-line ((t (:foreground "light sea green"))))
  (org-imminent-deadline ((t (:foreground "dark sea green" :inherit nil))))
  (org-upcoming-deadline ((t (:foreground "medium see green"))))
  (org-upcoming-distant-deadline ((t (:foreground "light sea green"))))
  :general
  (:keymaps 'org-mode-map
			"C-c -" 'org-ctrl-c-plus
			"C-c s" '(lambda () (interactive) (org-export-dispatch "lo"))

			;; removed as I need the default bindings for navigation
			;; "C-n" 'org-next-visible-heading
			;; "C-p" 'org-previous-visible-heading
			;; "C-f" 'org-forward-heading-same-level
			;; "C-b" 'org-backward-heading-same-level

			"C-c C-h m" 'org-table-move-cell-left
			"C-c C-h n" 'org-table-move-cell-down
			"C-c C-h e" 'org-table-move-cell-up
			"C-c C-h i" 'org-table-move-cell-right

			"C-c C-n" 'org-babel-next-block-end
			"C-c C-p" 'org-babel-previous-block-end)
  (:keymaps 'personal
			;; overrides persp-list-buffers in org buffers
			"b" 'org-switchb)
  :init
  (setq org-use-sub-superscripts nil) ;; prevent _ and ^ from altering nearby text
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
		  ;; ("" "lmodern" nil)
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
		'(("a" . "src C :includes <stdio.h> <stdlib.h>\n")
		  ("C" . "comment\n")
		  ("c" . "src clojure\n")
		  ("e" . "src elisp\n")
		  ("f" . "src python :results output\n") ;; defaults to :results value
		  ("g" . "src gdscript\n")
		  ;; ("G" . "src go\n")
		  ("h" . "src html\n")
		  ("i" . "src js\n")
		  ("k" . "src kotlin\n")
		  ("l" . "src lua\n")
		  ("m" . "center\n")
		  ("n" . "src nix\n")
		  ("o" . "src go :imports '(\"fmt\")\n")
		  ("p" . "src powershell\n")
		  ;; ("p" . "src python\n")
		  ;; ("Q" . "src sql-mode\n")
		  ("q" . "src sql\n")
		  ;; ("r" . "src\n")
		  ("r" . "src rust\n")
		  ("s" . "src shell\n")
		  ;; ("t" . "src janet\n")
		  ("t" . "src typescript-ts\n")
		  ("u" . "src jupyter-python\n")
		  ("U" . "src gnuplot\n")
		  ("w" . "src css\n")
		  ;; ("x" . "src restclient\n")
		  ("x" . "src elixir\n")
		  ("y" . "src lilypond :file lily.png\n")
		  ("#" . "src csharp\n")))

  ;; defaults to gcc
  ;; (setq org-babel-C-compiler "clang")

  ;; babel evaluation prompt
  (setq org-confirm-babel-evaluate nil)

  ;; Inf-clojure, cider, babashka (slime, nbb)
  (setq org-babel-clojure-backend 'cider)

  ;; language support
  ;; (with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   ;; (seq-filter
   ;;  (lambda (pair)
   ;;	  (locate-library (concat "ob-" (symbol-name (car pair)))))...)
   '((emacs-lisp . t)
	 (shell . t)
	 ;; (latex . t)
	 (clojure . t)
	 ;; (C . t)
	 ;; (go . t)
	 (gnuplot . t)
	 (typescript . t)
	 (js . t)
	 ;; (jupyter . t)
	 ;; (powershell . t)
	 (python . t)
	 ;; (rust . t)
	 (sql . t)
	 ;; (sql-mode . t)
	 (elixir . t)
	 (nix . t)
	 ;; (janet . t)
	 (csharp . t)
	 ;; (html . t)
	 ;; (kotlin . t) ; not available yet
	 (lua . t)
	 ;; (org . t)
	 ;; (lilypond . t)
	 ;; (restclient . t)
	 ))

  ;; This can be used to customise headers
  ;; (setq org-babel-default-header-args:jupyter-julia '((:async . "yes")
  ;; (:session . "jl")
  ;; (:kernel . "julia-1.0")))

  ;;;;;;;;;;
  ;; TAGS ;;
  ;;;;;;;;;;

  ;; (setq org-fast-tag-selection-single-key nil)
  ;; (setq org-fast-tag-selection-select-todo nil)
  ;; (setq org-fast-tag-selection-maximum-tags 56)

  ;;;;;;;;;;;;;;
  ;;   MISC   ;;
  ;;;;;;;;;;;;;;

  ;; the following can be set on a per file/subtree basis with:
  ;; #+STARTUP: nologdone /  logdone /  lognotedone
  ;; never add whiteline between org sections
  ;; (setq org-cycle-separator-lines 0)

  ;; not needed but good to know
  ;; (setf (cdr (assq 'file org-link-frame-setup)) 'find-file) ;; open links in the same window
  ;; (setq org-treat-S-cursor-todo-selection-as-state-change nil)
  ;; (setq org-enforce-todo-dependencies t)

  ;; deactivate _, ^
  (setq org-hide-emphasis-markers t)

  ;; this method can only change existing chars
  ;; (add-to-list 'org-emphasis-alist '("~" (:foreground "red")))

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

  ;; do not use image real size in org (as it may be too big)
  ;; (setq org-image-actual-width nil)
  (setq org-image-actual-width 300)

  ;; (setq org-support-shift-select 1)) ;; heresy

  (setq org-use-speed-commands t)
  ;; :hook
  ;; might be risky if it cancels normal image display
  ;; (org-babel-after-execute . org-redisplay-inline-images)

  ;;;;;;;;;;;;;;;;;;;;;
  ;;   HTML EXPORT   ;;
  ;;;;;;;;;;;;;;;;;;;;;

  ;; don't touch those
  ;; (setq org-html-doctype-alist nil)
  ;; (setq org-html-doctype "")

  (setq org-html-postamble nil
		org-html-head-include-default-style nil
		org-html-meta-tags nil
		org-html-xml-declaration nil)

  ;;;;;;;;;;;;;;;
  ;; FUNCTIONS ;;
  ;;;;;;;;;;;;;;;

  (defun org-summary-todo (n-done n-not-done)
	"Switch entry to DONE when all subentries are done, to TODO otherwise."
	(let (org-log-done org-log-states) ;; turn off logging
	  (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook #'org-summary-todo)


  ;;;;;;;;;;;;;;;;;;;
  ;;   FUNCTIONS   ;;
  ;;;;;;;;;;;;;;;;;;;

  (defun org-babel-kill-ring-save-src-block-at-point ()
	(interactive)
	(kill-new (org-element-property :value (org-element-at-point))))

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

  ;; ;; Close only unless top level
  ;; (defun org-open-next-heading-2 ()
  ;;   "Close the current heading, move to the next visible heading at the
  ;;    current level, and show the children of that heading."
  ;;   (interactive)
  ;;   (outline-hide-sublevels (org-outline-level))
  ;;   (org-next-visible-heading 1)
  ;;   (outline-show-children))

  ;; Close and systematically open next level
  (defun org-open-next-heading ()
	(interactive)
	(outline-hide-sublevels (org-outline-level))
	(org-next-visible-heading 1)
	(outline-show-subtree))

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
  )
