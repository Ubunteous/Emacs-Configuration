;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    PROGRAMMING LANGUAGE: JUPYTER   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TO RUN JUPYTER:
;; INSTALL pip -> jupyterlab with nix
;; Run function org-jupyter-setup defined below
;; Add at the top jupyter-header and block with tempel

;; Load emacs-zmq silently
;; (defun load-file (file)
;;   "Load the Lisp file named FILE."
;;   ;; This is a case where .elc and .so/.dll make a lot of sense.
;;   (interactive (list (let ((completion-ignored-extensions
;; 			    (remove module-file-suffix
;; 				    (remove ".elc"
;; 					    completion-ignored-extensions))))
;; 		       (read-file-name "Load file: " nil nil 'lambda))))

;;   (if (eq file 'emacs-zmq.so)
;;       (load (expand-file-name file) nil nil t)
;;     (load (expand-file-name file) nil t t)))

;; (use-package zmq)

;; Note: evil and the javascript kernel do not work well together
(use-package jupyter
  :defer t
  :after org ;; ob
  :requires zmq
  :general
  (:keymaps 'org-mode-map
	    "C-c p" '(org-insert-jupyter-block "python")
	    "C-c j" '(org-insert-jupyter-block "javascript")
	    ;; :config
	    ;; (add-to-list 'org-structure-template-alist '("t" . "test"))
	    ;; (append 'org-structure-template-alist '("t" . "test"))
	    
	    ;; (add-to-list 'org-babel-load-languages '(test . t))
	    ;; (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
	    ))

;; hide stderr error about frozen modules
;; jupyter-command: Content written to stderr stream
;; 0.00s - Debugger warning: It seems that frozen modules are being used
(setenv "PYDEVD_DISABLE_FILE_VALIDATION" "1")

(defun org-insert-jupyter-block (TYPE)
  "Insert a jupyter block (with linebreak if mark inactive)"
  (interactive)
  (if mark-active
      (org-insert-structure-template (concat "src jupyter-" TYPE))
    (org-insert-structure-template (concat "src jupyter-" TYPE "\n"))))


(defun org-jupyter-setup ()
  "Manually add jupyter support (babel blocks will need a session)"
  (interactive)
  (add-to-list 'org-structure-template-alist '("p" . "src jupyter-python\n"))
  (add-to-list 'org-structure-template-alist '("j" . "src jupyter-javascript\n"))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((jupyter . t))))

;; :custom
;; (jupyter-runtime-directory "~/.local/share/jupyter/runtime/")

;; not necessary anymore with:
;; (org-insert-structure-template "src jupyter-python")
;; :general
;; (org-mode-map
;;  "C-c j"
;;  '(lambda () (interactive)
;;     (tempel-insert 'jupyter))))


;; ;; add jupyter-python to babel
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  (append org-babel-load-languages
;;          '((jupyter . t))))

;;;;;;;;;;;;;;;;;;;
;;    KERNELS    ;;
;;;;;;;;;;;;;;;;;;;

;; (defun my/get-open-ports ()
;;   (mapcar
;;    #'string-to-number
;;    (split-string (shell-command-to-string "ss -tulpnH | awk '{print $5}' | sed -e 's/.*://'") "\n")))


;; (setq my/jupyter-runtime-folder (expand-file-name "~/.local/share/jupyter/runtime"))

;; (defun my/list-jupyter-kernel-files ()
;;   (mapcar
;;    (lambda (file) (cons (car file) (cdr (assq 'shell_port (json-read-file (car file))))))
;;    (sort
;;     (directory-files-and-attributes my/jupyter-runtime-folder t ".*kernel.*json$")
;;     (lambda (x y) (not (time-less-p (nth 6 x) (nth 6 y)))))))

;; (defun my/select-jupyter-kernel ()
;;   (let ((ports (my/get-open-ports))
;; 	(files (my/list-jupyter-kernel-files)))
;;     (completing-read
;;      "Jupyter kernels: "
;;      (seq-filter
;;       (lambda (file)
;; 	(member (cdr file) ports))
;;       files))))


;; (defun my/insert-jupyter-kernel ()
;;   "Insert a path to an active Jupyter kernel into the buffer"
;;   (interactive)
;;   (insert (my/select-jupyter-kernel)))

;; (defun my/jupyter-connect-repl ()
;;   "Open emacs-jupyter REPL, connected to a Jupyter kernel"
;;   (interactive)
;;   (jupyter-connect-repl (my/select-jupyter-kernel) nil nil nil t))

;; ;; (defun my/jupyter-qtconsole ()
;; ;;   "Open Jupyter QtConsole, connected to a Jupyter kernel"
;; ;;   (interactive)
;; ;;   (start-process "jupyter-qtconsole" nil "setsid" "jupyter" "qtconsole" "--existing"
;; ;; 		 (file-name-nondirectory (my/select-jupyter-kernel))))

;; (defun my/jupyter-cleanup-kernels ()
;;   (interactive)
;;   (let* ((ports (my/get-open-ports))
;;          (files (my/list-jupyter-kernel-files))
;;          (to-delete (seq-filter
;;                      (lambda (file)
;;                        (not (member (cdr file) ports)))
;;                      files)))
;;     (when (and (length> to-delete 0)
;;                (y-or-n-p (format "Delete %d files?" (length to-delete))))
;;       (dolist (file to-delete)
;;         (delete-file (car file))))))

;; ;; Note: jupyter added to org-babel-load-language in org.el
