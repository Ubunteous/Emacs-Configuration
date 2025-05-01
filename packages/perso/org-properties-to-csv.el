;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;        ORG-PROPERTIES-TO-CSV       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use these functions in an org buffer to retrieve properties
;; * Functions
;; :PROPERTIES:
;; :prop1: "property 1"
;; :END:

(require 'cl-lib)

(defun alist-intersection-values (alist keys)
  "Return values from ALIST for KEYS that intersect with keys in ALIST."
  (let* ((alist-keys (mapcar 'car alist))
         (intersection (cl-intersection keys alist-keys :test 'equal)))
    (mapcar (lambda (key)
              (cdr (assoc key alist)))
            intersection)))

(defun get-org-properties ()
  (let* ((columns (remove "ID" (org-buffer-property-keys)))
		 (rcolumns (reverse columns)))
	(cons
	 columns
	 (org-map-entries '(lambda ()
						 (alist-intersection-values
						  (org-entry-properties)
						  (mapcar 'upcase
							  rcolumns)))))))

(defun alist-to-strings (list)
  (mapcar
   #'(lambda (entry) (string-join entry ";"))
   list))


(defun write-strings-to-file (strings filename)
  (with-temp-buffer
    (mapc (lambda (s)
			(when (not (string-empty-p s))
			  (insert (concat s "\n")))) strings)
    (write-region (point-min) (point-max) (concat "~/org/Projets/Alter/csv/" filename) nil)))


(defun org-properties-to-csv () (interactive)
	   (write-strings-to-file
		(alist-to-strings (get-org-properties))
		(string-replace "org" "csv"
						(buffer-name) ;; could also be org-get-title
						)))
