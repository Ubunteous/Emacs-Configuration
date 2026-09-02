;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             OB-LILYPOND            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org ; lilypond
  :defer t
  :ensure nil
  :config
  ;; (autoload 'LilyPond-mode "lilypond-mode")

  (setq org-babel-lilypond-paper-settings
		"\\paper {
		   page-breaking = #ly:one-line-auto-height-breaking
		   top-margin = -3
		   bottom-margin = 4
		   left-margin = 3
		   right-margin = 3
		}")

  ;; redefine to replace old eps backend by cairo
  (defun org-babel-lilypond-process-basic (body params)
	"Execute a lilypond block in basic mode.
See `org-babel-execute-src-block' for BODY and PARAMS."
	(let* ((out-file (cdr (assq :file params)))
		   (file-type (file-name-extension out-file))
		   (cmdline (or (cdr (assq :cmdline params))
						""))
		   (in-file (org-babel-temp-file "lilypond-")))

	  (with-temp-file in-file
		(insert
		 (format org-babel-lilypond-paper-settings file-type)
		 (org-babel-expand-body:generic body params)))
	  (org-babel-eval
	   (concat
		org-babel-lilypond-ly-command
		" -dbackend=\"cairo\" "
		"-dno-gs-load-fonts "
		"-dinclude-eps-fonts "
		(or (assoc-default file-type
						   '(("pdf" . "--pdf ")
							 ("cairo" . "--cairo ")))
			"--png ")
		"--output="
		(file-name-sans-extension out-file)
		" "
		cmdline
		in-file)
	   ""))
	nil))
