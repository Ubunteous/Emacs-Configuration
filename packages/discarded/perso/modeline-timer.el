;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           MODELINE-TIMER           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl-lib)
(require 'subr-x)

(setq breaktime-interval 9) ;; (* 3 3 3) ;; time in seconds

(defgroup mode-line-timer nil
  "Simple timer"
  :prefix "mode-line-timer-"
  :group 'timer)

(defcustom mode-line-timer-mode-line-sign "●"
  "Sign of timer"
  :type 'string)

(defcustom mode-line-expire-hook nil
  "Hook run after timer expired."
  :type 'hook)

(defface mode-line-timer-sign
  '((((class color) (min-colors 88) (background light))
     :foreground "blue")
    (((class color) (background dark))
     (:foreground "cyan"))
    (t nil))
  "mode-line-face")

(defface mode-line-timer-timer
  '((t (:weight bold)))
  "mode-line-face")

(defvar mode-line-timer--timer nil)
(defvar mode-line-timer--remainder-seconds 0)
(defvar mode-line-timer--mode-line "")

(defsubst mode-line-timer--time-to-string (seconds)
  (format "%02d:%02d" (/ seconds 60) (mod seconds 60)))

(defun mode-line-timer--propertize-mode-line ()
  (unless (string-empty-p mode-line-timer--mode-line)
    (concat (propertize mode-line-timer-mode-line-sign 'face 'mode-line-timer-sign)
            (propertize mode-line-timer--mode-line 'face 'mode-line-timer-timer))))

(defun mode-line-timer--set-mode-line ()
  (setq mode-line-timer--mode-line
        (mode-line-timer--time-to-string mode-line-timer--remainder-seconds)))

(defun mode-line-timer--tick ()
  (let ((remainder-seconds (1- mode-line-timer--remainder-seconds)))
    (if (< remainder-seconds 0)
        (progn
          (mode-line-timer-stop)
          (run-hooks 'mode-line-expire-hook))
      (cl-decf mode-line-timer--remainder-seconds)
      (mode-line-timer--set-mode-line)
      (mode-line-timer--propertize-mode-line)
      (force-mode-line-update))))

;;(defsubst mode-line-timer--set-remainder-second (minutes)
;;  (setq mode-line-timer--remainder-seconds (* 60 minutes)))

;;;###autoload
(defun mode-line-timer-start () ;; (&optional minutes)
  (interactive)
  (when mode-line-timer--timer
    (error "Already start timer!!"))
  ;; (unless minutes
  ;;  (setq minutes (read-number "How long minutes " 25)))
  (setq mode-line-timer--remainder-seconds breaktime-interval)
  ;; (mode-line-timer--set-remainder-second minutes)
  (setq mode-line-timer--timer (run-with-timer 0 1 'mode-line-timer--tick)))

(defun mode-line-timer-stop ()
  (interactive)
  (cancel-timer mode-line-timer--timer)
  (setq mode-line-timer--timer nil
        mode-line-timer--mode-line "")
  (force-mode-line-update))

(defun mode-line-timer-done ()
  (interactive)
  (mode-line-timer-stop)
  (run-hooks 'mode-line-expire-hook))

(unless (member '(:eval (mode-line-timer--propertize-mode-line)) mode-line-format)
  (setq-default mode-line-format
                (cons '(:eval (mode-line-timer--propertize-mode-line))
                      mode-line-format)))

(provide 'mode-line-timer)

;;; mode-line-timer.el ends here
