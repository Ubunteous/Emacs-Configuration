;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;        ORG-PROPERTIES-TO-CSV       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use these functions in an org buffer to retrieve properties
;; * Functions
;; :PROPERTIES:
;; :prop1: "property 1"
;; :END:

(defun get-org-properties ()
  (cons

   (cons
	'Sections
	(mapcar 'car
			(cdr (org-entry-properties nil 'standard))))

   (org-map-entries
	(lambda ()
	  (cons
	   (concat "Section " (org-get-heading t t))
	   (mapcar 'cdr
			   (cdr (org-entry-properties nil 'standard))))))))



(defun alist-to-strings (list)
  (mapcar
   #'(lambda (entry) (string-join (cdr entry) ", "))
   list))


(defun write-strings-to-file (strings filename)
  (with-temp-buffer
    (mapc (lambda (s)
			(when (not (string-empty-p s))
			  (insert (concat s "\n")))) strings)
    (write-region (point-min) (point-max) filename nil)))


(defun org-properties-to-csv () (interactive)
	   (write-strings-to-file
		(alist-to-strings (get-org-properties))
		(string-replace "org" "csv" (buffer-name))))
