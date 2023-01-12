;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               HEADER               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun insert-header ()
  "Insert a nice header with the current buffer name at the beginning of said buffer."
  (interactive)

  (if comment-start
      (let* ((comment-char (string-to-char comment-start))
	     (border (make-string 40 comment-char))
	     (two-sep (make-string 2 comment-char))
	     (name (upcase (file-name-sans-extension (buffer-name))))
	     (len-name (length name))
	     (nb-spaces (/ (- (length border) len-name 4) 2))
	     (white-insert (make-string nb-spaces ? )))

	;; go to the beginning of the buffer
	;; (goto-char (point-min)) ;; (goto-char 1) works as well
	
	(insert (concat border "\n"
			two-sep white-insert (if (eq 0 (% len-name 2))  "" " ") name white-insert two-sep "\n"
			border "\n\n")))

    ;; Some modes can't support this function.
    (message "Can't place a header here. The current mode does not have a comment-start character" )))
