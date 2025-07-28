;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                TRAMP               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; use with /ssh:host@domain:/path or /su::/path

(use-package tramp
  :defer t
  :ensure nil
  :config
  (setq tramp-verbose 6)
  (setq tramp-default-method "scp")
  (setq tramp-default-user nil)
  (setq tramp-default-host "nixos")
  (setq tramp-default-remote-shell "/bin/sh")

  (setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

  ;; use scp rather than creating new files
  (setq remote-file-name-inhibit-locks t
		tramp-use-scp-direct-remote-copying t
		remote-file-name-inhibit-auto-save-visited t)

  ;; may be machine dependent
  (setq tramp-copy-size-limit (* 1024 1024) ;; 1MB
		tramp-verbose 2)

  (connection-local-set-profile-variables
   'remote-direct-async-process
   '((tramp-direct-async-process . t)))

  (connection-local-set-profiles
   '(:application tramp :protocol "scp")
   'remote-direct-async-process)

  (setq magit-tramp-pipe-stty-settings 'pty)

  ;; fix remote compile
  (with-eval-after-load 'tramp
	(with-eval-after-load 'compile
      (remove-hook 'compilation-mode-hook #'tramp-compile-disable-ssh-controlmaster-options)))

  ;;;;;;;;;
  ;; GIT ;;
  ;;;;;;;;;
  
  ;; Detect performance issues with profile-start/report/stop
  ;; this can help if magit is too slow
  ;; ;; don't show the diff by default in the commit buffer. Use `C-c C-d' to display it
  ;; (setq magit-commit-show-diff nil)
  ;; ;; don't show git variables in magit branch
  ;; (setq magit-branch-direct-configure nil)
  ;; ;; don't automatically refresh the status buffer after running a git command
  ;; (setq magit-refresh-status-buffer nil)

  ;;;;;;;;;
  ;; LSP ;;
  ;;;;;;;;;
  
  ;; lsp performances
  ;; (defun $lsp-unless-remote ()
  ;; 	(if (file-remote-p buffer-file-name)
  ;; 		(progn (eldoc-mode -1)
  ;;              (setq-local completion-at-point-functions nil))
  ;;     (lsp)))

  ;;;;;;;;;;;
  ;; CACHE ;;
  ;;;;;;;;;;;
  
  ;; (defun memoize-remote (key cache orig-fn &rest args)
  ;; 	"Memoize a value if the key is a remote path."
  ;; 	(if (and key
  ;; 			 (file-remote-p key))
  ;; 		(if-let ((current (assoc key (symbol-value cache))))
  ;; 			(cdr current)
  ;;         (let ((current (apply orig-fn args)))
  ;; 			(set cache (cons (cons key current) (symbol-value cache)))
  ;; 			current))
  ;;     (apply orig-fn args)))

  ;; ;; Memoize current project
  ;; (defvar project-current-cache nil)
  ;; (defun memoize-project-current (orig &optional prompt directory)
  ;; 	(memoize-remote (or directory
  ;; 						project-current-directory-override
  ;; 						default-directory)
  ;; 					'project-current-cache orig prompt directory))

  ;; (advice-add 'project-current :around #'memoize-project-current)

  ;; ;; Memoize magit top level
  ;; (defvar magit-toplevel-cache nil)
  ;; (defun memoize-magit-toplevel (orig &optional directory)
  ;; 	(memoize-remote (or directory default-directory)
  ;; 					'magit-toplevel-cache orig directory))
  ;; (advice-add 'magit-toplevel :around #'memoize-magit-toplevel)

  ;; ;; memoize vc-git-root
  ;; (defvar vc-git-root-cache nil)
  ;; (defun memoize-vc-git-root (orig file)
  ;; 	(let ((value (memoize-remote (file-name-directory file) 'vc-git-root-cache orig file)))
  ;;     ;; sometimes vc-git-root returns nil even when there is a root there
  ;;     (when (null (cdr (car vc-git-root-cache)))
  ;; 		(setq vc-git-root-cache (cdr vc-git-root-cache)))
  ;;     value))
  ;; (advice-add 'vc-git-root :around #'memoize-vc-git-root)

  ;; ;; memoize all git candidates in the current project
  ;; (defvar $counsel-git-cands-cache nil)
  ;; (defun $memoize-counsel-git-cands (orig dir)
  ;; 	($memoize-remote (magit-toplevel dir) '$counsel-git-cands-cache orig dir))
  ;; (advice-add 'counsel-git-cands :around #'$memoize-counsel-git-cands)

  ;; tramp-default-user-alist
  ;; tramp-default-host-alist
  ;; tramp-default-method-alist
  )
