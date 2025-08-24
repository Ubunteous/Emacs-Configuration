;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            SPELL CHECK             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; syntax checking
(use-package flycheck
  :defer t
  :diminish flycheck-mode "check"
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  :hook (prog-mode . flycheck-mode))

(use-package flyover
  :ensure (flyover :type git :host github :repo "konrad1977/flyover")
  :defer t
  :config
  (setq flyover-levels '(error warning info))
  (setq flyover-use-theme-colors t)

  ;; VISIBILITY
  ;; (setq flyover-hide-checker-name t)
  (setq flyover-show-at-eol nil)
  ;; (setq flyover-hide-when-cursor-is-on-same-line t)
  ;; (setq flyover-show-virtual-line t)

  ;; ARROW
  (setq flyover-virtual-line-type 'straight-arrow)
  ;; (setq flyover-virtual-line-icon "╰──") ;;; default its nil

  ;; ICON
  ;; (setq flyover-info-icon "🛈")
  ;; (setq flyover-warning-icon "⚠")
  ;; (setq flyover-error-icon "✘")
  ;; (setq flyover-icon-left-padding 0.9)
  ;; (setq flyover-icon-right-padding 0.9)

  ;; (setq flyover-wrap-messages t)
  ;; (setq flyover-max-line-length 80)

  (setq flyover-line-position-offset 0) ;; nb lines below incorrect line
  ;; (setq flyover-debounce-interval 0.2) ;; delay before update's
  ;; (setq flyover-checkers '(flycheck flymake))

  ;; (setq flyover-debug nil)

  ;; (setq flyover-background-lightness 45)
  ;; (setq flyover-percent-darker 40)
  ;; (setq flyover-text-tint 'lighter) ;; or 'darker or nil
  ;; (setq flyover-text-tint-percent 50)
  :hook flycheck-mode)

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

(use-package flyspell-correct
  :after flyspell
  :general
  :general (:keymaps 'flyspell-mode-map
					 ;; shadows ispell-word
					 ;; it can show options as a drop down list with popup package
					 "M-$" 'flyspell-correct-wrapper))

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
