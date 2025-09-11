;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                MISC                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package misc
  :ensure nil
  ;; :straight (:type built-in)
  :init
  ;; keeps a server running (not necessary>use emacs-client directly)
  ;;(server-start)

  ;; winner mode (window history)
  ;; (winner-mode 1)

  ;; default is set to 300 characters
  ;; (setq auto-save-interval 20)

  ;; show both the row and column of the point in the modeline
  (setq column-number-mode t)

  ;; default to horizontal split
  (setq split-width-threshold 1)

  ;; ;; add project name in modeline
  ;; (setq project-mode-line t)
  
  ;; Remember and restore the last cursor location of opened files
  (save-place-mode 1)
  (setq save-place-file "~/.emacs.d/files/save-place.el")
  
  ;; Don't pop up UI dialogs when prompting
  (setq use-dialog-box nil)

  ;; auto split windows side by side
  ;; (setq split-height-threshold nil)
  ;; (setq split-width-threshold 80)

  ;; hide minibuffer scroll bar
  ;; (set-window-scroll-bars (minibuffer-window) nil nil)

  ;; Remove text properties for kill ring entries (saves times when using savehist)
  ;; (defun unpropertize-kill-ring ()
  ;;   (setq kill-ring (mapcar 'substring-no-properties kill-ring)))
  ;; (add-hook 'kill-emacs-hook 'unpropertize-kill-ring)

  ;; if C-n is done at the end of the buffer, insert a newline
  ;; (setq next-line-add-newlines t)

  ;; set apropos results by relevancy
  (setq apropos-sort-by-scores t)

  ;; disable the menu bar (it's useful but currently broken)
  (menu-bar-mode -1)

  ;; save M-x and file history ; Need to check how it works first
  ;;(savehist-mode 1) ;; already defined elsewhere
  ;;(setq savehist-file "~/.emacs.d/custom/savehist")

  ;; suspend-frame is useless in window mode. I am thus replacing it
  (put 'suspend-frame' disabled t)

  ;;(defun safe-find-library (library)
  ;;  "Find LIBRARY and enter view mode."
  ;;  (interactive "Library name: ")
  ;;  (find-library library)
  ;;  (view-mode))

  ;; save last session
  ;; (desktop-save-mode 1)

  ;; custom scratch message
  (setq initial-scratch-message ";; This is where the fun begins")

  ;; insert matching pair of parenthesis
  (electric-pair-mode t)
  (setq electric-pair-preserve-balance t) ;; add " if another behind

  ;; smarter electric insert
  (setq-default electric-pair-inhibit-predicate
				'(lambda (CHAR)
				   (or (electric-pair-conservative-inhibit CHAR)
					   ;; also inhibit when using char " after a word
					   (and (eq (char-before) ?\")
							(eq (char-syntax (char-before (1- (point)))) ?w)))))
  
  ;; ;; prevent insertion of double "
  ;; (setq electric-pair-inhibit-predicate
  ;; 	(lambda (c)
  ;;         (if (char-equal c ?\") t (electric-pair-default-inhibit c))))

  ;; ;; remove
  ;; (setq-default electric-pair-inhibit-predicate
  ;;               (lambda (c)
  ;;                 (if (looking-at "[ \n\t]")
  ;;                     (electric-pair-default-inhibit c)
  ;;                   t)))

  ;; show matching parenthesis
  (show-paren-mode t)
  (setq show-paren-delay 0)
  ;; (setq show-paren-when-point-in-periphery t) ;; interesting
  
  ;; no startup message (probably already at the end of init.el)
  ;;(setq inhibit-startup-message t)
  ;;(setq inhibit-startup-echo-area-message t)

  ;; Make M-x compile silent
  ;; Shut up compile saves
  ;;(setq compilation-ask-about-save nil)
  ;; Don't save *anything*
  ;;(setq compilation-save-buffers-predicate '(lambda () nil))

  ;; highlight the current line
  ;;(setq global-hl-line-mode t)

  ;; delete selected text on insertion
  (delete-selection-mode +1)

  ;; remove the tool bar
  (tool-bar-mode -1)

  ;; toggle every scroll bar
  ;; (toggle-scroll-bar)
  (scroll-bar-mode -1)

  ;; automatic linebreak
  ;;(auto-fill-mode)

  ;; show trailing white spaces (ignored. maybe use setopt)
  ;; (setq show-trailing-whitespace t)

  ;;go to help window
  (setq help-window-select t)

  ;; emacs search and buffers are case insensitive
  ;;(setq case-fold-search t)

  ;; jump to compilation window
  ;; (defadvice compilation-start (after compilation-start-maximize activate)
  ;;   (when (equal mode 'grep-mode)
  ;;     (switch-to-buffer "*grep*")
  ;;     ;; you may want to maximize the buffer
  ;;     (delete-other-windows)))

  ;; ;;jump to occur window
  ;; (defadvice occur-1 (after occur-maximize activate)
  ;;   (other-window 1))

  (setopt tab-width 4)

  ;; toggle-truncate-lines or visual-line-mode or global-visual-line-mode
  ;;(setq-default truncate-lines t)
  (global-visual-line-mode t)

  ;; mute bell function
  (setq ring-bell-function #'ignore)

  ;; correct accents in filenames
  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (setq file-name-coding-system 'utf-8)

  ;; use minibuffer in minibuffer. useful to search in minibuffer with swiper
  ;; (setq enable-recursive-minibuffers t) ;; already defined in vertico

  ;; auto select window when mouse moves to it (like wm)
  (setq mouse-autoselect-window t)

  ;; move auto save folder in specific directory
  ;; USED TO BE A CUSTOM SET
  (setq auto-save-list-file-prefix (concat user-emacs-directory "files/auto-save-list/.saves-")
		auto-save-list-file-name (concat user-emacs-directory "files/auto-save-list/.saves-5642-nixos~"))

  ;; move bookmarks in specific directory
  (custom-set-variables
   '(bookmark-default-file "~/.emacs.d/files/bookmark-default.el"))

  ;; need to install a dict and setup a daemon first
  ;; (setq dictionary-server "localhost")

  ;; query: no more annoying prompts
  ;; y or n instead of yes or no
  (setq use-short-answers t)

  ;; query: for C-x C-f or C-x b
  (setq confirm-nonexistent-file-or-buffer nil)

  ;; query: live processes
  (setq kill-buffer-query-functions
		(remq 'process-kill-buffer-query-function
			  kill-buffer-query-functions))

  ;; move elpa dir
  (setq package-user-dir "~/.emacs.d/files/elpa")

  ;; save automatically before M-x compile
  (setq compilation-ask-about-save nil
		compilation-scroll-output t
		compilation-auto-jump-to-first-error t
		;; compilation-max-output-line-length nil
		compilation-always-kill t)
  

  (advice-add 'find-file :before (lambda (filename &optional wildcards) 
                                   (unless (file-exists-p filename)
                                     (let ((dir (file-name-directory filename)))
                                       (unless (file-exists-p dir)
                                         (make-directory dir t))))))

  (advice-add 'customize :after (lambda ()
								  (search-forward "search")
								  (move-beginning-of-line 0)
								  (forward-line)))

  ;; Does not work yet. Learn more about rg / fd first before replacing emacs' defaults
  ;; (grep-apply-setting 'grep-command '("rg -H -e -0 ")) ;; "grep --color=auto -nH --null -e "
  ;; (grep-apply-setting 'grep-find-command '("fd . ")) ;; ("find . -type f -exec grep --color=auto -nH --null -e  \\{\\} +" . 54)
  ;; (grep-apply-setting 'grep-find-template '("fd . "))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; emacs bedrock settings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
  ;; (setopt completions-detailed t)
  ;; (setopt completions-group t)
  ;; (setopt completions-group t)
  ;; (setopt completion-auto-select 'second-tab)
  ;; (setopt completion-auto-select t)
  ;; (setopt x-underline-at-descent-line nil)           ; Prettier underlines
  ;; (setopt switch-to-buffer-obey-display-actions t)   ; Make switching buffers more consistent
  ;; (setopt show-trailing-whitespace t)        ; By default, underline trailing spaces
  ;; (setopt indicate-buffer-boundaries 'left)  ; Show buffer top and bottom in the margin
  ;; (setopt display-line-numbers-width 3)           ; Set a minimum width

  ;; Enable horizontal scrolling
  ;; (setopt mouse-wheel-tilt-scroll t)
  ;; (setopt mouse-wheel-flip-direction t)

  ;; cursor
  ;; (blink-cursor-mode -1)                                ; Steady cursor
  ;; (pixel-scroll-precision-mode)                         ; Smooth scrolling

  ;; Modes to highlight the current line with
  ;; (let ((hl-line-hooks '(text-mode-hook prog-mode-hook)))
  ;;   (mapc (lambda (hook) (add-hook hook 'hl-line-mode)) hl-line-hooks))

  ;; (setq kill-do-not-save-duplicates t) ;; customize-set-variable
  ;; (steq load-prefer-newer t)

  ;; ;; Better support for files with long lines
  ;; (setq-default bidi-paragraph-direction 'left-to-right)
  ;; (setq-default bidi-inhibit-bpa t)
  ;; (global-so-long-mode 1)

  (setq xref-search-program #'ripgrep)
  ;; (setq xref-marker-ring-length 16)
  ;; (setq xref-auto-jump-to-first-xref nil)

  ;; after C-u C-<Space>, more C-<Space> will reapeat the "pop-mark" action
  (setq set-mark-command-repeat-pop t)
  ;; (setq mark-ring-max 16)
  ;; (setq global-mark-ring-max 16)

  ;; hide lint messages on package update
  (add-to-list 'display-buffer-alist
               '("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
				 (display-buffer-no-window)
				 (allow-no-window . t)))
  :custom-face
  ;; change color for search bar in M-x customize
  (widget-field ((t (:foreground "medium spring green" :background "#272821"))))
  :general
  ("C-c f" 'find-file)
  ("C-c t" 'execute-extended-command)
  ("C-c k" 'kill-buffer-refocus)
  ("C-c u" 'mode-line-other-buffer)
  ("C-g" 'keyboard-quit-dwim)

  ("C-c n" 'previous-buffer)
  ("C-c e" 'next-buffer)

  ;; ("C-x f" 'find-file)
  ;; ("C-x C-f" 'set-fill-column)

  ("M-z" 'zap-up-to-char)
  ("C-x k" 'kill-buffer-refocus)

  ;; auto balance windows upon deletion
  ("C-x 0" '(lambda ()
			  (interactive)
			  (delete-window)
			  
			  ;; balance windows if more than 1
			  (unless (= 1 (length (window-list)))
				(balance-windows))))
  :hook
  (prog-mode . display-line-numbers-mode)
  ;; superword-mode counts my_short_ex as a single word
  ;; (prog-mode . superword-mode)
  )

(defun kill-buffer-refocus ()
  "Not only kill current buffer but also remove its window."
  (interactive)
  (kill-buffer)

  (unless (eq 1 (length (cl-delete-duplicates (mapcar #'window-buffer (window-list)))))
    (delete-window)))

(defun keyboard-quit-dwim ()
  "Do-What-I-Mean behaviour for a general `keyboard-quit'.

The generic `keyboard-quit' does not do the expected thing when
the minibuffer is open.  Whereas we want it to close the
minibuffer, even without explicitly focusing it.

The DWIM behaviour of this command is as follows:

- When the region is active, disable it.
- When a minibuffer is open, but not focused, close the minibuffer.
- When the Completions buffer is selected, close it.
- In every other case use the regular `keyboard-quit'."
  (interactive)
  (cond
   ((region-active-p)
    (keyboard-quit))
   ((derived-mode-p 'completion-list-mode)
    (delete-completion-window))
   ((> (minibuffer-depth) 0)
    (abort-recursive-edit))
   (t
    (keyboard-quit))))


(defun server-restart ()
  "Kill and start server"
  (interactive)
  (server-force-delete)
  (server-start))

(defun display-startup-echo-area-message ()
  "Custom startup message."
  (message "Let the hacking begin!"))

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

;; remove overwrite-mode to avoid activating it by mistake
(defun overwrite-mode ()) ;; used to break evil. hope it works with meow

(defun word-boundary-at-point-or-region (&optional callback)
  "Return the boundary (beginning and end) of the word at point, or region, if any.
  Forwards the points to CALLBACK as (CALLBACK p1 p2), if present.
URL: https://christiantietze.de/posts/2021/03/change-case-of-word-at-point/"
  (let ((deactivate-mark nil)
        $p1 $p2)
    (if (use-region-p)
        (setq $p1 (region-beginning)
              $p2 (region-end))
      (save-excursion
        (skip-chars-backward "[:alpha:]")
        (setq $p1 (point))
        (skip-chars-forward "[:alpha:]")
        (setq $p2 (point))))
    (when callback
      (funcall callback $p1 $p2))
    (list $p1 $p2)))

;; (defun capitalize-word-at-point ()
;;   (interactive)
;;   (word-boundary-at-point-or-region #'capitalize-region))

(defun save-and-backup-next ()
  ;;; Save current buffer and make a backup file.
  (interactive)
  (let ((current-prefix-arg 4)) ;; emulate C-u
    (save-buffer)))

(defun increment-number-at-point ()
  ;; Increase the value of the integer under the point
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defun replace-regexp-entire-buffer (pattern replacement)
  "Perform regular-expression replacement throughout buffer."
  (interactive
   (let ((args (query-replace-read-args "Replace" t)))
     (setcdr (cdr args) nil)    ; remove third value returned from query---args
     args))
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward pattern nil t)
      (replace-match replacement))))

(defun my/toggle-show-trailing-whitespace ()
  "Toggle `show-trailing-whitespace'."
  (interactive)
  (setq show-trailing-whitespace (not show-trailing-whitespace)))

;; firstly open customize menu and then move down to reach the search field
;; note: the advising function must have the same argument list as the main function
(advice-add 'customize :after (lambda ()
								(search-forward "search")
								(move-beginning-of-line 0)
								(forward-line)))
