;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            SPELL CHECK             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package flymake
  :ensure nil
  :defer t
  :config
  ;; (setq flymake-indicator-type) ;; fringes (default), margins or nil
  (setq flymake-show-diagnostics-at-end-of-line 'short) ;; defaults to nil. use either 'short or t
  :custom-face
  (flymake-end-of-line-diagnostics-face ((t (:height 1.0))))
  :hook
  (prog-mode . flymake-mode)
  (flymake-mode . (lambda () (delete 'elisp-flymake-checkdoc flymake-diagnostic-functions))))

;; spell checking
(use-package flyspell
  :ensure nil
  ;; :straight (:type built-in)
  :defer t
  :diminish flyspell-mode "spell"
  ;; :init
  ;; (progn
  ;;   (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  ;;   (add-hook 'text-mode-hook 'flyspell-mode))
  :hook
  (prog-mode . flyspell-prog-mode)
  (text-mode . flyspell-mode)
  :config
  ;; use aspell instead on ispell (requires aspell installation)
  (if windows-system-p
	  (progn
		(setenv "LANG" "en_GB.UTF-8")
		(setenv "DICPATH" "C:/Hunspell/dictionaries/") ;; dic/aff files
		(setq ispell-program-name "C:/Hunspell/hunspell/bin/hunspell.exe"))
    (setq ispell-program-name "aspell"))

  (setq ispell-choices-win-default-height 10) ;; default too small

  ;; broken in NixOS (sept 2023). temporary fix below:
  ;; echo "dict-dir /run/current-system/sw/lib/aspell" >> ~/.aspell.conf
  (setq ispell-dictionary "en_GB")
  ;; Sets flyspell correction to use two-finger mouse click
  (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word))

;;;;;;;;;;;;;;
;; FLYCHECK ;;
;;;;;;;;;;;;;;

;; ;; syntax checking. alternative to the built in flymake
;; (use-package flycheck
;;   :defer t
;;   :diminish flycheck-mode "check"
;;   :config
;;   (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
;;   :hook emacs-lisp)

;; (setq flycheck-mode-line-prefix "")
;; (setq flycheck-mode-line-color nil)
;; (setq flycheck-mode-success-indicator "0")

;; (setq tabulated-list-format
;; 	  '[("File" 15)
;; 		("Line"
;; 		 5
;; 		 flycheck-error-list-entry-<
;; 		 :right-align t)
;; 		("Col" 3 nil :right-align t)
;; 		("Level"
;; 		 7
;; 		 flycheck-error-list-entry-level-<)
;; 		("ID" 16 t)
;; 		(#("Message (Checker)"
;; 		   0 7 (face
;; 				flycheck-error-list-error-message)
;; 		   9 16 (face
;; 				 flycheck-error-list-checker-name))
;; 		 0
;; 		 t)])
;; (tabulated-list-init-header)

;; ;; MyPy Integration
;; (flycheck-define-checker
;;     python-mypy ""
;;     :command ("mypy"
;; 		"--ignore-missing-imports"
;; 		"--python-version" "3.6"
;; 		source-original)
;;     :error-patterns
;;     ((error line-start (file-name) ":" line ": error:" (message) line-end))
;;     :modes python-mode)

;; (add-to-list 'flycheck-checkers 'python-mypy t)
;; (flycheck-add-next-checker 'python-pylint 'python-mypy t))

;; error with after-load-theme-hook
;; (use-package flycheck-overlay
;;   :defer t
;;   :ensure (flycheck-overlay :type git :host github :repo "konrad1977/flycheck-overlay")
;;   :after flycheck
;;   :config
;;   (setq flycheck-overlay-info-icon "●")
;;   (setq flycheck-overlay-warning-icon "➤")
;;   (setq flycheck-overlay-error-icon "✘")

;;   (setq flycheck-overlay-show-at-eol t)
;;   (setq flycheck-overlay-hide-when-cusor-is-on-same-line t)
;;   (setq flycheck-overlay-hide-checker-name t)
;;   :hook flycheck-mode)

;; broken
;; (use-package flycheck-inline
;;   :defer t
;;   :after flycheck
;;   :hook flycheck-mode)
