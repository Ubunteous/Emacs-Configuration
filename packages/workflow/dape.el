;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                DAPE                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package jsonrpc
  ;; temporary fork
  :defer t
  :elpaca (jsonrpc :type git :host github :repo "svaante/jsonrpc"))

(use-package dape
  :defer t
  :after jsonrpc
  :elpaca (dape :type git :host github :repo "svaante/dape")
  
  ;; To use window configuration like gud (gdb-mi)
  ;; :init
  ;; (setq dape-buffer-window-arrangement 'gud)

  :config
  ;; Info buffers to the right
  (setq dape-buffer-window-arrangement 'right)

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
  )
