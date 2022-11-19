;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            SPELL CHECK             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; syntax checking
(use-package flycheck
  :defer t
  :diminish flycheck-mode "check"
  :hook (prog-mode . flycheck-mode))

;; spell checking
(use-package flyspell
  :straight (:type built-in)
  :defer t
  :diminish flyspell-mode "spell"
  :init
  (progn
    (add-hook 'prog-mode-hook 'flyspell-prog-mode)
    (add-hook 'text-mode-hook 'flyspell-mode))
  :config
  ;; use aspell instead on ispell (requires aspell installation)
  (setq ispell-program-name "aspell")
  ;; Sets flyspell correction to use two-finger mouse click
  (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)

  ;; MyPy Integration
  (flycheck-define-checker
      python-mypy ""
      :command ("mypy"
		"--ignore-missing-imports"
		"--python-version" "3.6"
		source-original)
      :error-patterns
      ((error line-start (file-name) ":" line ": error:" (message) line-end))
      :modes python-mode)

  (add-to-list 'flycheck-checkers 'python-mypy t)
  (flycheck-add-next-checker 'python-pylint 'python-mypy t))
