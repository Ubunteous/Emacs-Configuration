;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          DIRED-COUNT-LINES         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'subr-x)
(cl-defun dired-count-lines ()
  "Count the line number of each marked readable regular file in the dired buffer."
  (interactive)

  (let ((init 0)
	(reduction #'+)
	(fun '(count-lines (point-min) (point-max))))

    (save-excursion
      (dired-map-over-marks
       (let ((file (dired-file-name-at-point)))
	 (when (and (file-regular-p file)
                    (file-readable-p file))
	   (with-temp-buffer
             (insert-file-contents file)
             (setq init
		   (funcall reduction
			    (eval fun)
			    init)))))
       nil))
    (when (called-interactively-p 'any)
      (message "Lines: %s" init))
    init))

;; (general-define-key
;;  :keymaps 'dired-mode-map
;;  "/" 'dired-count-lines)

;; shadows dired-prev/next-dirline but I don't need them with meow
(general-define-key
 :keymaps 'dired-mode-map
 "<" 'dired-count-lines)
