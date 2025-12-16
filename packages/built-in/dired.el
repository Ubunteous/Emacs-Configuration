;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               DIRED-X              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Colourful columns for dired
;;(use-package diredfl
;;  :defer t
;;  :after (dired)
;;  :init (diredfl-global-mode 1))

(use-package dired
  :defer t
  :ensure nil
  ;; :commands (dired)
  ;; :straight (:type built-in)
  :config
  (setq dired-dwim-target t)
  (setq dired-free-space nil)
  ;; (setq dired-recursive-copies 'always)
  ;; (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t) ;; pairs well with trash package
  (setq dired-listing-switches "--group-directories-first -al"))

;; create dir if does not exist when renaming/moving
(defadvice dired-mark-read-file-name (after rv:dired-create-dir-when-needed (prompt dir op-symbol arg files &optional default) activate)
  (when (member op-symbol '(copy move))
    (let ((directory-name (if (< 1 (length files))
                              ad-return-value
                            (file-name-directory ad-return-value))))
      (when (and (not (file-directory-p directory-name))
                 (y-or-n-p (format "directory %s doesn't exist, create it?" directory-name)))
        (make-directory directory-name t)))))


(use-package dired-x
  :defer t
  :ensure nil
  ;; :straight (:type built-in)
  :hook ((dired-mode . dired-omit-mode)
		 (dired-mode . hl-line-mode)
		 (dired-mode . dired-hide-details-mode)) ;; buffers/backup
  :config
  ;; (use-package diredfl
  ;; :config (diredfl-global-mode 1)))
  ;; (setq dired-omit-files "\\`[.]?#\\|\\`[.][.]?\\'\\|.log$\\|.out$")

  ;; Hide .log and .out files (useful in latex directories)
  ;; (setq dired-omit-files
  ;; (concat dired-omit-files "\\|.log$\\|.out$"))

  (if windows-system-p
	  (setq dired-omit-files (concat dired-omit-files  "\\|.resx$\\|.Designer.cs$"))
	(setq dired-omit-files (concat dired-omit-files  "\\|.gd.uid$"))))


(use-package diredfl
  :defer t
  :config (diredfl-global-mode 1))


;; Sort dired output to show directories first
;; For more sorting options, use the variable dired-use-ls-dired
(use-package ls-lisp
  :defer t
  :ensure nil
  ;; :straight (:type built-in)
  :config
  (setq ls-lisp-dirs-first t
	ls-lisp-use-insert-directory-program nil))


(use-package dired-subtree
  :defer t
  :after dired
  :config
  (setq dired-subtree-use-backgrounds nil)
  :general (:keymaps 'dired-mode-map
					 "i" 'dired-subtree-insert
					 ";" 'dired-subtree-remove
					 "TAB" 'dired-subtree-toggle
					 "S-TAB" 'dired-subtree-remove))

;;;;;;;;;;;;;;;;;;;;;;;;;
;; OREMACS DIRED RSYNC ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defcustom ora-dired-rsync-limit nil
;;   "Limit rsync transfer rate."
;;   :type
;;   '(choice
;;     (const :tag "None" nil)
;;     (integer :tag "500kbps" 500)))

;; (defun ora-dired-rsync (dest)
;;   (interactive
;;    (list (expand-file-name
;; 		  (read-file-name "Rsync to:" (dired-dwim-target-directory)))))
;;   ;; store all selected files into "files" list
;;   (let ((files (dired-get-marked-files nil current-prefix-arg))
;; 		(rsync-command
;; 		 (concat
;; 		  "rsync"
;; 		  (if ora-dired-rsync-limit
;; 			  (format " --bwlimit=%s" ora-dired-rsync-limit)
;; 			"")
;; 		  " -arvzut"
;; 		  (and current-prefix-arg " --delete")
;; 		  " --progress ")))
;;     ;; add all selected file names as arguments to the rsync command
;;     (dolist (file files)
;;       (setq rsync-command
;; 			(concat rsync-command
;; 					(if (string-match "^/ssh:\\(.*:\\)\\(.*\\)$" file)
;; 						(format " -e ssh \"%s%s\""
;; 								(match-string 1 file)
;; 								(shell-quote-argument (match-string 2 file)))
;; 					  (shell-quote-argument file)) " ")))
;;     ;; append the destination
;;     (setq rsync-command
;; 		  (concat rsync-command
;; 				  (if (string-match "^/ssh:\\(.*?\\)\\([^:]+\\)$" dest)
;; 					  (format " -e ssh %s%s"
;; 							  (match-string 1 dest)
;; 							  (match-string 2 dest))
;; 					(shell-quote-argument dest))))
;;     ;; run the async shell command
;;     (let ((default-directory (expand-file-name "~")))
;;       (async-shell-command rsync-command
;; 						   (format "rsync to %s" dest)))
;;     (message rsync-command)
;;     ;; finally, switch to that window
;;     (other-window 1)))


;; ;; danger. rapport selon lequel tout a été détruit hors corbeille
;; (use-package trashed
;;   :defer t
;;   :commands (trashed)
;;   :config
;;   (setq trashed-action-confirmer 'y-or-n-p)
;;   (setq trashed-use-header-line t)
;;   (setq trashed-sort-key '("Date deleted" . t))
;;   (setq trashed-date-format "%Y-%m-%d %H:%M:%S"))

;; see git info from dired by using the ")" key
;;(use-package dired-git-info
;;  :general (:map 'dired-mode-map
;;              ")" 'dired-git-info-mode))
