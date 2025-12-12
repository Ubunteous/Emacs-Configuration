;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               CASUAL               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package casual-suite
  :defer t
  :config
  (transient-define-prefix casual-transient ()
	["Transients"
	 ["Main"
	  ("A" "Avy" casual-avy-tmenu)
	  ;; ("B" "Bibtex" casual-bibtex-tmenu)
	  ("b" "Bookmarks" casual-bookmarks-tmenu)
	  ("c" "Compile" casual-compile-tmenu)
	  ("e" "Ediff" casual-ediff-tmenu)
	  ("e" "Elisp" casual-elisp-tmenu)
	  ]

	 ["Main"
	  ("i" "Ibuffer" casual-ibuffer-tmenu)
	  ("s" "isearch" casual-isearch-tmenu)
	  ("s" "Eshell" casual-eshell-tmenu)
	  ("t" "timezone" casual-timezone-tmenu)
	  ]

	 ["Help"
	  ("m" "Man" casual-man-tmenu) 
	  ("n" "Calc" casual-calc-tmenu)
	  ("h" "Help" casual-help-tmenu)
	  ("I" "Info" casual-info-tmenu)
	  ("S" "Symbol" casual-symbol-overlay-tmenu)
	  ("r" "re-builder" casual-re-builder-tmenu)
	  ]

	 ["Org"
	  ("a" "Agenda" casual-agenda-tmenu)
	  ("C" "Calendar" casual-calendar-tmenu)
	  ]

	 ["Editkit"
	  ("C-a" "main" casual-editkit-main-tmenu)
	  ("C-b" "bookmarks" casual-editkit-bookmarks-tmenu)
	  ("C-c" "copy" casual-editkit-copy-tmenu)
	  ("C-d" "delete" casual-editkit-delete-tmenu)
	  ("C-E" "emoji" casual-editkit-emoji-symbols-tmenu)
	  ("C-e" "edit" casual-editkit-edit-tmenu)
	  ("C-f" "transform" casual-editkit-transform-text-tmenu)
	  ("C-g" "registers" casual-editkit-registers-tmenu)
	  ]
	 
	 ["Editkit"
	  ("C-k" "kill" casual-editkit-kill-tmenu)
	  ("C-M" "macro" casual-editkit-macro-tmenu)
	  ("C-m" "mark" casual-editkit-mark-tmenu)
	  ("C-n" "narrow" casual-editkit-narrow-tmenu)
	  ("C-O" "open" casual-editkit-open-tmenu)
	  ("C-o" "move" casual-editkit-move-text-tmenu)
	  ("C-p" "project" casual-editkit-project-tmenu)
	  ("C-R" "reformat" casual-editkit-reformat-tmenu)
	  ]
	 
	 ["Editkit"
	  ("C-r" "rectangle" casual-editkit-rectangle-tmenu)
	  ("C-S" "sort" casual-editkit-sort-tmenu)
	  ("C-s" "search" casual-editkit-search-tmenu)
	  ("C-T" "transpose" casual-editkit-transpose-tmenu)
	  ("C-t" "tools" casual-editkit-tools-tmenu)
	  ("C-W" "windows delete" casual-editkit-windows-delete-tmenu)
	  ("C-w" "windows" casual-editkit-windows-tmenu)
	  ]
	 
	 ["Dired"
	  ("S-g" "general" casual-dired-tmenu)
	  ("S-S" "sort" casual-dired-sort-by-tmenu)
	  ("S-s" "search/replace" casual-dired-search-replace-tmenu)
	  ]
	 ]
	)
  :general
  ("C-c m" 'casual-transient))
