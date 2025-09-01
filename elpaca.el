;;; straight-package --- Summary
;;; Code:
;;; Commentary:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           LOAD USER FILES          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defun load-user-file (file)
;;   "Add FILE to configuration (located in directory: packages)."
;;   ;; (interactive "f")
;;   "Load a file from the packages ~/.emacs/directory"
;;   (load-file (expand-file-name (concat "~/.emacs.d/packages/" file ".el"))))

;; ;; use like this => (load-user-files "passive-utils" '("evil" "rainbow"))
;; (defun load-user-files (dir list)
;;   "Load a LIST of files located in the corresponding DIR."
;;   (dolist (file list)
;;     (load-user-file (concat dir "/" file))))

(defun load-user-files (dir list)
  "Load a LIST of files located in the corresponding DIR."
  (dolist (file list)
    (load-file
     (expand-file-name
      ;; make this usable in any dir (not just ~/.emacs.d/ with:
      ;; (file-name-directory buffer-file-name)
      (concat "~/.emacs.d/packages/" dir "/" file ".el")))))


(defun load-user-files-per-system (dir windows linux both)
  "Load config files depending on the operating system."
  ;; (fset #'partial-load-user-files `(lambda (_list) (load-user-files ,dir _list)))

  ;; (if windows-system-p
  ;;     (mapcar 'partial-load-user-files `(,windows ,both))
  ;;   (mapcar 'partial-load-user-files `(,linux ,both)))

  (if windows-system-p
      (load-user-files dir windows)
    (load-user-files dir linux))
  
  (load-user-files dir both))

;; (setq omit-heavy nil)
;; ;; not that great. it barely saves me .1 or .2 seconds
;; (defun do-omit-heavy (omit-heavy function)
;;   "Do not execute a functiuon if OMIT-HEAVY is true.
;; Useful to reload quickly a configuration when testing new changes"
;;   (if omit-heavy
;;       ()
;;     'function))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               PACKAGES             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;
;;   built-in   ;;
;;;;;;;;;;;;;;;;;;

(load-user-files-per-system "built-in"
							'()

							'("smtpmail"
							  "treesit"
							  "eglot")
							
							'("auto-insert"
							  "completion"
							  "dired" ;; => add git compatibility
							  "fly"
							  "ibuffer"
							  ;; "icomplete" ;; competes with vertico
							  "misc"
							  "recentf"
							  "repeat"
							  "which-key"			  
							  ;; "eglot-booster"
							  "isearch"
							  "help"))

;; (load-user-file "built-in/hide-show") ;; not perfect but serviceable => ts-fold
;; (load-user-file "built-in/newsticker") ;; alt: see elfeed
;; (load-user-file "workflow/dape")

;; lsp / debug alternatives:
;; (load-user-file "workflow/lsp-mode")
;; (load-user-file "workflow/realgud")

;;;;;;;;;;;;;;;
;;   perso   ;;
;;;;;;;;;;;;;;;

(load-user-files "perso" '("calendar" ;; year-calendar function
						   "align"
						   "fix-encoding"
						   "smart-insert"
						   "auto-close-compilation"
						   "dired-count-lines"
						   "org-properties-to-csv"
						   "org-ctrl-c-plus"
						   "case"))

;; (load-user-file "perso/break-time")
;; (load-user-file "perso/cursor-color") ;; cool but I still do not know why I made it
;; (breaktime-start (* 22 60)) ;; 22 minutes

;; ;;;;;;;;;;;;;;;;;;;;
;; ;;   appearance   ;;
;; ;;;;;;;;;;;;;;;;;;;;

(load-user-files "appearance" '("monokaolin"
				"all-the-icons"
				"dashboard"
				"centaur-tabs"
				"fira"
				;; "nova"
				"moody"
				"spacious-padding"
				"kind-icon"))

;; (load-user-file "appearance/nerd-icons")

;;;;;;;;;;;;;;;;;;
;;   workflow   ;;
;;;;;;;;;;;;;;;;;;

(load-user-files-per-system "workflow"
							'()
							'("notmuch")
							'("ace-window" ;; add rotate/transpose frame
							  ;; "forge" ;; bring back later
							  "magit"
							  
							  ;; font is transparent. e.g.: ls /path/to/file is hard to see
							  ;; "vterm" ;; vterm should be installed from NixOS configuration
							  ;; "eat" ;; slower than vterm but written in elisp
							  )) ;; requires notmuch package from outside emacs

;; (load-user-file "workflow/mu4e") ;; requires mu package from outside emacs and must be installed from Nix rather than straight
;; (load-user-file "workflow/perspective")
;; (load-user-file "workflow/elfeed") ;; alt: newsticker built-in
;; (load-user-file "workflow/hydra")
;; (load-user-file "workflow/mu4e-alert") ;; slightly slow startup. maybe use a hook

;;;;;;;;;;;;;
;;   org   ;;
;;;;;;;;;;;;;

(elpaca-wait)

(load-user-files-per-system "org"
							'("htmlize")

							'("jupyter" ;; convert org -> ipynb with ox-ipynb
							  "org-fragtog"
							  "org-fancy-priorities"
							  ;; zettelkasten
							  ;; "delve" ;; bring back later
							  "org-roam"
							  "org-roam-ui"
							  ;; deft
							  "deft"
							  "notdeft")

							'("org"
							  "org-modern"
							  ;; "ord-modern-indent"
							  "org-appear"

							  ;; not ready yet
							  ;; more casual-packages to discover
							  ;; "casual-agenda"

							  ;; "ob/ob-rust"
							  ;; "ob/ob-janet"
							  ;; "ob/ob-restclient"
							  "ob/ob-csharp"
							  ;; "ob/ob-go"
							  "ob/ob-html"
							  "ob/ob-sql"
							  ;; "ob/ob-async"
							  "ob/ob-powershell"
							  "ob/ob-nix"))

;; Ready
;; (load-user-file "org/org-cliplink")
;; (load-user-file "org/org-contrib")
;; (load-user-file "org/org-download")

;; (load-user-file "org/org-ql") ;; check git documentation
;; (load-user-file "org/org-transclusion")

;;;;;;;;;;;;;;;;;;;
;;   composite   ;;
;;;;;;;;;;;;;;;;;;;

(load-user-files-per-system "composite"
							'("flyspell-correct")

							'("jinx")
							
							'("cape" ;; surprisingly useful!
							  "corfu"

							  "embark" ;; use it with consult
							  "marginalia"
							  "orderless"
							  "consult"
							  "prescient" ;; alternative to orderless
							  "vertico"

							  "tempel"

							  ;; "citar"
							  "minimal-swiper"))

