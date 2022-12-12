;;; straight-package --- Summary
;;; Code:
;;; Commentary:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;           LOAD USER FILES          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun load-user-file (file)
  "Add FILE to configuration (located in directory: packages)."
  (interactive "f")
  "Load a file from the packages ~/.emacs/directory"
  (load-file (expand-file-name (concat file ".el") (concat "~/.emacs.d/packages/"))))

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

;; Almost ready. alt to swiper and consult-line
;; (load-user-file "built-in/isearch")

(load-user-file "built-in/align")
(load-user-file "built-in/ibuffer")
(load-user-file "built-in/repeat")
(load-user-file "built-in/recentf")
(load-user-file "built-in/fly")
(load-user-file "built-in/misc")
(load-user-file "built-in/dired") ;; => add git compatibility later
(load-user-file "built-in/auto-insert")
(load-user-file "built-in/completion")

;;;;;;;;;;;;;;;;;;;;;;;;
;;   built-in (soon)  ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; (load-user-file "built-in/tree-sitter") ;; => emacs 29
;; (load-user-file "built-in/eglot") ;; => emacs 29

;;;;;;;;;;;;;;;
;;   perso   ;;
;;;;;;;;;;;;;;;

(load-user-file "perso/header")
(load-user-file "perso/break-time")
(breaktime-start (* 22 60)) ;; 22 minutes

;;;;;;;;;;;;;;;;;;
;;   workflow   ;;
;;;;;;;;;;;;;;;;;;

(load-user-file "workflow/magit")
;; use project.el instead if it can use .git instead of .vc
(load-user-file "workflow/ace-window") ;; add rotate/transpose frame
;; (load-user-file "workflow/vterm") ;; vterm should be installed from NixOS configuration
(load-user-file "workflow/perspective")

;; Prepare
;; (load-user-file "workflow/forge")
;; (load-user-file "workflow/hydra")
;; (load-user-file "lsp-mode")
;; (load-user-file "workflow/realgud")

;;;;;;;;;;;;;
;;   org   ;;
;;;;;;;;;;;;;

(load-user-file "org/org")
(load-user-file "org/jupyter") ;;convert org -> ipynb with ox-ipynb
(load-user-file "org/org-modern")
(load-user-file "org/org-fragtog")
(load-user-file "org/org-cliplink")
(load-user-file "org/org-fancy-priorities")

;; Ready
;; (load-user-file "org/org-download")
;; (load-user-file "org/ob-async")

;; zettelkasten
(load-user-file "org/org-roam") ;; roam timestamps package? / roam-ui
;; (load-user-file "org/org-ql") ;; check git documentation
;; (load-user-file "org/org-transclusion")

;; Not essential (will likely be discarded, except (zettel)deft?)
;; (load-user-file "org/deft")
;; (load-user-file "org/org-brain")
;; (load-user-file "org/org-make-toc")
;; (load-user-file "org/org-sidebar")
;; (load-user-file "org/toc-org")

;; discarded as it slows down startup by .15-0.75s
;; (load-user-file "org/org-super-agenda") ;; very slow startup

;;;;;;;;;;;;;;;;;;;;
;;   appearance   ;;
;;;;;;;;;;;;;;;;;;;;

(load-user-file "appearance/monokaolin")
(load-user-file "appearance/all-the-icons")
(load-user-file "appearance/dashboard")
(load-user-file "appearance/centaur-tabs")
(load-user-file "appearance/fira")
(load-user-file "appearance/moody")
(load-user-file "appearance/kind-icon")

;;;;;;;;;;;;;;;;;;;
;;   composite   ;;
;;;;;;;;;;;;;;;;;;;

(load-user-file "composite/tempel")
(load-user-file "composite/orderless")
(load-user-file "composite/vertico")
(load-user-file "composite/prescient") ;; alternative to orderless
(load-user-file "composite/embark") ;; use it with consult
(load-user-file "composite/consult")
(load-user-file "composite/citar")
(load-user-file "composite/marginalia")
(load-user-file "composite/corfu")
(load-user-file "composite/cape") ;; surprisingly useful!

(load-user-file "composite/minimal-swiper")

;;;;;;;;;;;;;;;;;;;
;;   utilities   ;;
;;;;;;;;;;;;;;;;;;;

;; sort later with column 1 = new commands (actives) 2: mix 3: passives
;; (load-user-file "utilities/devdocs")
;; (load-user-file "utilities/quickrun")
(load-user-file "utilities/evil-nerd-commenter")
(load-user-file "utilities/crux")
(load-user-file "utilities/visual-regexp")
(load-user-file "utilities/browse-kill-ring")
(load-user-file "utilities/expand-region")

