;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              CALENDAR              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package calendar
  :defer t
  :ensure nil
  ;; :straight (:type built-in)
  :general
  (:keymaps 'calendar-mode-map
	    "<" 'lawlist-scroll-year-calendar-backward
	    ">" 'lawlist-scroll-year-calendar-forward))


(defmacro lawlist-calendar-for-loop (var from init to final do &rest body)
  "Execute a for loop.
Evaluate BODY with VAR bound to successive integers from INIT to FINAL,
inclusive.  The standard macro `dotimes' is preferable in most cases."
  `(let ((,var (1- ,init)))
     (while (>= ,final (setq ,var (1+ ,var)))
       ,@body)))

(defun year-calendar (&optional month year)
  "Generate a one (1) year calendar that can be scrolled by month in each direction.
This is a modification of:  http://homepage3.nifty.com/oatu/emacs/calendar.html
See also:  http://ivan.kanis.fr/caly.el"
  (interactive)
  (require 'calendar)
  (let* ((current-year (number-to-string (nth 5 (decode-time (current-time)))))
         ;; (month (if month month
	 ;; 	  (string-to-number
	 ;; 	   (read-string "Please enter a month number (e.g., 1):  " nil nil "1"))))
	 (month 1)
         ;; (year (if year year
	 ;; 	 (string-to-number
	 ;; 	  (read-string "Please enter a year (e.g., 2014):  "
	 ;; 		       nil nil current-year))))
	 (year (string-to-number current-year))
	 )
    (switch-to-buffer (get-buffer-create calendar-buffer))
    (when (not (eq major-mode 'calendar-mode))
      (calendar-mode))
    (setq displayed-month month)
    (setq displayed-year year)
    (setq buffer-read-only nil)
    (erase-buffer)
    ;; horizontal rows
    (lawlist-calendar-for-loop j from 0 to 3 do
			       ;; vertical columns
			       (lawlist-calendar-for-loop i from 0 to 2 do
							  (calendar-generate-month
							   ;; month
							   (cond
							    ((> (+ (* j 3) i month) 12)
							     (- (+ (* j 3) i month) 12))
							    (t
							     (+ (* j 3) i month)))
							   ;; year
							   (cond
							    ((> (+ (* j 3) i month) 12)
							     (+ year 1))
							    (t
							     year))
							   ;; indentation / spacing between months
							   (+ 5 (* 25 i))))
			       (goto-char (point-max))
			       (insert (make-string (- 10 (count-lines (point-min) (point-max))) ?\n))
			       (widen)
			       (goto-char (point-max))
			       (narrow-to-region (point-max) (point-max)))
    (widen)
    (goto-char (point-min))
    (setq buffer-read-only t)))

(defun lawlist-scroll-year-calendar-forward (&optional arg event)
  "Scroll the yearly calendar by month in a forward direction."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     last-nonmenu-event))
  (unless arg (setq arg 1))
  (save-selected-window
    (if (setq event (event-start event)) (select-window (posn-window event)))
    (unless (zerop arg)
      (let ((month displayed-month)
            (year displayed-year))
        (calendar-increment-month month year arg)
        (year-calendar month year)))
    (goto-char (point-min))
    (run-hooks 'calendar-move-hook)))

(defun lawlist-scroll-year-calendar-backward (&optional arg event)
  "Scroll the yearly calendar by month in a backward direction."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     last-nonmenu-event))
  (lawlist-scroll-year-calendar-forward (- (or arg 1)) event))
