;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             ORG-AGENDA             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-agenda
  :defer t
  :ensure nil
  :config
  ;;;;;;;;;;
  ;; FACE ;;
  ;;;;;;;;;;

  ;; (set-face-attribute 'org-agenda-date nil :foreground "light sea green")
  (set-face-attribute 'org-agenda-calendar-event nil :foreground "light sea green")

  ;;;;;;;;;;;;;;;;
  ;;   AGENDA   ;;
  ;;;;;;;;;;;;;;;;

  ;; Note: #+Category can be set on any entry (by default, refers to filename)
  ;; Note: agendas can be exported/extracted (see documentation Extracting Agenda Information)

  ;;;;;;;;;;;
  ;; FILES ;;
  ;;;;;;;;;;;

  ;; see also org-agenda-file-regexp
  (setopt org-agenda-files (mapcar (-partial 'concat "agenda/")
								   '("inbox.org" "agenda.org")))

  ;;;;;;;;;;;;;;;;
  ;; APPEARANCE ;;
  ;;;;;;;;;;;;;;;;

  ;; (setq org-agenda-view-columns-initially nil) ; columns for entries
  ;; (setq org-columns-default-format-for-agenda ...) ; for column view

  ;; ;; 1) daily/weekly/today/require-timed/remove-match
  ;; ;; 2) times that should have a grid line (integers list)
  ;; ;; 3) string placed right after the times that have a grid line
  ;; ;; 4) string placed after the grid times. aligns with agenda items
  ;; (setq org-agenda-use-time-grid t
  ;;		org-agenda-time-grid
  ;;		'((weekly today require-timed)
  ;;		  (800 1000 1200 1400 1600 1800 2000)
  ;;		  " ┄┄┄┄┄ "
  ;;		  "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄"))
  ;; (setq org-agenda-current-time-string "ᐊ┈┈┈┈┈┈┈┈ now")

  ;; Format for dates in org: %%(org-anniversary 1976 6  1) Emacs is %d years old
  ;; (setq org-agenda-format-date 'org-agenda-format-date-aligned)

  ;; use this separator with writeroom
  (setq org-agenda-block-separator (concat (make-string 40 ?-) "\n"))
  ;; (setq org-agenda-compact-blocks nil) ; removes block-separator line

  ;; ;; active with org-agenda-entry-text-mode or org-agenda-entry-text-show(-here)
  ;; (setq org-agenda-entry-text-leaders "    > ")

  ;; ;; 1) agenda type between: agenda, todo, search and tags
  ;; ;; alist of %c (category), %e (effort), %l (level), %i (icon category org-agenda-category-icon-alist),
  ;; ;; %T (last non-inherited tag), %t (time), %s (deadline), %b (breadcrumbs), %(expression)
  ;; (setq org-agenda-prefix-format " %-12c %?-14t% s")
  (setq org-agenda-prefix-format
		'((agenda . "%i %-12:c%?-12t% s")
		  (timeline . "% s")
		  (todo . " ")
		  (tags . "%i %-12:c")
		  (search . "%i %-12:c")))

  (setq org-agenda-time-leading-zero t)

  ;; text for current, future, past deadline
  ;; alt: '("[D] : " "[D] +%3d d.: " "[D] -%3d d.: "))
  (setq org-agenda-deadline-leaders '("" "In %3d d.: " "%2d d. ago: "))

  ;; Window: current, other, only | Frame: reorganize, other | Tab: other
  (setq org-agenda-window-setup 'only-window
		org-agenda-restore-windows-after-quit t)

  (setq org-agenda-tags-column -89)

  ;; (setq org-agenda-dim-blocked-tasks t) ; performance penalty when t

  ;; (defun my/org-agenda-late-extra (orig-fn extra txt &rest args)
  ;;	 (let* ((marker (or extra ""))
  ;;			(agenda-extra
  ;;			 (let ((d (when (stringp extra)
  ;;						(abs (string-to-number extra)))))
  ;;             (cond
  ;;				((not d) "")
  ;;				((= d 0) "")
  ;;				((< d 3) " •")
  ;;				((< d 7) " !")
  ;;				((< d 14) " ‼")
  ;;				(t " ✖")))))
  ;;     (apply orig-fn agenda-extra txt args)))
  ;; (advice-add 'org-agenda-format-item :around #'my/org-agenda-late-extra)

  ;; (setq org-agenda-scheduled-leaders '("" "-%2d")) ; '("" "S%3d: ")) ; or '("[S] : " "[S] x%3d d.: "))

  ;; (setq org-agenda-todo-keyword-format "%.1s") ; org %-10s
  ;; (setq org-agenda-remove-tags t) ; t, nil or 'prefix (see org-agenda-prefix-format with %T)

  ;; ;; set org-agenda-menu-show-matcher to nil when using it
  ;; (setq org-agenda-menu-show-matcher nil
  ;;		org-agenda-menu-two-columns (not org-agenda-menu-show-matcher))

  ;;;;;;;;;;;;;
  ;; FILTERS ;;
  ;;;;;;;;;;;;;

  (setq org-agenda-start-on-weekday nil ; defaults to 1 (monday)
		org-agenda-start-day "-3d" ; see org-read-date for format
		org-agenda-span 'month) ; 'day, 'week, 'month, 'year, or number

  (setq org-agenda-show-future-repeats 'next) ; t, nil, 'next

  (setq org-agenda-add-entry-text-maxlines 5)
  ;; (setq org-agenda-add-entry-text-descriptive-links nil)

  ;; (setq org-agenda-hide-tags-regexp "project\\|work\\|home\\|@.*")

  ;; (setq org-agenda-skip-function
  ;;		 (lambda ()
  ;;		   (when (member (org-get-todo-state)
  ;;						 '("PROJ" "SOMEDAY"))
  ;;			 (or (outline-next-heading) (point-max)))))

  ;; (setq org-agenda-sort-notime-is-late nil) ; defaults to t. Items without time are sorted as late

  ;; org-agenda-<skip/ignore>-<regexp/deadline/scheduled/timestamp-if-done>
  (setq org-agenda-skip-scheduled-if-done t)

  ;;;;;;;;;;;;;;;;
  ;;   CUSTOM   ;;
  ;;;;;;;;;;;;;;;;

  ;; defaults to: (("n" "Agenda and all TODOs" ((agenda "") (alltodo ""))))
  ;; can combine multiple elements per group (see Block agenda documentation)
  ;; 1) key binding
  ;; 2) description
  ;; 3) type
  ;; - agenda      The daily/weekly agenda.
  ;; - agenda*     Appointments for current week/day.
  ;; - todo        Entries with a specific TODO keyword, in all agenda files.
  ;; - search      Entries containing search words entry or headline.
  ;; - tags        Tags/Property/TODO match in all agenda files.
  ;; - tags-todo   Tags/P/T match in all agenda files, TODO entries only.
  ;; - todo-tree   Sparse tree of specific TODO keyword in *current* file.
  ;; - tags-tree   Sparse tree with all tags matches in *current* file.
  ;; - occur-tree  Occur sparse tree for *current* file.
  ;; - alltodo     The global TODO list.
  ;; - stuck       Stuck projects.
  ;; ...         A user-defined function.
  ;; 4) match (search)
  ;; - a single keyword for TODO keyword searches
  ;; - a tags/property/todo match expression for searches
  ;; - a word search expression for text searches.
  ;; - a regular expression for occur searches
  ;; - empty string otherwise
  ;; 5) files list: where write agenda buffer with org-store-agenda-views (html/ps or plain)
  ;; Alt: set of commands, to create a composite agenda buffer:
  ;; (key desc (cmd1 cmd2 ...) general-settings-for-whole-set files)
  ;; Valid commands:
  ;; - (agenda "" settings)
  ;; - (agenda* "" settings)
  ;; - (alltodo "" settings)
  ;; - (stuck "" settings)
  ;; - (todo "match" settings files)
  ;; - (search "match" settings files)
  ;; - (tags "match" settings files)
  ;; - (tags-todo "match" settings files)
  ;; org-agenda-custom-commands
  ;; org-agenda-custom-commands-local-options
  (add-to-list
   'org-agenda-custom-commands
   '("w" "THIS WEEK"
	 ((agenda ""
			  ((org-agenda-overriding-header
				(concat "THIS WEEK (W" (format-time-string "%V") ")")))))))
  (add-to-list
   'org-agenda-custom-commands
   '("d" "DAY'S AGENDA"
	 ((agenda ""
			  ((org-agenda-overriding-header
				(concat "TODAY (W" (format-time-string "%V") ")"))
			   (org-agenda-span 'day)
			   (org-agenda-start-day nil) ; overrides my -3d preference for weeks
			   (org-agenda-sorting-strategy
				'((agenda time-up priority-down category-keep)))
			   (org-agenda-show-log t)
			   (org-agenda-log-mode-items '(clock)))))))

  (add-to-list
   'org-agenda-custom-commands
   '("g" "Get Things Done (GTD)"
	 ((agenda ""
			  ((org-agenda-skip-function
				'(org-agenda-skip-entry-if 'deadline))
			   (org-deadline-warning-days 0)))
	  (todo "NEXT"
			((org-agenda-skip-function
			  '(org-agenda-skip-entry-if 'deadline))
			 (org-agenda-prefix-format "  %i %-12:c [%e] ")
			 (org-agenda-overriding-header "\nTasks\n")))
	  (agenda nil
			  ((org-agenda-entry-types '(:deadline))
			   (org-agenda-format-date "")
			   (org-deadline-warning-days 7)
			   (org-agenda-skip-function
				'(org-agenda-skip-entry-if 'notregexp "\\* NEXT"))
			   (org-agenda-overriding-header "\nDeadlines")))
	  (tags-todo "inbox"
				 ((org-agenda-prefix-format "  %?-12t% s")
				  (org-agenda-overriding-header "\nInbox\n")))
	  (tags "CLOSED>=\"<today>\""
			((org-agenda-overriding-header "\nCompleted today\n"))))))

  ;; either a single list or multiple each starting with these:
  ;; CATEGORIES: agenda, todo, tags, search
  ;; FILTER BY (pick multiple. order matters):
  ;; - time-up/time-down (time of day)
  ;; - timestamp-up/down (any timestamp)
  ;; - scheduled-up/down
  ;; - deadline-up/down
  ;; - ts-up/down (active timestamp)
  ;; - tsia-up/down (inactive timestamp)
  ;; - category-keep (default categories order - see sequence in org-agenda-files)
  ;; - category-up/down (alphabetically sorted)
  ;; - tag-up/down (alphabetically sorted)
  ;; - priority-up/down
  ;; - urgency-up/down (calculated using priotity+deadline proximity)
  ;; - todo-state-up/down
  ;; - effort-up/down
  ;; - user-defined-up/down (sort according to org-agenda-cmp-user-defined)
  ;; - habit-up/down
  ;; - alpha-up/down (sort headlines alphabetically)
  ;; => org-agenda-sorting-strategy (use it in org-agenda-custom-commands)

  ;;;;;;;;;;
  ;; MISC ;;
  ;;;;;;;;;;

  ;; (setq org-todo-keywords
  ;;		'((sequence "TODO(t)" "NEXT(n)" "HOLD(h)" "|" "DONE(d)")))
  ;; (defun log-todo-next-creation-date (&rest ignore)
  ;;	"Log NEXT creation time in the property drawer under the key 'ACTIVATED'"
  ;;	(when (and (string= (org-get-todo-state) "NEXT")
  ;;              (not (org-entry-get nil "ACTIVATED")))
  ;;     (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d]"))))
  ;; (add-hook 'org-after-todo-state-change-hook #'log-todo-next-creation-date)


  (setq org-log-done 'time) ;; add timestamp 'time on done or capture 'note
  (setq org-deadline-warning-days 0)
  ;; (setq org-log-into-drawer t)

  ;; (setq org-agenda-search-view-always-boolean t)

  ;; t, nil, 'start-level
  ;; (setq org-agenda-loop-over-headlines-in-active-region 'start-level)

  ;; (setq org-agenda-use-tag-inheritance nil) ; performance boost

  (setq org-agenda-show-outline-path 'title)

  ;; deactivate agenda if it slows down startup time too much
  (setq org-agenda-inhibit-startup t)

  ;; ;;; single blank line between blocks
  ;; (defun my/org-agenda-fix-block-spacing ()
  ;;	 (goto-char (point-min))
  ;;	 (while (re-search-forward "\n\n\n+" nil t)
  ;;     (replace-match "\n\n")))
  ;; (add-hook 'org-agenda-finalize-hook
  ;;			 #'my/org-agenda-fix-block-spacing)

  ;; (customize-set-value
  ;;	'org-agenda-category-icon-alist
  ;;	`(("work" "~/.config/icons/work.svg" nil nil :ascent center :mask heuristic)
  ;;	  ("project" "~/.config/icons/project.svg" nil nil :ascent center :mask heuristic)))

  (defun org-agenda-show-mix (&optional arg)
	(interactive "P")
	(org-agenda arg "n"))

  ;;;;;;;;;;;;
  ;; REFILE ;;
  ;;;;;;;;;;;;

  (setq org-log-refile 'time) ; nil, time, note (prompt)
  ;; (setq org-refile-keep t)
  (setq org-refile-use-outline-path 'file)
  (setq org-outline-path-complete-in-steps nil)

  ;; These files must exist
  (setq org-refile-targets `((org-agenda-files :maxlevel . 3)
							 ("projects.org" :regexp . ,(regexp-opt '("Tasks" "Notes"))) ; * sections
							 (nil :maxlevel . 3) ; agenda-files
							 ("done.org" :maxlevel . 3)))

  ;; does not work yet but interesting
  ;; (defun gtd-save-org-buffers ()
  ;;	"Save `org-agenda-files' buffers without user confirmation.
  ;; See also `org-save-all-org-buffers'"
  ;;	(interactive)
  ;;	(message "Saving org-agenda-files buffers...")
  ;;	(save-some-buffers t (lambda ()
  ;;						   (when (member (buffer-file-name) org-agenda-files)
  ;;							 t)))
  ;;	(message "Saving org-agenda-files buffers... done"))
  ;; (advice-add
  ;;  'org-refile
  ;;  :after (lambda (&rest _) (gtd-save-org-buffers)))

  ;;;;;;;;;;;;;;;
  ;;   DIARY   ;;
  ;;;;;;;;;;;;;;;

  (setq diary-file "~/org/diary.org")

  ;; options: date-tree (first child of date), date-tree-last (last child of date), top-level (eof)
  (setq org-agenda-insert-diary-strategy 'date-tree) ; where insert

  ;; (setq org-agenda-include-diary t)
  ;; (setq org-agenda-insert-diary-extract-time t)

  ;;;;;;;;;;;;;;;;;;
  ;;   CALENDAR   ;;
  ;;;;;;;;;;;;;;;;;;

  ;; 'one-frame for calendar+diary, 'two-frames or 'calendar-only
  (setq calendar-setup 'calendar-only)

  ;; defaults to c if available. Uses org-calendar-goto-agenda
  ;; (setq org-calendar-to-agenda-key 'default)

  ;;;;;;;;;;;;;;;;;
  ;;   CAPTURE   ;;
  ;;;;;;;;;;;;;;;;;

  (setopt org-directory (if windows-system-p
							"~/../../Documents/org/"
						  "~/org/"))
  (setopt org-default-notes-file (concat org-directory "agenda/.notes.org")) ; fallback for captures

  ;; ;; alternative syntax to use functions
  ;; (setq org-capture-templates
  ;;	  `(("i" "Inbox" entry  (file "inbox.org")
  ;;		 ,(concat "* TODO %?\n"
  ;;				  "/Entered on/ %U"))
  ;;		("n" "Note" entry  (file "notes.org")
  ;;		 ,(concat "* Note (%a)\n"
  ;;				  "/Entered on/ %U\n" "\n" "%?"))
  ;;		("m" "Meeting" entry  (file+headline "agenda.org" "Future")
  ;;		 ,(concat "* %? :meeting:\n"
  ;;				  "<%<%Y-%m-%d %a %H:00>>"))))
  (setq org-capture-templates
		'(("i" "Inbox"
		   entry (file "agenda/inbox.org")
		   "* %?%i %t"
		   :empty-lines-before 1)
		  ("d" "New deadline for the agenda"
		   entry (file "agenda/inbox.org")
		   "* %?%i \nDEADLINE: <%<%Y-%m-%d %a>>" :empty-lines-before 1) ;; %t <%<%m-%d %a>>
		  ;; ("j" "Journal"
		  ;;  entry (file+datetree "~/org/journal.org")
		  ;;  "* %?\nEntered on %U\n  %i\n  %a")
		  ("s" "Slipbox"
		   entry (file "Alter/inbox.org")
		   "* %?\n")))

  ;; shift org capture default date to tomorrow
  (advice-add 'org-capture :around
			  (lambda (oldfun &rest args)
				(let ((org-overriding-default-time
					   (funcall
						(lambda ()
						  (let ((day (string-to-number (format-time-string "%d")))
								(month (string-to-number (format-time-string "%m")))
								(year (string-to-number (format-time-string "%Y"))))
							(encode-time 1 1 0 (1+ day) month year))))))
				  (apply oldfun args))))

  (defun org-capture-deadline ()
	(interactive)
	(org-capture nil "d"))
  :general
  ("C-c a" 'org-agenda-show-mix
   "C-c o" 'org-capture-deadline)

  ;; a bit redundant with C-c C-d (org-deadline)
  (:keymaps 'org-capture-mode-map
			"C-c d" 'org-timestamp-up-day))
