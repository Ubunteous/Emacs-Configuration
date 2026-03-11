;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             ORG-AGENDA             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-agenda
  :defer t
  :ensure nil
  :custom-face
  ;; (org-agenda-date ((t (:foreground "light sea green"))))
  (org-agenda-calendar-event ((t (:foreground "light sea green"))))
  :config
  ;;;;;;;;;;;;;;;;
  ;;   AGENDA   ;;
  ;;;;;;;;;;;;;;;;

  ;; Note: #+Category can be set on any entry (by default, refers to filename)
  ;; Note: agendas can be exported/extracted (see documentation Extracting Agenda Information)

  ;;;;;;;;;;;
  ;; FILES ;;
  ;;;;;;;;;;;

  ;; see also org-agenda-file-regexp
  (let ((inbox-path (if windows-system-p "~/../../Documents/org/" "~/org/")))
	(setq org-agenda-files (list (concat inbox-path "inbox.org"))))

  ;;;;;;;;;;;;;;;;
  ;; APPEARANCE ;;
  ;;;;;;;;;;;;;;;;

  ;; (setq org-agenda-view-columns-initially t)
  ;; org-columns-default-format-for-agenda ; for column view

  ;; (setq org-agenda-use-time-grid t)
  ;; (setq org-agenda-format-date 'org-agenda-format-date-aligned)

  ;; ;; 1) daily/weekly/today/require-timed/remove-match
  ;; ;; 2) times that should have a grid line (integers list)
  ;; ;; 3) string placed right after the times that have a grid line
  ;; ;; 4) string placed after the grid times. aligns with agenda items
  ;; org-agenda-time-grid ; display

  ;; use this separator with writeroom
  (setq org-agenda-block-separator (concat (make-string 40 ?-) "\n"))
  ;; (setq org-agenda-compact-blocks t)

  ;; (setq org-agenda-entry-text-leaders "    > ")

  ;; ;; alist of %c (category)
  ;; ;; %e (effort), %l (level), %i (icon category org-agenda-category-icon-alist),
  ;; ;; %T (last non-inherited tag), %t (time), %s (deadline), %b (breadcrumbs), %(expression)
  ;; (setq org-agenda-prefix-format
  ;;		(quote
  ;;		 ((agenda . "%-12c%?-12t% s")
  ;;		  (timeline . "% s")
  ;;		  (todo . "%-12c")
  ;;		  (tags . "%-12c")
  ;;		  (search . "%-12c")))
  ;;		org-agenda-deadline-leaders (quote ("!D!: " "D%2d: " ""))

  (setq org-agenda-time-leading-zero t)

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

  ;; (setq org-agenda-scheduled-leaders '("" "-%2d")) ; '("" "S%3d: "))

  ;; (setq org-agenda-todo-keyword-format "%.1s")
  ;; (setq org-agenda-remove-tags t)

  ;; ;; set org-agenda-menu-show-matcher to nil when using it
  ;; (setq org-agenda-menu-show-matcher nil)
  ;; (setq org-agenda-menu-two-columns (not org-agenda-menu-show-matcher))

  ;;;;;;;;;;;;;
  ;; FILTERS ;;
  ;;;;;;;;;;;;;

  (setq org-agenda-start-on-weekday nil ; defaults to 1 (monday)
		org-agenda-start-day "-3d" ; see org-read-date for format
		org-agenda-span 'month) ; 'day, 'week, 'month, 'year, or number

  (setq org-agenda-show-future-repeats 'next)

  ;; (setq org-agenda-add-entry-text-maxlines 1)
  ;; (setq org-agenda-add-entry-text-descriptive-links t)

  ;; (setq org-agenda-hide-tags-regexp "project\\|work\\|home\\|@.*")
  ;; (setq org-agenda-show-future-repeats nil) ;; t, nil, 'next

  ;; (setq org-agenda-skip-function
  ;;		 (lambda ()
  ;;		   (when (member (org-get-todo-state)
  ;;						 '("PROJ" "SOMEDAY"))
  ;;			 (or (outline-next-heading) (point-max)))))

  ;; (setq org-agenda-sort-notime-is-late t) ; defaults to t. Items without time are sorted as late

  ;; org-agenda-skip-regexp/deadline/scheduled/timestamp-if-done
  (setq org-agenda-skip-scheduled-if-done t)

  ;; org-agenda-todo-ignore-deadlines/scheduled/timestamp/with-date

  ;;;;;;;;;;;;;;;;
  ;;   CUSTOM   ;;
  ;;;;;;;;;;;;;;;;

  ;; org-agenda-overriding-header
  ;; org-agenda-search-view-always-boolean

  ;; defaults to: (("n" "Agenda and all TODOs" ((agenda "") (alltodo ""))))
  ;; can combine multiple elements per group (see Block agenda documentation)
  ;; 1) key binding
  ;; 2) description
  ;; 3) type     The command type, any of the following symbols:
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

  ;; either a single list or multiple each starting with these:
  ;; CATEGORIES: agenda, todo, tags, search
  ;; FILTER BY:
  ;; - time-up/time-down
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
  ;; org-agenda-sorting-strategy

  (defun org-agenda-show-mix (&optional arg)
	(interactive "P")
	(org-agenda arg "n"))

  ;;;;;;;;;;
  ;; MISC ;;
  ;;;;;;;;;;

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

  ;;;;;;;;;;;;
  ;; REFILE ;;
  ;;;;;;;;;;;;

  ;; (setq org-refile-use-outline-path 'file)

  ;; ;; These files must exist
  ;; (setq org-refile-targets
  ;;		'(("Inbox.org" :maxlevel . 1)
  ;;		  ("done.org" :level . 1)
  ;;		  ("Test.org" :level 1)))

  ;; (setq org-refile-targets
  ;;		'((nil :maxlevel . 3)
  ;;         (org-agenda-files :maxlevel . 3)))

  ;;;;;;;;;;;;;;;
  ;;   DIARY   ;;
  ;;;;;;;;;;;;;;;

  ;; (setq diary-file "~/Desktop/Org/diary.org")

  ;; options: date-tree (first child of date), date-tree-last (last child of date), top-level (eof)
  ;; (setq org-agenda-insert-diary-strategy 'date-tree) ; where insert

  ;; (setq org-agenda-include-diary t)
  ;; (setq org-agenda-insert-diary-extract-time t)

  ;;;;;;;;;;;;;;;;;;
  ;;   CALENDAR   ;;
  ;;;;;;;;;;;;;;;;;;

  ;; (setq calendar-setup 'calendar-only)
  ;; (setq org-agenda-include-diary t)

  ;; defaults to c if available. Uses org-calendar-goto-agenda
  ;; (setq org-calendar-to-agenda-key 'default)

  ;;;;;;;;;;;;;;;;;
  ;;   CAPTURE   ;;
  ;;;;;;;;;;;;;;;;;

  (defun org-capture-deadline ()
	(interactive)
	(org-capture nil "d"))

  ;; (setq org-directory "~/org") ;; default
  (setq org-default-notes-file (concat org-directory "~/.notes"))

  (setq org-capture-templates
		'(("t" "New task for the agenda"
		   entry (file "~/org/agenda.org")
		   "* %?%i %t" :empty-lines-before 1)
		  ("d" "New deadline for the agenda"
		   entry (file "~/org/agenda.org")
		   "* %?%i \nDEADLINE: <%<%Y-%m-%d %a>>" :empty-lines-before 1) ;; %t <%<%m-%d %a>>
		  ("s" "Slipbox"
		   entry (file "~/org/Alter/inbox.org")
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

  (setq org-deadline-warning-days 0
		org-agenda-deadline-leaders '("" "In %3d d.: " "%2d d. ago: "))

  ;; ("j" "Journal" entry (file+datetree "~/org/journal.org")
  ;;  "* %?\nEntered on %U\n  %i\n  %a")))
  :general
  ("C-c a" 'org-agenda-show-mix
   "C-c o" 'org-capture-deadline)

  ;; a bit redundant with C-c C-d (org-deadline)
  (:keymaps 'org-capture-mode-map
			"C-c d" 'org-timestamp-up-day))