(load-user-file "utilities/move-text")
(load-user-file "utilities/aggressive-indent")
(load-user-file "utilities/vundo")
(load-user-file "utilities/minions")

(load-user-file "utilities/writeroom")
(load-user-file "utilities/helpful")
(load-user-file "utilities/adaptive-wrap")
(load-user-file "utilities/auto-capitalize") ;; => LaTeX mode only
(load-user-file "utilities/undo-hl") ;; => not in melpa yet
(load-user-file "utilities/no-littering")
(load-user-file "utilities/beacon")
(load-user-file "utilities/diminish")
(load-user-file "utilities/hl-todo")
(load-user-file "utilities/dimmer")

;; (load-user-file "utilities/wgrep")

;; Ready
;; (load-user-file "utilities/esup")

;;;;;;;;;;;;;;;;;;;;;
;;   programming   ;;
;;;;;;;;;;;;;;;;;;;;;

;; Python
(load-user-file "programming/python/python")
(load-user-file "programming/python/anaconda")
(load-user-file "programming/python/highlight-indent-guides")

;; (load-user-file "programming/python/pytest") ;; does not work right now

;; Ready
;; Note: get poetry at some point
(load-user-file "programming/python/black")
;; (load-user-file "programming/python/isort")

(load-user-file "programming/nix")
(load-user-file "programming/haskell")
(load-user-file "programming/latex")
;; (load-user-file "programming/json")
;; (load-user-file "programming/lisp")
;; (load-user-file "programming/yuck")
;; (load-user-file "programming/fountain") ;; use with wrap

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               LATER                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; most of these packages are ready to use but will need some practice
;; before full integration. I will add one at a time to my configuration

;; (load-user-file "emacs-refactor")
;; (load-user-file "poetry")
;; (load-user-file "dumb-jump")
;; (load-user-file "which-key")
;; (load-user-file "purpose")
;; (load-user-file "prism")
;; (load-user-file "polymode")
;; (load-user-file "iedit") ;; => multi-occur edit
;; (load-user-file "imenu-list")
;; (load-user-file "transient") => I dislike them
;; (load-user-file "dirvish")
;; (load-user-file "bookmark+")
;; (load-user-file "anzu")
;; (load-user-file "fix-word")
;; (load-user-file "multiple-cursors")
;; (load-user-file "unfill")
;; (load-user-file "zzz-to-char")
;; (load-user-file "easy-kill")
;; (load-user-file "deadgrep")
;; (load-user-file "symbol-overlay")
;; (load-user-file "bufler") ;; useful: can move to buffer in same group

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             DISCARDED              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; perso
;; (load-user-file "perso/work-timer")
;; (load-user-file "perso/modeline-timer") ;; where did it go?
;; (load-user-file "perso/countdown-timer") ;; where did it go?

;; workflow
;; (load-user-file "workflow/god-mode")
;; (load-user-file "workflow/projectile") ;; project.el does the job 90% of the time

;; org
;; (load-user-file "org/org-bullets")
;; (load-user-file "org/org-superstar")
;; (load-user-file "org/svg-tag")
;; (load-user-file "org/org-pomodoro")
;; (load-user-file "org/org-ref") ;; citar is a better alternative

;; appearance
;; (load-user-file "appearance/solarized")
;; (load-user-file "appearance/poet")
;; (load-user-file "appearance/cascadia")
;; (load-user-file "appearance/fira-code-mode") ;; works a bit too well. remove from latex/org
;; modeline (can also be configured with delighted)
;; (load-user-file "appearance/doom-modeline")
;; (load-user-file "appearance/powerline")
;; (load-user-file "appearance/minimap")

;; composite
;; (load-user-file "composite/ivy") ;; => needs prescient, counsel
;; (load-user-file "composite/counsel")
;; (load-user-file "composite/swiper"))
;; (load-user-file "composite/company")
;; (load-user-file "composite/amx")

;; utilities
;; (load-user-file "utilities/olivetti")
;; (load-user-file "utilities/auto-compile")
;; (load-user-file "utilities/recursion-indicator") ;; interesting but not as useful as minibuffer-depth-indicate-mode
;; (load-user-file "utilities/clippy") ;; what a nightmare
;; (load-user-file "utilities/yasnippet") ;; replaced by tempel
;; (load-user-file "utilities/avy")

;; programming
;; (load-user-file "programming/python/ein")
;; (load-user-file "programming/kbd")
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
