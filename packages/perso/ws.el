;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 WS                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Uses frames as workspaces. Rudimentary but a good idea

(defvar ws-last-frame nil)

(defvar ws-last-workspaces '())

(defun ws-select-frame (frame)
  (unless (eq frame (selected-frame))
	(setq ws-last-frame (selected-frame)))
  (raise-frame frame)
  (x-focus-frame frame)
  (select-frame frame)
  (setq ws-last-workspaces (cons frame (remove frame ws-last-workspaces))))

(defun ws-workspace-name (&optional frame)
  (let ((frame (or frame (selected-frame))))
	(or (frame-parameter frame 'title)
		(frame-parameter frame 'name))))

(defun ws-all-workspace-names ()
  (setq ws-last-workspaces (cl-delete-if-not #'frame-live-p ws-last-workspaces))
  (mapcar 'ws-workspace-name
		  (delete-dups (append ws-last-workspaces (frame-list)))))

(defun ws-workspace-switch (name)
  (interactive "sWorkspace: ")
  (let ((frame-list (frame-list))
		(frame nil)
		(new nil))
	(while (and (not frame) frame-list)
	  (if (string= (ws-workspace-name (car frame-list)) name)
		  (setq frame (car frame-list))
		(setq frame-list (cdr frame-list))))
	(unless frame
	  (setq frame (make-frame `((title . ,name))))
	  (setq new t))
	(ws-select-frame frame)
	new))

(defun ws-last-workspace ()
  (interactive)
  (if (and ws-last-frame (frame-live-p ws-last-frame))
	  (ws-select-frame ws-last-frame)
	(ws-workspace-switch (read-string "Switch to workspace: "))))

(defun ws-switch-to-workspace (&optional key)
  (interactive)
  (unless key
	(setq key (logand last-command-event 255)))
  (let* ((prefix (char-to-string key))
		 (current-name (ws-workspace-name))
		 ;; This will be explained later:
		 (predefined (cl-assoc prefix ws-workspaces :test #'string-prefix-p)))
	(if predefined
		(cl-destructuring-bind (name new-fn refresh-fn) predefined
		  (if (equal current-name name)
			  (when refresh-fn
				(funcall refresh-fn))
			(when (and (ws-workspace-switch name)
					   new-fn)
			  (funcall new-fn))))
	  (let* ((candidates
			  (remove current-name
					  (cl-remove-if-not
					   #'(lambda (n) (string-prefix-p prefix n))
					   (ws-all-workspace-names))))
			 (n (length candidates)))
		(cond
		 ((= n 0)
		  (ws-workspace-switch
		   (read-from-minibuffer "Switch to workspace: ")))
		 ((= n 1)
		  (ws-workspace-switch
		   (car candidates)))
		 (t
		  (ws-workspace-switch
		   (completing-read "Switch to workspace: " candidates nil t prefix))))))))

(global-set-key (kbd "<s-return>") 'ws-last-workspace)
(dotimes (i 26)
  (global-set-key (kbd (format "s-%c" (+ ?a i))) 'ws-switch-to-workspace))

(defun ws-switch-to-workspace-key (key)
  (interactive "c")
  (ws-switch-to-workspace key))
(global-set-key (kbd "C-d w") 'ws-switch-to-workspace-key)

(defvar ws-workspaces
  ;; name
  ;; new-fn
  ;; refresh-fn
  '(("emacs"
	 nil
	 (lambda ()
	   (require 'bookmark)
	   (unless bookmark-alist
		 (bookmark-maybe-load-default-file))
	   (bookmark-jump "init.d")))
	("gnus"
	 gnus
	 (lambda ()
	   (let ((group-buffer (get-buffer "*Group*")))
		 (if group-buffer
			 (switch-to-buffer group-buffer)
		   (gnus)
		   (cd "~")))))
	("irc"
	 ws-erc-connect
	 nil)
	("org"
	 ws-org-agenda
	 ws-org-agenda)
	("roam"
	 org-roam-find-file
	 org-roam-find-file)
	("system"
	 ws-run-eshell
	 (lambda ()
	   (call-interactively
		(lambda ()
		  (interactive)
		  (ido-buffer-internal ido-default-buffer-method nil nil nil "eshell:")))))))

(defconst ws-projectile-workspace-prefix "x:")

;; (defun ws-projectile-switch-project-action ()
;;   (when (ws-workspace-switch (concat ws-projectile-workspace-prefix
;;									 projectile-project-name))
;;	(projectile-vc)
;;	(delete-other-windows)))
;; (setq projectile-switch-project-action 'ws-projectile-switch-project-action)
