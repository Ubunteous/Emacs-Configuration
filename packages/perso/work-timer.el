;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             WORK-TIMER             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst work-timer-version "0.4")

;;; Commentary:
(defgroup work-timer '()
  "A simple package to help deal with procrastination.")

;;; Commands:
;;
;; Below are complete command list:
;;
;;  `work-timer-start'
;;    Start the work timer.
;;  `work-timer-stop'
;;    Stop the work timer.
;;  `work-timer-reset'
;;    Reset the work timer in relax mode.
;;  `work-timer-reset-work'
;;    Reset the work timer in work mode.
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;
;;  `work-timer-working-time'
;;    Time fragment that you should spend working (in minutes).
;;    default = 10
;;  `work-timer-relax-time'
;;    Time fragment that you should spend relaxing (in minutes).
;;    default = 2
;;  `work-timer-work-hook'
;;    Hook that is run when it is time to work.
;;    default = nil
;;  `work-timer-relax-hook'
;;    Hook that is run when it is time to relax.
;;    default = nil

;;; interactive commands:
;; work-timer-start - Start the work timer
;; work-timer-reset - reset the timer in relax mode
;; work-timer-reset-work - reset the work timer in work mode
;; work-timer-stop - stop the work timer

;;; Code:
(defun work-timer--take-a-break ()
  (interactive)
  (switch-to-buffer (get-buffer-create "*breaktime*"))
  (let ((inhibit-read-only t))
    (erase-buffer)
    (animate-string "Time to take a break"
                    (/ (window-height) 2) (- (/ (window-width) 2) 12)))
  (set-buffer-modified-p nil)
  (view-mode))



(defcustom work-timer-working-time 10
  "Time fragment that you should spend working (in minutes)."
  :type 'float
  :group 'work-timer)

(defcustom work-timer-relax-time 2
  "Time fragment that you should spend relaxing (in minutes)."
  :type 'float
  :group 'work-timer)

(defcustom work-timer-work-hook nil
  "Hook that is run when it is time to work."
  :type 'hook
  :group 'work-timer)

(defcustom work-timer-relax-hook nil
  "Hook that is run when it is time to relax."
  :type 'hook
  :group 'work-timer)

(defvar work-timer-timer nil
  "Actual timer for work-timer.")

(defvar work-timer-state 'not-started
  "Shows the actual state of the worktimer.
Can be one of the following symbols:
  not-started
  work-time
  relax-time")

;;* timer  relax
(defun work-timer--relax ()
  "Internal function to set the timer mode to relax."
  (when (timerp work-timer-timer)
    (cancel-timer work-timer-timer))
  (setq work-timer-state 'relax-time)

  (run-hooks 'work-timer-relax-hook)
  (work-timer--take-a-break)

  (setq work-timer-timer (run-with-timer (* 60 work-timer-relax-time) nil 'work-timer--work)))

;;* timer work
(defun work-timer--work ()
  "Internal function to set the timer mode to work."
  (when (timerp work-timer-timer)
    (cancel-timer work-timer-timer))
  (setq work-timer-state 'work-time)
  
  (run-hooks 'work-timer-work-hook)
  (work-timer--take-a-break)
  
  (setq work-timer-work (run-with-timer (* 60 work-timer-working-time) nil 'work-timer--relax)))

;;* interactive work
(defun work-timer-start ()
  "Start the work timer.

This will call todochiku to tell  you to work, and then run `work-timer-work-hook'."
  (interactive)
  (work-timer--work)
  "Work Timer Started")

;;* interactive cancel
(defun work-timer-stop ()
  "Stop the work timer.

This will call todochiku to tell you to chill the heck out, and run
`work-timer-relax-hook'."
  (interactive)
  (when (not (null work-timer-timer))
    (cancel-timer work-timer-timer))
  (work-timer--take-a-break)
  (setq work-timer-state 'not-started)
  "Work Timer Cancelled.")

;;* interactive cancel relax
(defun work-timer-reset ()
  "Reset the work timer in relax mode."
  (interactive)
  (work-timer--relax)
  "Reset to Relax Mode")

;;* interactive cancel work
(defun work-timer-reset-work ()
  "Reset the work timer in work mode."
  (interactive)
  (work-timer--work)
  "Reset to Work Mode")

;;* test
(when nil
  "Testing"
  (progn
    "Setup for easy testing."
    (setq work-timer-working-time 0.5)
    (setq work-timer-relax-time 0.5))
  (work-timer-start)
  (progn
    "Undo testing."
    (setq work-timer-working-time 10)
    (setq work-timer-relax-time 2)
    (work-timer-stop))
  )


(provide 'work-timer)

;;; work-timer.el ends here
