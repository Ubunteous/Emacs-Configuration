;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               HEADER               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package s)

(defun insert-header ()
  "insert a nice header with the current buffer name at the beginning of said buffer"
  (interactive)

  (setq border ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;")

  (setq name
	(upcase (nth 0 (s-split "\\." (buffer-name)))))

  (setq len-name (length name))

  (setq nb-spaces (/ (- (length border) len-name 4) 2))

  (message "%s" (int-to-string nb-spaces))

  (setq white-insert (make-string nb-spaces ? ))

  (goto-char (point-min))
  
  (insert (format "%s\n;;%s;;\n%s\n\n"
		  border
		  (concat white-insert (if (eq 0 (% len-name 2))  "" " ") name white-insert)
		  border)))
