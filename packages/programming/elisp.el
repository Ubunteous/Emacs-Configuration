;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                ELISP               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package elisp
  :ensure nil
  :defer t
  :init
  ;; (defun eval-region-or-buffer ()
  ;; 	(interactive)
  ;; 	(cond
  ;; 	 (mark-active
  ;;     (call-interactively 'eval-region)
  ;;     (message "Region evaluated!")
  ;;     (setq deactivate-mark t))
  ;; 	 (t
  ;;     (save-buffer)
  ;;     (eval-buffer)
  ;;     (message "Buffer evaluated!"))))

  (defun eval-last-sexp-or-region (prefix)
	"Eval region from BEG to END if active, otherwise the last sexp."
	(interactive "P")
	(if (and (mark) (use-region-p))
		(eval-region (min (point) (mark)) (max (point) (mark)))
      (pp-eval-last-sexp prefix)))

  ;; :config
  ;; (define-short-documentation-group list
  ;; 	"Making Lists"
  ;; 	(make-list
  ;; 	 :eval (make-list 5 'a))
  ;; 	(cons
  ;; 	 :eval (cons 1 '(2 3 4))))
  :general (
			;; "C-c x" 'eval-region-or-buffer
			[remap eval-last-sexp] 'eval-last-sexp-or-region)
  ;; :hook
  ;; (after-save . check-parens)

  (:keymaps 'emacs-lisp-mode-map
			;; note: # can be used before a lambda which may be byte compiled
			;; "C-c x" #'(lambda () (interactive) (save-buffer) (eval-buffer) (message "buffer eval complete"))
			"C-c x" 'eval-region-or-buffer))


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
								  ;; better practice to use a non-user facing function as display-buffer
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


;; (defun headerise-elisp ()
;;   "Add minimal header and footer to an elisp buffer in order to placate flycheck."
;;   (interactive)
;;   (let ((fname (if (buffer-file-name)
;;                    (file-name-nondirectory (buffer-file-name))
;;                  (error "This buffer is not visiting a file"))))
;;     (save-excursion
;;       (goto-char (point-min))
;;       (insert ";;; " fname " --- Insert description here -*- lexical-binding: t -*-\n"
;;               ";;; Commentary:\n"
;;               ";;; Code:\n\n")
;;       (goto-char (point-max))
;;       (insert ";;; " fname " ends here\n"))))
