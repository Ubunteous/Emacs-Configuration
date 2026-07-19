;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                EMBARK              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package embark
  :ensure t
  :init
  ;; Optionally replace the key help with a completing-read interface
  ;; (setq prefix-help-command #'embark-prefix-help-command)
  (defvar-subkeymap personal-misc-bindings-keymap "e" embark-keymap "Keymap for embark.")

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
			   '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
				 nil
				 (window-parameters (mode-line-format . none))))
  :config
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

  :bind
  ("C-!" . embark-act)         ;; pick some comfortable binding
  ;; "C-§" 'embark-dwim        ;; good alternative: M-.
  ([remap xref-find-definitions] . embark-dwim)
  ("C-h B" . embark-bindings) ;; alternative for `describe-bindings'

  (:map embark-file-map
		("S" . sudo-find-file))

  (:map embark-keymap ;; custom keymap (not from embark.el)
		("A" . embark-act-all)
		("a" . embark-act)
		("b" . embark-become)
		("c" . embark-collect)
		("d" . embark-dwim)
		("e" . embark-export)
		("h" . embark-bindings)
		("l" . embark-live)
		("s" . embark-select)
		("k" . embark-bindings-in-keymap))

  (:map minibuffer-local-map
		("C-c C-c" . embark-collect)
		("C-c C-e" . embark-export))

  (:map embark-variable-map
		("h" . helpful-variable))

  (:map embark-command-map
		("d" . helpful-callable)
		("h" . helpful-callable))

  (:map personal-misc-bindings-keymap ("E" . embark-collect)))

;; ;; Consult users will also want the embark-consult package.
;; (use-package embark-consult
;;   :ensure t ; only need to install it, embark loads it after consult if found
;;   :hook
;;   (embark-collect-mode . consult-preview-at-point-mode))

;; (defmacro embark-ace-action (fn)
;;   `(defun ,(intern (concat "embark-ace-" (symbol-name fn))) ()
;;      (interactive)
;;      (with-demoted-errors "%s"
;;        (require 'ace-window)
;;        (aw-switch-to-window (aw-select nil))
;;        (call-interactively (symbol-function ',fn)))))
;; (embark-ace-action find-file)

;; (defmacro embark-split-action (fn split-type)
;;   `(defun ,(intern (concat "embark-"
;;                            (symbol-name fn)
;;                            "-"
;;                            (car (last  (split-string
;;										(symbol-name split-type) "-"))))) ()
;;	 (interactive)
;;	 (funcall #',split-type)
;;	 (call-interactively #',fn)))
;; (embark-split-action find-file split-window-right)


;; ;; found on reddit
;; (use-package sudo-edit
;;   :after embark
;;   :defer t
;;   :bind
;;   (:map embark-file-map
;;		("s" . sudo-edit-find-file))
;;	 (:map embark-become-file-buffer-map
;;		("s" . 'sudo-edit-find-file)))