;;;;;;;;;;;;;;;;;;;
;;   utilities   ;;
;;;;;;;;;;;;;;;;;;;

(load-user-files-per-system "utilities"
							'()

							'("expand-region"
							  ;; "devdocs" ;; missing mathjax lib
							  "minions"
							  "multiple-cursors"
							  ;; "powerthesaurus"
							  ;; "outli"
							  "symbol-overlay-mc"
							  "docker"
							  "combobulate"
							  ;; "restclient"
							  "wgrep")

							'("crux"
							  ;; "avy"
							  ;; "popper" ;; try later
							  ;; "consult-dir" ;; cool but similar to consult-buffer
							  "gptel"
							  "outline-indent" ;; does not work well with python
							  "evil-nerd-commenter"
							  "helpful"
							  "iedit" ;; => multi-occur edit. Note: occur-mode e can already edit occur-mode buffer
							  "move-text"
							  "visual-regexp"
							  "vundo"

							  ;; choose one paredit superset to replace electric (pair) mode
							  ;; "smartparens" ;; currently missing electric-pairs smart predicate
							  ;; "lispy" ;; vi-like bindings conflicting with meow

							  "writeroom"))

;; (load-user-file "utilities/dumb-jump") ;; very cool but xref is broken in python
;; (load-user-file "utilities/esup")

