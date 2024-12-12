;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          DIRED-COUNT-LINES         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'subr-x)
(cl-defun dired-count-lines (fun)
  "Apply FUN to each marked readable regular file in the dired buffer.
FUN can be an expression or a function.
If FUN is a function apply ARGS to it otherwise ARGS are ignored.
Interactively ARGS are read from minibuffer up to empty input.
ARGS are evaluated in the temporary file buffer.
For an example quoted arguments '(point-min) and '(point-max) evaluate
to the limits of point in the marked files."
  (interactive
   (let
       ((fun '(count-lines (point-min) (point-max))))
     (list fun)
     ))

  (let ((init 0)
	(reduction #'+))
    (save-excursion
      (dired-map-over-marks
       (let ((file (dired-file-name-at-point)))
	 (when (and (file-regular-p file)
                    (file-readable-p file))
	   (with-temp-buffer
             (insert-file-contents file)
             (setq init
		   (funcall
                    reduction
                    (if (functionp fun)
			;; args unused. remove later
			(apply fun (mapcar #'eval args))
                      (eval fun))
                    init)))))
       nil))
    (when (called-interactively-p 'any)
      (message "Result: %s" init))
    init))
