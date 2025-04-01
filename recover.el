;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                PANIC               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Minimal emacs config to use when main config is down
;; start with emacs -q -l ~/.emacs.d/panic.el

;; more with (custom-available-themes)
;; modus-vivendi
;; modus-vivendi-tinted
;; modus-vivendi-tritanopia
;; modus-vivendi-deuteranopia
(load-theme 'modus-vivendi-tritanopia t)
(set-face-attribute 'default nil :height 160 :font "MonoSpace")

;; ignore general keyword
;; (use-package use-package)
;; (add-to-list 'use-package-keywords :general)
;; (defun use-package-handler/:general (name _keyword args rest state)
;;   "Use-package handler for :general."
;;   nil)

(defun gen-built-in-path
	(filename)
  "Make the full path to a config file in misc/"
  (concat
   "~/.emacs.d/packages/built-in/"
   filename
   ".el"))

;; content of use-package not always loaded
;; maybe because of general hack above
(mapc 'load
	  (mapcar 'gen-built-in-path
			  '("repeat"
				;; "ibuffer"
				;; "isearch"
				;; "misc"
				;; "recentf"
				;; "which-key"
				)))

(setq column-number-mode t)
(setq split-width-threshold 1)
(setq use-dialog-box nil)
(setq apropos-sort-by-scores t)
(put 'suspend-frame' disabled t)

(electric-pair-mode t)
(setq electric-pair-preserve-balance t)

(setq-default electric-pair-inhibit-predicate
			  '(lambda (CHAR)
				 (or (electric-pair-conservative-inhibit CHAR)
					 ;; also inhibit when using char " after a word
					 (and (eq (char-before) ?\")
						  (eq (char-syntax (char-before (1- (point)))) ?w)))))

(menu-bar-mode -1)
(delete-selection-mode +1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;go to help window
(setq help-window-select t)
(setopt tab-width 4)

;;emacs search and buffers are case insensitive
(setq case-fold-search t)

;; mute bell function
(setq ring-bell-function #'ignore)

;; correct accents in filenames
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)

;; query: no more annoying prompts
;; y or n instead of yes or no
(setq use-short-answers t)

;; line-number
(display-line-numbers-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(advice-add 'find-file :before (lambda (filename &optional wildcards) 
                                 (unless (file-exists-p filename)
                                   (let ((dir (file-name-directory filename)))
                                     (unless (file-exists-p dir)
                                       (make-directory dir t))))))

(advice-add 'customize :after (lambda ()
								(search-forward "search")
								(move-beginning-of-line 0)
								(forward-line)))

(defun kill-buffer-refocus ()
  "Not only kill current buffer but also remove its window."
  (interactive)
  (kill-buffer)

  (unless (eq 1 (length (cl-delete-duplicates (mapcar #'window-buffer (window-list)))))
	(delete-window)))

(defun eval-region-or-buffer ()
  (interactive)
  (cond
   (mark-active
	(call-interactively 'eval-region)
	(message "Region evaluated!")
	(setq deactivate-mark t))
   (t
	(save-buffer)
	(eval-buffer)
	(message "Buffer evaluated!"))))

(global-set-key (kbd "C-c f") 'find-file)
(global-set-key (kbd "C-c t") 'execute-extended-command)
(global-set-key (kbd "C-c k") 'kill-buffer-refocus)
(global-set-key (kbd "C-c n") 'previous-buffer)
(global-set-key (kbd "C-c e") 'next-buffer)
(global-set-key (kbd "C-x k") 'kill-buffer-refocus)

(which-key-mode)
(setq which-key-show-early-on-C-h t)
(which-key-setup-side-window-bottom)
(setq which-key-sort-order 'which-key-prefix-then-key-order)
(setq which-key-sort-uppercase-first nil)
(setq which-key-idle-secondary-delay 0.05)