;; (load-user-file "utilities/quickrun")

;;;;;;;;;;;;;;;;;;;;;;;
;;   passive-utils   ;;
;;;;;;;;;;;;;;;;;;;;;;;

(load-user-files-per-system "passive-utils"
							'()

							'("apheleia"
							  ;; "diff-hl"
							  "hl-todo")

							'("meow"
							  ;; "git-gutter" ;; like diff-hl
							  ;; "which-key" ;; now built-in
							  "rainbow-delimiters"
							  ;; "adaptive-wrap"
							  "ultra-scroll"
							  "aggressive-indent"
							  "auto-capitalize" ;; => LaTeX/org mode only
							  "beacon"
							  "browse-kill-ring"
							  "diminish"
							  "dimmer" ;; DONE
							  "undo-hl" ;; => not in melpa yet
							  ;; "symbol-overlay" ;; strong. maybe use later
							  "no-littering"))

;; (load-user-file "passive-utils/evil")
;; (load-user-file "passive-utils/rainbow") ;; colorize color names (like css mode). alt: colorful-mode
;; (load-user-file "passive-utils/direnv")

;;;;;;;;;;;;;;;;;;;;;
;;   programming   ;;
;;;;;;;;;;;;;;;;;;;;;

(load-user-files-per-system "programming"
							'("c#"
							  "ahk"
							  "powershell"
							  "css")

							'("godot"
							  "python/python"
							  "python/anaconda"
							  ;; "python/elpy"
							  "python/highlight-indent-guides"

							  "rust"
							  ;; "guile"
							  "janet"
							  "clojure"
							  "javascript"
							  "typescript"
							  "web-utils"
							  "caddyfile"
							  "yaml"
							  "markdown"
							  "scss"

							  "sql/sql"
							  ;; "sql/pgmacs"
							  ;; "sql/ejc"

							  "c"
							  "nix"
							  "lua"
							  "just"
							  ;; "yuck"
							  ;; "typst"
							  "haskell"
							  ;; "lilypond"
							  "latex"
							  "elisp")

							'())

;; (load-user-file "programming/kbd")
;; (load-user-file "programming/elixir")
;; (load-user-file "programming/common-lisp")
;; (load-user-file "programming/fountain") ;; use with wrap
;; (load-user-file "programming/go")
;; (load-user-file "programming/lisp")
;; (load-user-file "programming/json")
;; (load-user-file "built-in/java-mode")
;; (load-user-file "programming/meghanada")

;; replaced by eglot
;; also maybe get poetry at some point
;; (load-user-file "programming/python/black")
;; (load-user-file "programming/python/isort")
;; (load-user-file "programming/python/pytest") ;; does not work right now

;;;;;;;;;;;;;;;;;;;;;
;;   elpaca-init   ;;
;;;;;;;;;;;;;;;;;;;;;

;; You can add the following to the end of your init file
;; if you must rely on after-init-hook or emacs-startup-hook
;; could be bad but makes startup very fast and solves recentf problem
;; (setq elpaca-after-init-time (current-time)) ;; prevents `elpaca-after-init-hook` from running later.
;; (elpaca-wait)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               LATER                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; most of these packages are ready to use but will need some practice
;; before full integration. I will add one at a time to my configuration

;; (load-user-file "emacs-refactor")
;; (load-user-file "poetry")
;; (load-user-file "purpose")
;; (load-user-file "prism")
;; (load-user-file "polymode")
;; (load-user-file "imenu-list")
;; (load-user-file "dirvish")
;; (load-user-file "bookmark+")
;; (load-user-file "anzu")
;; (load-user-file "unfill")
;; (load-user-file "zzz-to-char")
;; (load-user-file "easy-kill")
;; (load-user-file "deadgrep")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             DISCARDED              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; perso
;; (load-user-file "perso/header") ;; moved to auto-insert
;; (load-user-file "perso/cursor")
;; (load-user-file "perso/countdown-timer") ;; where did it go?
;; (load-user-file "perso/modeline-timer") ;; where did it go?
;; (load-user-file "perso/work-timer")

