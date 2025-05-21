;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           ORG-CTRL-C-PLUS          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun org-ctrl-c-plus ()
  "Insert separator line in table or modify bullet status of line.
Also turns a plain line or a region of lines into list items.
Calls `org-table-insert-hline', `org-toggle-item', or
`org-cycle-list-bullet', depending on context."
  (interactive)
  (cond
   ((org-at-table-p)
    (call-interactively 'org-table-insert-hline))
   ((org-region-active-p)
    (call-interactively 'org-toggle-item)
	(call-interactively 'org-shiftright))
   ((org-in-item-p)
    (call-interactively 'org-cycle-list-bullet))
   (t
    (call-interactively 'org-toggle-item)
	(call-interactively 'org-shiftright))))
