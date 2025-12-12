;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               EDITION              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun replace-string-in-current-buffer ()
  ;; replace matches both above and below point
  (interactive)
  (if (use-region-p)
	  (call-interactively 'replace-string)
	(let ((current-view (window-start)))
	  (save-excursion
		(goto-char (point-min))
		(set-window-start (selected-window) current-view)
		(call-interactively 'replace-string)
		(pop global-mark-ring)
		(pop mark-ring)))))