;; workflow
;; (load-user-file "workflow/company")
;; (load-user-file "workflow/god-mode") ;; pretty good. might give it another chance later or use an hydra...
;; (load-user-file "workflow/projectile") ;; project.el does the job 90% of the time
;; (load-user-file "workflow/bufler") ;; cool but may slow down emacs startup like super-agenda
;; (load-user-file "workflow/lsp-bridge") ;; broken: (missing acm-frame). alt: lspce

;; org
;; (load-user-file "org/org-brain")
;; (load-user-file "org/org-bullets")
;; (load-user-file "org/org-make-toc")
;; (load-user-file "org/org-pomodoro")
;; (load-user-file "org/org-ref") ;; citar is a better alternative
;; (load-user-file "org/org-sidebar")
;; (load-user-file "org/org-super-agenda") ;; very slow startup
;; (load-user-file "org/org-superstar")
;; (load-user-file "org/svg-tag")
;; (load-user-file "org/toc-org")

;; appearance
;; (load-user-file "appearance/solarized")
;; (load-user-file "appearance/poet")
;; (load-user-file "appearance/cascadia")
;; (load-user-file "appearance/fira-code-mode") ;; works a bit too well. remove from latex/org
;; modeline (can also be configured with delighted)
;; (load-user-file "appearance/doom-modeline")
;; (load-user-file "appearance/powerline")
;; (load-user-file "appearance/minimap")
;; (load-user-file "appearance/solaire") ;; few themes support it

;; composite
;; (load-user-file "composite/ivy") ;; => needs prescient, counsel
;; (load-user-file "composite/counsel")
;; (load-user-file "composite/swiper"))
;; (load-user-file "composite/amx")

;; utilities
;; (load-user-file "discarded/utilities/yasnippet") ;; replaced by tempel
;; (load-user-file "utilities/avy")
;; (load-user-file "fix-word")

;; passive-utils
;; "languagetool" ;; service broken on nixos
;; (load-user-file "passive-utils/reformatter")
;; (load-user-file "passive-utils/format-all") ;; great but not easily extendable
;; (load-user-file "utilities/olivetti")
;; (load-user-file "passive-utils/magit-todos") ;; cool but slow startup DONE
;; (load-user-file "utilities/recursion-indicator") ;; interesting but not as useful as minibuffer-depth-indicate-mode
;; (load-user-file "utilities/auto-compile")
;; (load-user-file "utilities/clippy") ;; what a nightmare
;; (load-user-file "passive-utils/indent-bars")

;; (load-user-files "discarded/passive-utils" '("happy-margins"))

;; programming
;; (load-user-file "programming/python/ein")
;; (load-user-file "programming/python/highlight-indentation")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               DEBUG                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; debugging: find missing files
;; (defun load-user-file (file)
;;   "Add FILE to configuration (located in directory: packages)."
;;   (interactive "f")
;;   "Load a file in current user's configuration directory"
;;   ;; if the configuration is not in ~/.emacs.d, use (s-replace OLD NEW S)

;; (setq file-dir (expand-file-name (concat file ".el") "~/.emacs.d/packages/"))
;; (setq file-subdir (expand-file-name (concat file ".el") "~/.emacs.d/packages/later/"))

;; (if (not (file-exists-p file-dir))
;;     (message (concat "Package not found in main dir: " file-dir))))
;; (if (not (file-exists-p file-subdir))
;;   (message (concat "Package not found in sub dir: " file-subdir)))))

;;; straight-package.el ends here
