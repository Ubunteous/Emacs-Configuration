;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                DAPE                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package jsonrpc
;;   ;; temporary fork
;;   :defer t
;;   :ensure (jsonrpc :type git :host github :repo "svaante/jsonrpc"))

(use-package dape
  :defer t
  ;; :after jsonrpc
  :ensure (dape :type git :host github :repo "svaante/dape")
  ;; :init
  ;; To use window configuration like gud (gdb-mi)
  ;; (setq dape-buffer-window-arrangement 'gud)
  :config
  ;; Info buffers to the right
  (setq dape-buffer-window-arrangement 'right)

  ;; (setq dape-debug t) ;; debug log. adds delay
  ;; (setq dape-many-windows nil) ;; simpler layout

  ;; (setq dape-minibuffer-hint nil)
  ;; (setq dape-repl-use-shorthand nil) ;; use first char of command
  ;; (setq dape-key-prefix "\30\1") ;; C-a
  ;; (setq dape-cwd-function 'dape--default-cwd)
  ;; (setq dape-info-hide-mode-line nil)
  ;; (setq dape-default-breakpoints-file "~/.emacs.d/files/dape/breakpoints.eld")
  ;; (setq dape-default-config-functions '(dape-config-autoport dape-config-tramp))
  ;; (dape-debug t) ;; add debug info to repl/event buffer
  ;; (setq dape-adapter-dir "~/files/dape/adapters/")
  ;; (setq dape-inlay-hints t)
  ;; (setq dape-repl-commands '(...))
  ;; (setq dape-request-timeout 10)
  ;; (setq dape-compile-function 'compile)
  ;; (setq dape-ui-debounce-time 0.1) ;; revert buffer
  ;; (setq dape-stack-trace-levels 20)
  ;; (setq dape-breakpoint-margin-string "B")
  ;; (setq dape-buffer-window-arrangement 'right) ;; left, right or gud
  ;; (setq dape-info-stack-buffer-modules t) ;; show module info in stack buffer
  ;; (setq dape-info-stack-buffer-addresses nil) ;; Show frame addresses in stack buffer
  ;; (setq dape-info-variable-table-aligned t)
  ;; (setq dape-info-thread-buffer-addresses t) ;; Show addresses for thread frames in threads buffer
  ;; (setq dape-display-source-buffer-action '((display-buffer-reuse-window display-buffer-same-window
  ;; 																		 display-buffer-use-some-window)))
  
  ;; To not display info and/or buffers on startup
  ;; (remove-hook 'dape-on-start-hooks 'dape-info)
  ;; (remove-hook 'dape-on-start-hooks 'dape-repl)

  ;; To display info and/or repl buffers on stopped
  ;; (add-hook 'dape-on-stopped-hooks 'dape-info)
  ;; (add-hook 'dape-on-stopped-hooks 'dape-repl)

  ;; By default dape uses gdb keybinding prefix
  ;; If you do not want to use any prefix, set it to nil.
  ;; (setq dape-key-prefix "\C-x\C-a")

  ;; Kill compile buffer on build success
  ;; (add-hook 'dape-compile-compile-hooks 'kill-buffer)

  ;; Save buffers on startup, useful for interpreted languages
  ;; (add-hook 'dape-on-start-hooks
  ;;           (defun dape--save-on-start ()
  ;;             (save-some-buffers t t)))

  ;; Projectile users
  ;; (setq dape-cwd-fn 'projectile-project-root)

  ;; (add-to-list 'dape-configs
  ;;              `(debugpy
  ;;                modes (python-ts-mode python-mode)
  ;;                command "python"
  ;;                command-args ("-m" "debugpy.adapter")
  ;;                :type "python"
  ;;                :request "launch"
  ;;                :cwd dape-cwd-fn))

  ;; requires debugpy.listen in code
  ;; (add-to-list 'dape-configs
  ;; 	       '(debugpy-attach-port
  ;; 		 modes (python-mode python-ts-mode)
  ;; 		 port (lambda () (read-number "Port: "))
  ;; 		 :request "attach"
  ;; 		 :type "python"
  ;; 		 :justMyCode nil
  ;; 		 :showReturnValue t))
  :custom-face
  (dape-inlay-hint-face ((t (:height 1.2)))))
