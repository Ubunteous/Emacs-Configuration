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
(load-user-file "built-in/auto-insert")
(load-user-file "built-in/completion")
(load-user-file "built-in/dired") ;; => add git compatibility later
(load-user-file "built-in/fly")
(load-user-file "built-in/hide-show") ;; not perfect but already serviceable
(load-user-file "built-in/ibuffer")
(load-user-file "built-in/misc")
(load-user-file "built-in/recentf")
(load-user-file "built-in/repeat")
(load-user-file "built-in/smtpmail")

;; (load-user-file "built-in/java-mode")
;; (load-user-file "built-in/isearch")
;; (load-user-file "built-in/newsticker") ;; alt: see elfeed

;;;;;;;;;;;;;;;;;;;;;;;;
;;   built-in (soon)  ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; (load-user-file "built-in/tree-sitter") ;; => emacs 29
;; use-package will come in emacs 29 as well
;; (load-user-file "built-in/eglot") ;; => emacs 29

;; Alternatives:
;; (load-user-file "workflow/lsp-mode")
;; (load-user-file "workflow/realgud")

;;;;;;;;;;;;;;;
;;   perso   ;;
;;;;;;;;;;;;;;;

(load-user-file "perso/calendar") ;; year-calendar function
(load-user-file "perso/align")
(load-user-file "perso/header")
;; (load-user-file "perso/break-time")
;; (load-user-file "perso/cursor-color") ;; cool but I still do not know why I made it
;; (breaktime-start (* 22 60)) ;; 22 minutes

;;;;;;;;;;;;;;;;;;
;;   workflow   ;;
;;;;;;;;;;;;;;;;;;

(load-user-file "workflow/ace-window") ;; add rotate/transpose frame
(load-user-file "workflow/forge")
(load-user-file "workflow/magit")
(load-user-file "workflow/mu4e") ;; requires mu package from outside emacs and must be installed from Nix rather than straight
(load-user-file "workflow/perspective")

;; (load-user-file "workflow/elfeed") ;; alt: newsticker built-in
;; (load-user-file "workflow/hydra")
;; (load-user-file "workflow/mu4e-alert") ;; slightly slow startup. maybe use a hook
;; (load-user-file "workflow/notmuch") ;; requires notmuch package from outside emacs
;; (load-user-file "workflow/vterm") ;; vterm should be installed from NixOS configuration

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
(load-user-file "org/org-roam")
(load-user-file "org/org-roam-ui")
(load-user-file "org/delve")

;; (load-user-file "org/org-ql") ;; check git documentation
;; (load-user-file "org/org-transclusion")

;; (load-user-file "org/deft")
;; (load-user-file "org/notdeft")

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

(load-user-file "composite/cape") ;; surprisingly useful!
(load-user-file "composite/citar")
(load-user-file "composite/consult")
(load-user-file "composite/corfu")
(load-user-file "composite/embark") ;; use it with consult
(load-user-file "composite/marginalia")
(load-user-file "composite/orderless")
(load-user-file "composite/prescient") ;; alternative to orderless
(load-user-file "composite/tempel")
(load-user-file "composite/vertico")

(load-user-file "composite/minimal-swiper")

;;;;;;;;;;;;;;;;;;;
;;   utilities   ;;
;;;;;;;;;;;;;;;;;;;

(load-user-file "utilities/crux")
(load-user-file "utilities/devdocs")
(load-user-file "utilities/evil-nerd-commenter")
(load-user-file "utilities/expand-region")
(load-user-file "utilities/helpful")
(load-user-file "utilities/iedit") ;; => multi-occur edit. Note: occur-mode e can already edit occur-mode buffer
(load-user-file "utilities/minions")
(load-user-file "utilities/move-text")
(load-user-file "utilities/multiple-cursors")
(load-user-file "utilities/visual-regexp")
(load-user-file "utilities/vundo")
(load-user-file "utilities/which-key")
(load-user-file "utilities/writeroom")

;; (load-user-file "utilities/dumb-jump") ;; very cool but xref is broken in python
;; (load-user-file "utilities/esup")

;; (load-user-file "utilities/quickrun")
;; (load-user-file "utilities/wgrep")

;;;;;;;;;;;;;;;;;;;;;;;
;;   passive-utils   ;;
;;;;;;;;;;;;;;;;;;;;;;;

(load-user-file "passive-utils/rainbow") ;; maybe already built-in (with css mode)
(load-user-file "passive-utils/adaptive-wrap")
(load-user-file "passive-utils/aggressive-indent")
(load-user-file "passive-utils/auto-capitalize") ;; => LaTeX mode only
(load-user-file "passive-utils/beacon")
(load-user-file "passive-utils/browse-kill-ring")
(load-user-file "passive-utils/diminish")
(load-user-file "passive-utils/dimmer") ;; DONE
(load-user-file "passive-utils/hl-todo")
(load-user-file "passive-utils/no-littering")
(load-user-file "passive-utils/undo-hl") ;; => not in melpa yet
;; (load-user-file "passive-utils/diff-hl") ;; not essential but fun

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

(load-user-file "programming/kbd")
;; (load-user-file "programming/clojure")
;; (load-user-file "programming/fountain") ;; use with wrap
(load-user-file "programming/haskell")
;; (load-user-file "programming/json")
(load-user-file "programming/latex")
;; (load-user-file "programming/lisp")
;; (load-user-file "programming/meghanada")
(load-user-file "programming/nix")
(load-user-file "programming/yuck")

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
;; (load-user-file "transient") => I dislike them but they are useful
;; (load-user-file "dirvish")
;; (load-user-file "bookmark+")
;; (load-user-file "anzu")
;; (load-user-file "fix-word")
;; (load-user-file "unfill")
;; (load-user-file "zzz-to-char")
;; (load-user-file "easy-kill")
;; (load-user-file "deadgrep")
;; (load-user-file "symbol-overlay")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             DISCARDED              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; perso
;; (load-user-file "perso/cursor")
;; (load-user-file "perso/countdown-timer") ;; where did it go?
;; (load-user-file "perso/modeline-timer") ;; where did it go?
;; (load-user-file "perso/work-timer")

;; workflow
;; (load-user-file "workflow/god-mode") ;; pretty good. might give it another chance later or use an hydra...
;; (load-user-file "workflow/projectile") ;; project.el does the job 90% of the time
;; (load-user-file "workflow/bufler") ;; cool but may slow down emacs startup like super-agenda
;; (load-user-file "workflow/lsp-bridge") ;; broken as I cannot install it without acm-frame which is missing

;; org
;; (load-user-file "org/org-brain")
;; (load-user-file "org/org-bullets")
;; (load-user-file "org/org-contrib")
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
;; (load-user-file "composite/company")
;; (load-user-file "composite/amx")

;; utilities
;; (load-user-file "utilities/yasnippet") ;; replaced by tempel
;; (load-user-file "utilities/avy")

;; passive-utils
;; (load-user-file "utilities/auto-compile")
;; (load-user-file "utilities/clippy") ;; what a nightmare
;; (load-user-file "passive-utils/magit-todos") ;; cool but slow startup DONE
;; (load-user-file "utilities/olivetti")
;; (load-user-file "utilities/recursion-indicator") ;; interesting but not as useful as minibuffer-depth-indicate-mode
;; (load-user-file "utilities/smartparens")

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
