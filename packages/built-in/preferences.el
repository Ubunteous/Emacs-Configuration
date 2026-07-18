;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                MISC                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package misc
  :ensure nil
  :config
  ;; highlight available in hl-mode
  (set-face-attribute 'hl-line nil :foreground "cyan")

  ;; change color for search bar in M-x customize
  (set-face-attribute 'widget-field nil :foreground "medium spring green" :background "#272821")

  (set-face-attribute 'apropos-symbol nil :foreground "#a6e12d") ; green

  (set-face-attribute 'apropos-keybinding nil :foreground "#66d9ee") ; blue
  (set-face-attribute 'apropos-user-option-button nil :foreground "#ae81ff") ; purple

  (set-face-attribute 'apropos-button nil :foreground "#fefff8") ; white
  (set-face-attribute 'apropos-function-button nil :foreground "#fc961f") ; orange
  (set-face-attribute 'apropos-variable-button nil :foreground "#a6e12d") ; green
  (set-face-attribute 'apropos-misc-button nil :foreground "#fefff8") ; white
  :init
  ;; if C-n is done at the end of the buffer, insert a newline
  ;; (setq next-line-add-newlines t)

  ;; (setq-default
  ;;  display-line-numbers-grow-only t
  ;;  ;; display-line-numbers-type t ;; defaults to t
  ;;  display-line-numbers-width 2)

  ;; remove warning when calling advanced commands
  ;; (setq disabled-command-function nil)

  (setq view-read-only t) ;; enable view-mode on read only files

  ;; save last session
  ;; (desktop-save-mode 1)

  ;; ;; prevent insertion of double "
  ;; (setq electric-pair-inhibit-predicate
  ;;	(lambda (c)
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

  ;; highlight the current line
  ;;(setq global-hl-line-mode t)

  ;; automatic linebreak
  ;;(auto-fill-mode)

  ;; show trailing white spaces (ignored. maybe use setopt)
  ;; (setq show-trailing-whitespace t) ;; use with whitespace-style/-action

  ;; emacs search and buffers are case insensitive
  ;;(setq case-fold-search t)

  ;; toggle-truncate-lines or visual-line-mode or global-visual-line-mode
  ;;(setq-default truncate-lines t)
  (global-visual-line-mode t)

  ;; mute bell function
  (setq ring-bell-function #'ignore)

  ;; use minibuffer in minibuffer. useful to search in minibuffer with swiper
  ;; (setq enable-recursive-minibuffers t) ;; already defined in vertico

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

  ;; save automatically before M-x compile
  (setq compilation-ask-about-save nil
		compilation-scroll-output t

		;; DEBUGGING
		;; if file not found, opens minibuffer (not a bug)
		;; values: t (go to first unconditionally), if-location-known, first-known
		compilation-auto-jump-to-first-error 'if-location-known
		;;
		;; compilation-skip-threshold ;; jump to warning/error/any in prioriy (see doc)
		;; compilation-auto-jump-to-next t ;; next error
		;; compilation-debug t ;; add a debug text property to error lines

		;; PROCESS
		;; compilation-environment ;; list of strings ENVVARNAME=VALUE
		;; compilation-save-buffers-predicate '(lambda () nil) ;; do not save anything
		;; compilation-read-command nil ;; nil to use compile-command without prompt
		;; compilation-process-setup-function
		;; compilation-finish-functions
		;; compilation-search-path ;; dirs with files mentioned in error message
		;; compilation-directory ;; dir to restore when using recompile

		;; FILTER
		;; compilation-filter-start
		;; compilation-hidden-output ;; regexp

		;; compilation-max-output-line-length nil
		compilation-always-kill t)

  ;; Does not work yet. Learn more about rg / fd first before replacing emacs' defaults
  ;; (grep-apply-setting 'grep-command '("rg -H -e -0 ")) ;; "grep --color=auto -nH --null -e "
  ;; (grep-apply-setting 'grep-find-command '("fd . ")) ;; ("find . -type f -exec grep --color=auto -nH --null -e  \\{\\} +" . 54)
  ;; (grep-apply-setting 'grep-find-template '("fd . "))

  ;;;;;;;;;;;;;;;;;
  ;; COMPLETIONS ;;
  ;;;;;;;;;;;;;;;;;

  (setq completions-detailed t)
  (setq completions-group t)
  (setq completion-auto-select 'second-tab) ; or t
  (setq completion-eager-update t)
  (setq completion-eager-display 'auto)
  (setq minibuffer-visible-completions 'up-down)

  ;;;;;;;;;;;;;;;;;;;;;
  ;; VERSION CONTROL ;;
  ;;;;;;;;;;;;;;;;;;;;;

  (setq vc-auto-revert-mode t)
  ;; (setq vc-allow-rewriting-published-history t)
  (setq vc-dir-auto-hide-up-to-date 'revert)

  ;;;;;;;;;;;;;;
  ;; TERMINAL ;;
  ;;;;;;;;;;;;;;

  ;; value "ansi" causes massive issues (repeated line) in python terminal
  ;; (setq comint-terminfo-terminal "ansi") ; defaults to dumb

  ;; defaults to "less"
  (cond ((executable-find "bat") (setenv "PAGER" "bat"))
		((executable-find "cat") (setenv "PAGER" "cat"))
		nil)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; EXPECTED IN MODERN EDITOR ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; (setq zone-all-frames t)
  ;; (setq zone-all-windows-in-frame t)

  (setq native-comp-async-on-battery-power nil) ; stop native-comp jobs on battery
  (setq view-lossage-auto-refresh t) ; live-updating C-h l
  (setq uniquify-after-kill-buffer-flag t) ; rename buffers after killing one with similar name

  ;; (setq indicate-buffer-boundaries 'left)  ; Show buffer top and bottom in the margin
  ;; (setq display-line-numbers-width 3) ; Set a minimum width

  (setq x-underline-at-descent-line nil) ; Prettier underlines

  ;; add " if another behind
  ;; but may cause issue in some modes (gdscript) if line 1 "<point> and line 2 ""
  (setq electric-pair-preserve-balance t)

  ;; smarter electric insert
  (setq-default electric-pair-inhibit-predicate
				'(lambda (CHAR)
				   (or (electric-pair-conservative-inhibit CHAR)
					   ;; (eq (point) (line-end-position))
					   ;; also inhibit when using char " after a word
					   (and (eq (char-before) ?\")
							(eq (char-syntax (char-before (1- (point)))) ?w)))))

  ;; custom scratch message
  (setq initial-scratch-message ";; This is where the fun begins")

  ;; insert matching pair of parenthesis
  (electric-pair-mode t)

  ;; delete selected text on insertion
  (delete-selection-mode +1)

  ;; suspend-frame is useless in window mode. I am thus replacing it
  (put 'suspend-frame' disabled t)

  ;;;;;;;;;;;;;;;
  ;; EMACS DIR ;;
  ;;;;;;;;;;;;;;;

  ;; Remember and restore the last cursor location of opened files
  (save-place-mode 1)
  (setq save-place-file "~/.emacs.d/files/save-place.el")
  (advice-add 'save-place-after-find-file-hook :after
			  (lambda (&rest _)
				(when buffer-file-name (ignore-errors (recenter)))))

  ;; save M-x and file history ; Need to check how it works first
  ;;(savehist-mode 1) ;; already defined elsewhere
  ;;(setq savehist-file "~/.emacs.d/custom/savehist")

  ;; move auto save folder in specific directory
  ;; USED TO BE A CUSTOM SET
  (setq auto-save-list-file-prefix (concat user-emacs-directory "files/auto-save-list/.saves-")
		auto-save-list-file-name (concat user-emacs-directory "files/auto-save-list/.saves-5642-nixos~"))

  ;; move bookmarks in specific directory
  (custom-set-variables
   '(bookmark-default-file "~/.emacs.d/files/bookmark-default.el"))

  ;; move elpa dir
  (setq package-user-dir "~/.emacs.d/files/elpa")

  ;;;;;;;;;;;;;;;;
  ;; MS WINDOWS ;;
  ;;;;;;;;;;;;;;;;

  ;; correct accents in filenames
  (when windows-system-p
	(prefer-coding-system 'utf-8)
	(set-default-coding-systems 'utf-8)
	(setq coding-system-for-read 'utf-8)
	(setq coding-system-for-write 'utf-8)
	(setq file-name-coding-system 'utf-8))

  ;;;;;;;;;;;;
  ;; SCROLL ;;
  ;;;;;;;;;;;;

  ;; (customize-set-variable 'fast-but-imprecise-scrolling t)
  ;; (customize-set-variable 'scroll-conservatively 101)
  ;; (customize-set-variable 'scroll-preserve-screen-position t)

  ;; Enable horizontal scrolling
  ;; (setopt mouse-wheel-tilt-scroll t)
  ;; (setopt mouse-wheel-flip-direction t)

  ;; cursor
  ;; (blink-cursor-mode -1) ; Steady cursor
  ;; (pixel-scroll-precision-mode) ; Smooth scrolling

  ;;;;;;;;;;;;;;;;;;
  ;; EMACS DAEMON ;;
  ;;;;;;;;;;;;;;;;;;

  ;; keeps a server running (not necessary>use emacs-client directly)
  ;; (server-start)

  ;;;;;;;;;;;;;;;;;;;;;;
  ;; HELP AND APROPOS ;;
  ;;;;;;;;;;;;;;;;;;;;;;

  ;; set apropos results by relevancy
  (setq apropos-sort-by-scores t)
  (setq apropos-compact-layout t)

  ;;;;;;;;;;;;;;;;;;
  ;; PERFORMANCES ;;
  ;;;;;;;;;;;;;;;;;;

  ;; do not check if hostname exists (ping)
  (setq ffap-machine-p-known 'reject)

  ;; disable right to left languages (like arabic) features
  (setq-default bidi-display-reordering t
				bidi-paragraph-direction 'left-to-right
				bidi-inhibit-bpa t)

  (setq redisplay-skip-fontification-on-input t)

  (setq read-process-output-max (* 4 1024 1024)) ; speeds up modern language servers

  ;; do not process cursors/highlight in unselected windows
  (setq-default cursor-in-non-selected-windows nil)
  (setq highlight-nonselected-windows nil)

  ;;;;;;;;;;;;;
  ;; EDITION ;;
  ;;;;;;;;;;;;;

  (setq kill-region-dwim 'emacs-word) ; C-w with no region kills a word

  ;; makes regexp builder syntax more coherent
  (setq reb-re-syntax 'string) ; read, rx or string
  (setq save-interprogram-paste-before-kill t)
  ;; (setq kill-do-not-save-duplicates t)

  ;; Remove text properties for kill ring entries (saves times when using savehist)
  ;; (defun unpropertize-kill-ring ()
  ;;   (setq kill-ring (mapcar 'substring-no-properties kill-ring)))
  ;; (add-hook 'kill-emacs-hook 'unpropertize-kill-ring)

  ;; (put 'downcase-region 'disabled nil)

  ;; default is set to 300 input events
  ;; (setq auto-save-interval 20)

  ;;;;;;;;;;
  ;; MARK ;;
  ;;;;;;;;;;

  ;; after C-u C-<Space>, more C-<Space> will reapeat the "pop-mark" action
  (setq set-mark-command-repeat-pop t)
  ;; (setq mark-ring-max 16)
  ;; (setq global-mark-ring-max 16)
  (setq delete-pair-push-mark t)

  ;;;;;;;;;;;;;;;;
  ;; APPEARANCE ;;
  ;;;;;;;;;;;;;;;;

  ;; reduce size of minor modes in modeline by putting them in a submenu called ...
  (setq mode-line-collapse-minor-modes '(abbrev-mode eldoc-mode visual-line-mode which-key-mode auto-revert-mode))
  ;; (setq mode-line-collapse-minor-modes-to " ...")

  ;; show both the row and column of the point in the modeline
  (setq column-number-mode t)

  ;; disable the menu bar (it's useful but currently broken)
  (menu-bar-mode -1)

  ;; remove the tool bar
  (tool-bar-mode -1)

  ;; toggle every scroll bar
  ;; (toggle-scroll-bar)
  (scroll-bar-mode -1)

  ;; Don't pop up UI dialogs when prompting
  (setq use-dialog-box nil)

  ;; hide minibuffer scroll bar
  ;; (set-window-scroll-bars (minibuffer-window) nil nil)

  ;; ;; add project name in modeline
  ;; (setq project-mode-line t)

  (setopt tab-width 4)

  ;; ;; add your pretty symbols to replace default appearance
  ;; (mapc (lambda (pair) (push pair prettify-symbols-alist))
  ;;		'(
  ;;		  ;; ;; Syntax
  ;;		  ;; ("def" . #x2131)
  ;;		  ;; ("not" . #x2757)
  ;;		  ;; ("in"  . #x2208)

  ;;		  ;; numbers
  ;;		  ("1" . #x2780)
  ;;		  ("2" . #x2781)
  ;;		  ("3" . #x2782)
  ;;		  ("4" . #x2783)
  ;;		  ("5" . #x2784)
  ;;		  ("6" . #x2785)
  ;;		  ("7" . #x2786)
  ;;		  ("8" . #x2787)
  ;;		  ("9" . #x2788)))

  ;;;;;;;;;;;;;;;;;;
  ;; KEY BINDINGS ;;
  ;;;;;;;;;;;;;;;;;;

  (defvar-keymap mark-keymap
	:doc "Keymap for mark bindings.")
  (define-key personal-misc-bindings-keymap (kbd "k") mark-keymap) ; no ' for keymaps
  (which-key-add-keymap-based-replacements personal-misc-bindings-keymap "k" "mark")

  :bind
  ([remap suspend-frame] . undo)
  ([remap ibuffer] . ibuffer-jump)
  ([remap backward-kill-word] . backward-delete-word)
  ([remap suspend-frame] . undo)
  ;; ([remap eval-last-sexp] . pp-eval-last-sexp)

  ("C-g" . keyboard-quit-dwim)
  ("RET" . newline-and-indent)

  ;; ("C-x f" . find-file)
  ;; ("C-x C-f" . set-fill-column)

  ("C-S-b" . backward-sexp)
  ("C-S-f" . forward-sexp)
  ("C-S-n" . forward-paragraph)
  ("C-S-p" . backward-paragraph)
  ("M-z" . zap-up-to-char)

  (:map ctl-x-map
		("k" . kill-buffer-refocus)
		("C-k" . eval-defun)
		("$" . set-quad-selective-display))

  (:map mode-specific-map
		("e" . next-buffer)
		("f" . find-file)
		("g" . pop-global-mark)
		("G" . pop-to-mark-command)
		("n" . previous-buffer)
		("t" . execute-extended-command))

  (:map ctl-x-r-map
		("a" . append-to-register))

  (:map mark-keymap
		("<" . mark-beginning-of-buffer)
		(">" . mark-end-of-buffer)
		("P" . mark-page)
		("b" . mark-whole-buffer)
		("d" . mark-defun)
		("e" . mark-end-of-sentence)
		("p" . mark-paragraph)
		("s" . mark-sexp)
		("w" . mark-word))

  (:map goto-map
		("re" . grep)
		("rr" . rgrep)
		("rl" . lgrep)
		("rv" . vc-git-grep)
		("M-r M-e" . grep)
		("M-r M-r" . rgrep)
		("M-r M-l" . lgrep)
		("M-r M-v" . vc-git-grep))

  (:map personal-misc-bindings-keymap
		;; "C-c u" . mode-line-other-buffer
		("d" . delete-char)
		)
  :bind-keymap
  ("C-d" . personal-misc-bindings-keymap)
  ;; ("C-d k" . mark-keymap)
  :hook
  ;; Make the *Occur* buffer names unique and writable
  (occur-hook . (lambda ()
				  (occur-rename-buffer t)
				  (setq buffer-read-only nil)))

  ;; superword-mode counts my_short_ex as a single word
  ;; (prog-mode . superword-mode)
  ;; (before-save . whitespace-cleanup)
  (emacs-lisp-mode . (lambda () (add-hook 'before-save-hook 'whitespace-cleanup nil 'make-it-local)))
  (prog-mode . display-line-numbers-mode))

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

(defun set-quad-selective-display (arg)
  "Hide code levels (tab indent assumed to be 4)."
  (interactive "P")
  (set-selective-display
   (* 4 (prefix-numeric-value arg))))

(defun toggle-compilation-window ()
  "Show/Hide the window containing the '*compilation*' buffer."
  (interactive)
  (when-let* ((buffer compilation-last-buffer))
	(if (get-buffer-window buffer 'visible)
		(delete-windows-on buffer)
	  (display-buffer buffer))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (backward-word arg) (point))))

(defun find-thing-at-point-dwim (&optional arg)
  "Find url, variable, function or file at point."
  (interactive "P")

  (cond ((thing-at-point 'url)
		 (browse-url (thing-at-point 'url) arg))
		((not (eq (variable-at-point) 0))
		 ;; (call-interactively 'describe-variable/function)
		 (describe-variable (symbol-at-point)))
		((function-called-at-point)
		 (describe-function (symbol-at-point)))
		(t (find-file-at-point))))
