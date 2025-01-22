;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            SMART-INSERT            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun smart-insert-semicolon () (interactive)
       """Checks the last char of a line to figure out if
a semicolon needs to be added before inserting a newline"""
       (when
	   (and
	    ;; current line is not a comment
	    (save-excursion
	      (call-interactively 'back-to-indentation)
	      (and
	       (not (eobp)) ;; check char-after exists
	       (not (= ?/ (char-after)))))
	    
	    ;; cursor is at the end of the line
	    (eolp)
	    
	    ;; last character is a word or a closing delimiter
	    (or
	     (= ?w (char-syntax (char-before))) ;; word
	     (member (char-before) '(?\) ?\] ?\" ?\%))))

	 (insert ";"))
       (newline-and-indent))

(defun smart-insert-colon () (interactive)
       """Checks the first and last char of a line to figure out if
a colon needs to be added before inserting a space"""
       (when
	   (and
	    ;; current line is not a comment/selector (starts with whitespace/indent)
	    (save-excursion
	      (call-interactively 'beginning-of-line)
	      (and
	       (not (eobp)) ;; check char-after exists
	       (or
		(= ?  (char-after))
		(= ?\C-i  (char-after)))))
	    
	    ;; cursor is at the end of the line
	    ;; (eolp)
	    
	    ;; last character is a word
	    (= ?w (char-syntax (char-before))))

	 (insert ":"))
       (insert " "))
