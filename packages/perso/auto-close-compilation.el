;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;       AUTO-CLOSE-COMPILATION       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun compile-autoclose (buffer string)
  "Hide successful builds window with BUFFER and STRING."
  (if (string-match "finished" string)
      (progn
        (message "Build finished :)")
        (run-with-timer 3 nil
                        (lambda ()
                          (when-let* ((multi-window (> (count-windows) 1))
                                      (live (buffer-live-p buffer))
                                      (window (get-buffer-window buffer t)))
                            (delete-window window)))))
    (message "Compilation %s" string)))

(setq compilation-finish-functions (list #'compile-cache-env #'compile-autoclose))

;; same as one-liner below
;; (defun colorize-compilation-buffer ()
;;   (let ((inhibit-read-only t))
;;     (ansi-color-apply-on-region (point-min) (point-max))))

;; (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)
