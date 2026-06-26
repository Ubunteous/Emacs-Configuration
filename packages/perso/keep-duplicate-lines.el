;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;        KEEP-DUPLICATE-LINES        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; opposite of delete-duplicate-lines
(defun keep-duplicate-lines ()
  (interactive)
  (let (lines dups)
	(save-excursion
	  (goto-char (point-max))
	  (when (/= (char-after (1- (point-max))) ?\n)
		(newline))
	  (goto-char (point-min))
	  (while (not (eobp))
		(forward-line 1)
		(push (buffer-substring-no-properties (line-beginning-position)
											  (line-end-position))
			  lines))
	  (dolist (line lines)
		(when (and (> (cl-count line lines :test 'equal) 1)
				   (not (string= "" line)))
		  (push (regexp-quote line) dups)))
	  (goto-char (point-min))
	  (keep-lines (mapconcat #'identity
							 dups
							 "\\|")))))
