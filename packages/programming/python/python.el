;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    PROGRAMMING LANGUAGE: PYTHON    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; try elpy and other alternatives

(use-package python
  :straight (:type built-in)
  :general
  (python-mode-map "C-c C-p"
		   '(lambda () (interactive)
		      (run-python (python-shell-calculate-command) nil t)
		      ;; (python-shell-send-buffer nil)
		      (ace-select-window)))
  :config
  ;; (setq python-indent-guess-indent-offset t) ;; already t by default
  (setq python-indent-guess-indent-offset-verbose nil) ;; no error message when guessing indentation
  (setq python-shell-interpreter "python3"))

;; (use-package python
;;   :straight (:type built-in)
;;   :init
;;   (add-to-list 'all-the-icons-icon-alist
;;                '("\\.py$" all-the-icons-alltheicon "python" :height 1.1 :face all-the-icons-dblue))
;;   :custom
;;   (python-shell-interpreter "ipython")
;;   (python-shell-interpreter-args "-i --simple-prompt")
;;   (python-indent-guess-indent-offset-verbose nil)
;;   :bind
;;   ( :map python-mode-map
;;     ("C-c r" . python-indent-shift-right)
;;     ("C-c l" . python-indent-shift-left))
;;   :hook
;;   ;; With pyls:
;;   ;; pip install python-language-server flake8 pyls-black(optional) pyls-isort(optional)
;;   ;; With pyright
;;   ;; sudo npm install -g pyright && pip install flake8 black(optional)
;;   ;; NOTE: these hooks runs in reverse order
;;   (python-mode . (lambda () (setq-local company-prescient-sort-length-enable nil)))
;;   (python-mode . (lambda () (unless (and buffer-file-name (file-in-directory-p buffer-file-name "~/.virtualenvs/"))
;;                               (flycheck-mode))))
;;   ;; (python-mode . lsp-deferred)
;;   ;;(python-mode . (lambda () (fk/add-local-hook 'before-save-hook 'eglot-format-buffer)))
;;   (python-mode . eglot-ensure)
;;   ;; importmagic runs ~100mb ipython process per python file, and it does not
;;   ;; always find imports, 60%-70% maybe. I stop using this, but still want to keep.
;;   ;; (python-mode . importmagic-mode)
;;   (python-mode . fk/activate-pyvenv)
;;   (python-mode . (lambda ()
;;                    (when (and (buffer-file-name)
;;                               (string=
;;                                (car (last (f-split (f-parent (buffer-file-name)))))
;;                                "tests"))
;;                      (fk/hide-second-level-blocks))))
;;   (python-mode . fk/tree-sitter-hl-mode)
;;   (python-mode . (lambda () (setq-local fill-column 88)))
;;   :config
;;   (defvar python-walrus-operator-regexp ":=")

;;   ;; Make walrus operator ":=" more visible
;;   (font-lock-add-keywords
;;    'python-mode
;;    `((,python-walrus-operator-regexp 0 'escape-glyph t))
;;    'set))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    PROGRAMMING LANGUAGE: PYVENV    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; (use-package pyvenv
;;   :after python
;;   :config
;;   ;; I show this in `fk/minibuffer-modeline-update' manually.
;;   (setq pyvenv-mode-line-indicator nil)

;;   (defun fk/get-venv-name ()
;;     "Get venv name of current python project."
;;     (when-let* ((root-dir (projectile-project-root))
;;                 (venv-file (concat root-dir ".venv"))
;;                 (venv-exists (file-exists-p venv-file))
;;                 (venv-name (with-temp-buffer
;;                              (insert-file-contents venv-file)
;;                              (nth 0 (split-string (buffer-string))))))
;;       venv-name))

;;   (defun fk/activate-pyvenv ()
;;     "Activate python environment according to the `project-root/.venv' file."
;;     (interactive)
;;     (when-let ((venv-name (fk/get-venv-name)))
;;       (pyvenv-mode)
;;       (pyvenv-workon venv-name)))

;;   (defun fk/open-venv-dir ()
;;     "Open the directory of installed libraries in `dired'."
;;     (interactive)
;;     (when-let* ((venv-name (fk/get-venv-name))
;;                 (venv-dir (expand-file-name venv-name "~/.virtualenvs")))
;;       (dired (car (directory-files-recursively venv-dir "site-packages" t)))))

;;   ;; python-mode hook is not enough when more than one project's files are open.
;;   ;; It just re-activate pyvenv when a new file is opened, it should re-activate
;;   ;; on buffer or perspective switching too. NOTE: restarting lsp server is
;;   ;; heavy, so it should be done manually if needed.
;;   (add-hook 'window-configuration-change-hook 'fk/activate-pyvenv))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              LSP-PYRIGHT           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package lsp-pyright
;;   :after lsp-mode
;;   :custom
;;   (lsp-pyright-auto-import-completions nil)
;;   (lsp-pyright-typechecking-mode "off")
;;   :config
;;   (fk/async-process
;;    "npm outdated -g | grep pyright | wc -l" nil
;;    (lambda (process output)
;;      (pcase output
;;        ("0\n" (message "Pyright is up to date."))
;;        ("1\n" (message "A pyright update is available."))))))
