;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    PROGRAMMING LANGUAGE: JUPYTER   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load emacs-zmq silently
(defun load-file (file)
  "Load the Lisp file named FILE."
  ;; This is a case where .elc and .so/.dll make a lot of sense.
  (interactive (list (let ((completion-ignored-extensions
			    (remove module-file-suffix
				    (remove ".elc"
					    completion-ignored-extensions))))
		       (read-file-name "Load file: " nil nil 'lambda))))

  (if (eq file 'emacs-zmq.so)
      (load (expand-file-name file) nil nil t)
    (load (expand-file-name file) nil t t)))


;; can be combined with org
(use-package jupyter
  :defer t
  ;; :custom
  ;; (jupyter-runtime-directory "~/.local/share/jupyter/runtime/")
  :general
  (org-mode-map
   "C-c j"
   '(lambda () (interactive)
      (tempel-insert 'jupyter))))


;; add jupyter-python to babel
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  (append org-babel-load-languages
;;          '((jupyter . t))))

;;;;;;;;;;;;;;;;;;;
;;    KERNELS    ;;
;;;;;;;;;;;;;;;;;;;

(defun my/get-open-ports ()
  (mapcar
   #'string-to-number
   (split-string (shell-command-to-string "ss -tulpnH | awk '{print $5}' | sed -e 's/.*://'") "\n")))


(setq my/jupyter-runtime-folder (expand-file-name "~/.local/share/jupyter/runtime"))

(defun my/list-jupyter-kernel-files ()
  (mapcar
   (lambda (file) (cons (car file) (cdr (assq 'shell_port (json-read-file (car file))))))
   (sort
    (directory-files-and-attributes my/jupyter-runtime-folder t ".*kernel.*json$")
    (lambda (x y) (not (time-less-p (nth 6 x) (nth 6 y)))))))

(defun my/select-jupyter-kernel ()
  (let ((ports (my/get-open-ports))
	(files (my/list-jupyter-kernel-files)))
    (completing-read
     "Jupyter kernels: "
     (seq-filter
      (lambda (file)
	(member (cdr file) ports))
      files))))


(defun my/insert-jupyter-kernel ()
  "Insert a path to an active Jupyter kernel into the buffer"
  (interactive)
  (insert (my/select-jupyter-kernel)))

(defun my/jupyter-connect-repl ()
  "Open emacs-jupyter REPL, connected to a Jupyter kernel"
  (interactive)
  (jupyter-connect-repl (my/select-jupyter-kernel) nil nil nil t))

;; (defun my/jupyter-qtconsole ()
;;   "Open Jupyter QtConsole, connected to a Jupyter kernel"
;;   (interactive)
;;   (start-process "jupyter-qtconsole" nil "setsid" "jupyter" "qtconsole" "--existing"
;; 		 (file-name-nondirectory (my/select-jupyter-kernel))))

(defun my/jupyter-cleanup-kernels ()
  (interactive)
  (let* ((ports (my/get-open-ports))
         (files (my/list-jupyter-kernel-files))
         (to-delete (seq-filter
                     (lambda (file)
                       (not (member (cdr file) ports)))
                     files)))
    (when (and (length> to-delete 0)
               (y-or-n-p (format "Delete %d files?" (length to-delete))))
      (dolist (file to-delete)
        (delete-file (car file))))))

;; Note: jupyter added to org-babel-load-language in org.el
