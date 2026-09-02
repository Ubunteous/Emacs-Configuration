;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               NETMATE              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq netmate-buffer-name "*netmate*")

(setq netmate-commands '(("ip" . "ip a")
						 ("routes" . "ip route")
						 ("lsblk" . "lsblk")))

(defun netmate ()
  (interactive)
  (let ((buffer (get-buffer-create netmate-buffer-name))
		(shell-command-dont-erase-buffer t))

	(with-current-buffer buffer
	  (setq-local buffer-read-only nil)
	  (delete-region (point-min) (point-max))

	  (cl-loop for (title . command) in netmate-commands do
			   (mapcar 'insert (list (format "* %s\n\n" title) command "\n"))
			   ;; (shell-command command buffer) ; async
			   (call-process-shell-command command nil (get-buffer "*netmate*")) ; sync
			   (insert "\n")

			   finally do
			   (backward-delete-char 2) ; remove extra \n
			   (setq-local buffer-read-only t))

	  (if (get-buffer-window buffer)
		  (select-window (get-buffer-window buffer))
		(view-buffer-other-window buffer))

	  (org-mode)
	  (org-fold-show-all)
	  (beginning-of-buffer))))
