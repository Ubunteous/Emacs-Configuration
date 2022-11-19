;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             BREAK-TIME             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; See: https://www.reddit.com/r/emacs/comments/3icpo7/take_a_break_every_3_hours/
(defvar breaktime-timer nil
  "Holds the running break timer (if any).")
(defvar breaktime-interval (* 22 60)) ;; 20 minutes
;; "How often to take a break, in seconds.")

;;
;; (defun multi-timers-start ()
;;   (interactive)
;;   (breaktime-start)
;;   (mode-line-timer-start)
;;   )

;; (defun multi-timers-stop ()
;;   (interactive)
;;   (breaktime-stop)
;;   ;; (mode-line-timer-done)
;; )
;;

;; (defun breaktime--take-a-break ()
;;   (interactive)
;;   (switch-to-buffer (get-buffer-create "*breaktime*"))
;;   (let ((inhibit-read-only t))
;;     (erase-buffer)
;;     (animate-string "Time to take a break"
;;                     (/ (window-height) 2) (- (/ (window-width) 2) 12)))
;;   (set-buffer-modified-p nil)
;;   (view-mode))


(defun break-notifier ()
  (interactive)
  (shell-command "dunstify \"It's time for a break\""))


(defun breaktime-start (&optional seconds)
  (interactive)
  (when breaktime-timer
    (cancel-timer breaktime-timer))
  (unless seconds
    (setq seconds (read-number "How long (seconds) " breaktime-interval)))
  (setq breaktime-timer
	(run-at-time t seconds 'break-notifier)))
;; (run-at-time t breaktime-interval 'breaktime--take-a-break)))
;; (run-at-time t seconds 'breaktime--take-a-break)))

(defun breaktime-stop ()
  (interactive)
  (when breaktime-timer
    (cancel-timer breaktime-timer)
    (setq breaktime-timer nil)))
