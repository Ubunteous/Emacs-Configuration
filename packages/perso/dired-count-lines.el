;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          DIRED-COUNT-LINES         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun dired-count-lines ()
  "Count the line number of each marked readable regular file in the dired buffer."
  (interactive)

  (save-excursion
    (dired-map-over-marks
     (let ((file (dired-file-name-at-point)))
       (when (and (file-regular-p file)
		  (file-readable-p file))
	 (with-temp-buffer
	   (insert-file-contents file)
	   (setq init (funcall
		       #'+
		       (count-lines (point-min) (point-max)))))))
     nil))
  
  (when (called-interactively-p 'any)
    (message "Lines: %s" init))
  init)

;; shadows dired-prev/next-dirline but I don't need them with meow
;; alternatively, / is a free binding
(general-define-key
 :keymaps 'dired-mode-map
 "<" 'dired-count-lines)
