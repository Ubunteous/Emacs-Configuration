;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                EMBARK              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package embark
  :ensure t
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
				 nil
				 (window-parameters (mode-line-format . none))))

  (defun sudo-find-file (file)
	"Open FILE as root."
	(interactive "FOpen file as root: ")
	(when (file-writable-p file)
      (user-error "File is user writeable, aborting sudo"))
	(find-file (if (file-remote-p file)
                   (concat "/" (file-remote-p file 'method) ":"
                           (file-remote-p file 'user) "@" (file-remote-p file 'host)
                           "|sudo:root@"
                           (file-remote-p file 'host) ":" (file-remote-p file 'localname))
				 (concat "/sudo:root@localhost:" file))))

  :general
  ("C-!" 'embark-act         ;; pick some comfortable binding
   "C-§" 'embark-dwim        ;; good alternative: M-.
   "C-h B" 'embark-bindings) ;; alternative for `describe-bindings'
  (:keymaps 'embark-file-map
			"S" 'sudo-find-file))


;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;; ;; found on reddit
;; (use-package sudo-edit
;;   :after embark
;;   :defer t
;;   :general
;;   (:keymaps 'embark-file-map
;; 	    "s" 'sudo-edit-find-file
;; 	    'embark-become-file-buffer-map
;; 	    "s" . 'sudo-edit-find-file))
