;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;         ORG-TABLES-TO-JSON         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl-lib)

(defun orgtbl--collect-table-names ()
  "Return all #+name: values in current buffer."
  (org-element-map (org-element-parse-buffer)
      'table
    (lambda (tbl)
      (plist-get (cadr tbl) :name))))

(defun orgtbl--to-json (table)
  "Convert org TABLE to JSON."
  (setq orgtbl-index -1)

  (let ((make-bracket-with-id
		 (lambda ()
		   (progn
			 (setq orgtbl-index (+ 1 orgtbl-index))
			 (concat "\t\"" (number-to-string orgtbl-index) "\": {\n")))))

	(orgtbl-to-generic

	 (let ((formatted-header (mapcar (-rpartial 'concat "\": \"") (car table)))
           (content (cdr table)))
       (mapcar (lambda (row)
				 (cl-mapcar #'concat formatted-header row))
               content))

	 (org-combine-plists
      '(
		:sep ",\n"
		:tstart "{" :tend "}"
		:lstart (lambda () (funcall make-bracket-with-id)) :lend "\n\t},"
		:llstart (lambda () (funcall make-bracket-with-id)) :llend "\n\t}"
		:fmt (lambda (cell) (format "  \t\t\"%s\"" cell)))))))

(defun orgtbl--write-to-file (filepath table)
  (with-temp-file filepath (insert (orgtbl--to-json table))))

(defun orgtbl--get-content-by-name (name)
  (let ((pos (catch 'pos
			   (cl-loop for table in  (org-element-map (org-element-parse-buffer) 'table 'identity)
						do
						(when (string= name (org-element-property :name table))
						  (throw 'pos (org-element-property :contents-begin table)))))))
    (when pos
      (goto-char pos)
      (remove 'hline (org-table-to-lisp)))))

(defun org-convert-named-tables-to-json ()
  "Save to ~/Desktop/json/table.org org tables with a #+name: in current buffer."
  (interactive)
  (mapcar
   (lambda (table-name)
	 (orgtbl--write-to-file
	  (concat "~/Desktop/json/" table-name ".json")
	  (orgtbl--get-content-by-name table-name)))
   (orgtbl--collect-table-names)))
