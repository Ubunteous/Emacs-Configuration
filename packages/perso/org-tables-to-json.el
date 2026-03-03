;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;         ORG-TABLES-TO-JSON         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl-lib)

(defun org-collect-table-names ()
  "Return all #+name: values in current buffer."
  (org-element-map (org-element-parse-buffer)
      'table
    (lambda (tbl)
      (plist-get (cadr tbl) :name))))

(defun orgtbl-to-json (table)
  "Convert org TABLE to JSON."
  (orgtbl-to-generic

   (let ((formatted-header (mapcar (-rpartial 'concat "\": \"") (car table)))
         (content (cdr table)))
     (mapcar (lambda (row)
               (cl-mapcar #'concat formatted-header row))
             content))

   (org-combine-plists
    '(:sep ",\n"
           :tstart "{" :tend "}"
           :lstart "\t{\n" :lend "\n\t},"
           :llstart "\t{\n" :llend "\n\t}"
           :fmt (lambda (cell) (format "  \t\t\"%s\"" cell))))))

(defun write-to-file (filename data)
  (with-temp-file filename (insert data)))

(defun write-org-table-to-file (filepath table)
  (write-to-file filepath (orgtbl-to-json table)))

(defun org-get-table-content-by-name (name)
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
	 (write-org-table-to-file
	  (concat "~/Desktop/json/" table-name ".json")
	  (org-get-table-content-by-name table-name)))
   (org-collect-table-names)))
