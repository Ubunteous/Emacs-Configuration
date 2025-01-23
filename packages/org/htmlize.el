;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               HTMLIZE              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package htmlize
  :defer t
  :after org
  :config
  (require 'ox-publish)

  ;; (setq org-export-with-title t)
  ;; (setq org-export-with-section-numbers nil)
  ;; (setq org-html-validation-link nil)
  ;; (setq org-export-with-date nil)

  (setq org-html-validation-link nil ;; hide validation link
	org-html-head-include-scripts nil ;; own scripts
	org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />"
	org-html-head-include-default-style nil) ;; own styles

  (let*
      ((org-dir "~/../../Documents/repos/MaPetiteDoc/")
       (doc-dir (concat org-dir "src/"))
       (export-dir (concat org-dir "export/")))
    
    ;; use with M-x org-publish-project
    (setq org-publish-project-alist
	  `(
	    ("org-notes"
	     :base-directory ,doc-dir
	     :base-extension "org"
	     :publishing-directory ,export-dir
	     :recursive t
	     :publishing-function org-html-publish-to-html
	     :headline-levels 4 ; default
	     :with-title t
	     ;; :with-author nil
	     ;; :with-creator nil
	     :with-toc t
	     ;; :with-tables t
	     :section-numbers nil
	     :time-stamp-file nil
	     :auto-preamble t)
	    
	    ("org-static"
	     :base-directory ,doc-dir
	     :base-extension "css\\|js\\|png\\|jpg\\|gif"
	     :publishing-directory ,export-dir
	     :recursive t
	     :publishing-function org-publish-attachment)
	    
	    ("org" :components ("org-notes" "org-static"))))))
