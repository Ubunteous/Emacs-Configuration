;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            SMART-INSERT            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun smart-insert-semicolon ()
  "Checks the last char of a line to figure out if
a semicolon needs to be added before inserting a newline"
  (interactive)
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

(defun smart-insert-colon ()
  "Checks the first and last char of a line to figure out if
a colon needs to be added before inserting a space"
  (interactive)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PYTHON/GD SMART INSERT ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq colon-word-prefixes
	  #s(hash-table
		 test equal
		 data
		 ("if" t
		  "for" t
		  "while" t
		  "def" t
		  ;; gdscript only
		  "func" t
		  "match" t)))

(defun get-first-word-in-line ()
  "Get the first word in the current line."
  (interactive)
  (let ((first-word (save-excursion
                      (back-to-indentation)
                      (thing-at-point 'word))))
    (if first-word
        first-word
      nil)))

(defun smart-insert-colon-python ()
  "Checks the first and last char of a line to figure out if
a colon needs to be added before inserting a space"
  (interactive)
  (when
      (and
	   (gethash (get-first-word-in-line) colon-word-prefixes)
	   ;; last character is a word. does not work as func() ends with )
	   ;; (= ?w (char-syntax (char-before))))
	   (not (= ?. (char-syntax (char-before))))) ;; for colon :
	(insert ":"))
  (newline-and-indent))
