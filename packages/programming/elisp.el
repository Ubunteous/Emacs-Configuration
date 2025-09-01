;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                ELISP               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun elisp-find-definition (name)
  "Jump to the definition of the function (or variable) at point."
  (interactive (list (thing-at-point 'symbol)))
  (cond (name
         (let ((symbol (intern-soft name))
               (search (lambda (fun sym)
                         (let* ((r (save-excursion (funcall fun sym)))
                                (buffer (car r))
                                (point (cdr r)))
                           (cond ((not point)
                                  (error "Found no definition for %s in %s"
                                         name buffer))
                                 (t
                                  (switch-to-buffer buffer)
                                  (goto-char point)
                                  (recenter 1)))))))
           (xref-push-marker-stack)
           (cond ((fboundp symbol)
                  (push-mark)
                  (funcall search 'find-function-noselect symbol))
                 ((boundp symbol)
                  (push-mark)
                  (funcall search 'find-variable-noselect symbol))
                 ((or (featurep symbol) (locate-library symbol))
                  (push-mark)
                  (find-library name))
                 (t
                  (error "Symbol not bound: %S" symbol)))))
        (t (message "No symbol at point"))))
