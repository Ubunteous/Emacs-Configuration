;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            COMPILE-ANGEL           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; improvement over package-recompile-all
(use-package compile-angel
  :ensure t
  :demand t
  :config
  ;; (setq compile-angel-verbose t)

  ;; Uncomment the line below to compile automatically when an Elisp file is saved
  ;; (add-hook 'emacs-lisp-mode-hook #'compile-angel-on-save-local-mode)

  ;; The following directive prevents compile-angel from compiling your init
  ;; files. If you choose to remove this push to `compile-angel-excluded-files'
  ;; and compile your pre/post-init files, ensure you understand the
  ;; implications and thoroughly test your code. For example, if you're using
  ;; the `use-package' macro, you'll need to explicitly add:
  ;; (eval-when-compile (require 'use-package))
  ;; at the top of your init file.
  (push "/init.el" compile-angel-excluded-files)
  (push "/early-init.el" compile-angel-excluded-files)

  ;; Ensure Emacs loads the most recent byte-compiled files.
  (setq load-prefer-newer t)

  ;; Make Emacs Native-compile .elc files asynchronously by setting
  ;; `native-comp-jit-compilation' to t.
  ;; (setq native-comp-jit-compilation t) ; Default
  ;; (setq native-comp-deferred-compilation native-comp-jit-compilation)  ; Deprecated

  ;; Ensure that quitting only occurs once Emacs finishes native compiling,
  ;; preventing incomplete or leftover compilation files in `/tmp`.
  (setq native-comp-async-query-on-exit t)
  (setq confirm-kill-processes t)

  ;; Non-nil means to native compile packages as part of their installation.
  (setq package-native-compile t)

  ;; -------------------------------------------------
  ;; Show buffer when there is a warning.
  ;; (NOT RECOMMENDED, except during development).
  ;; -------------------------------------------------
  ;; (setq compile-angel-verbose t)
  ;; (setq compile-angel-byte-compile-report-issues t)
  ;;
  ;; (setq warning-minimum-level :warning)
  ;; (setq byte-compile-verbose t)
  ;; (setq byte-compile-warnings t)
  ;; (setq native-comp-async-report-warnings-errors t)
  ;; (setq native-comp-warning-on-missing-source t)

  ;; Exclude the custom-file, recentf, and savehist files
  ;;
  ;; Ensure that compile-angel is loaded using `require`, `use-package`, or
  ;; another package manager, as compile-angel-excluded-files is declared after
  ;; the package is loaded.

  ;;;;;;;;;;;;;;;;;;
  ;; IGNORE FILES ;;
  ;;;;;;;;;;;;;;;;;;
  
  ;; Ensure that the value of `savehist-file` is updated before proceeding
  (with-eval-after-load "savehist"
	(push (concat "/" (file-name-nondirectory savehist-file))
          compile-angel-excluded-files))

  ;; Ensure that the value of `recentf-save-file` is updated before proceeding
  (with-eval-after-load "recentf"
	(push (concat "/" (file-name-nondirectory recentf-save-file))
          compile-angel-excluded-files))

  ;; Ensure that the value of `custom-file` is updated before proceeding
  (with-eval-after-load "cus-edit"
	(when (stringp custom-file)
      (push (concat "/" (file-name-nondirectory custom-file))
			compile-angel-excluded-files)))

  ;; A global mode that compiles .el files before they are loaded using `load' or `require'
  (compile-angel-on-load-mode 1)

  ;; Emacs often skips the compilation of certain Elisp files. To verify this:
  ;; Install compile-angel,
  ;; Enable verbose mode: (setq compile-angel-verbose t)
  ;; Enable the mode: (compile-angel-on-load-mode)
  ;; Enable both byte compilation and native compilation (default)
  (setq compile-angel-enable-byte-compile t)
  (setq compile-angel-enable-native-compile t))
