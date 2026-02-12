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
  ;; (setq window-sides-vertical t)

  ;; Info buffers to the right
  (setq dape-buffer-window-arrangement 'right)

  ;; CHECK
  ;; (setq dape-key-prefix "\C-x\C-a") ;; overrides gdb
  (setq dape-many-windows nil) ;; simpler layout
  (setq dape-info-stack-buffer-modules t) ;; show module info in stack buffer
  (setq dape-start-hook '(dape-repl))

  ;; (remove-hook 'dape-start-hook 'dape-repl)
  ;; (add-hook 'dape-compile-hook 'kill-buffer) ;; kill compile buffer on build success
  ;; (add-hook 'dape-start-hook (defun dape--save-on-start () (save-some-buffers t t))) ;; save on startup

  ;; PATHS
  ;; (setq dape-cwd-function 'dape--default-cwd)
  ;; (setq dape-adapter-dir "~/files/dape/adapters/")
  ;; (setq dape-default-breakpoints-file "~/.emacs.d/files/dape/breakpoints.eld")

  ;; HINTS
  ;; (setq dape-inlay-hints t)
  ;; (setq dape-minibuffer-hint nil)
  ;; (setq dape-info-hide-mode-line nil)
  ;; (setq dape-debug t) ;; debug log. slower
  ;; (dape-debug t) ;; add debug info to repl/event buffer
  ;; (setq dape-info-stack-buffer-addresses nil) ;; Show frame addresses in stack buffer
  ;; (setq dape-info-thread-buffer-addresses t) ;; Show addresses for thread frames in threads buffer

  ;; RUN
  ;; (setq dape-repl-commands '(...))
  ;; (setq dape-stack-trace-levels 20)
  ;; (setq dape-compile-function 'compile)

  ;; APPEARANCE
  ;; (setq dape-breakpoint-margin-string "B")
  ;; (setq dape-info-variable-table-aligned t)
  ;; (setq dape-buffer-window-arrangement 'right) ;; left, right or gud
  ;; (setq dape-display-source-buffer-action
  ;; 		'((display-buffer-reuse-window
  ;; 		   display-buffer-same-window
  ;; 		   display-buffer-use-some-window)))

  ;; MISC
  ;; (setq dape-request-timeout 10)
  ;; (setq dape-ui-debounce-time 0.1) ;; revert buffer
  ;; (setq dape-repl-use-shorthand nil) ;; use first char of command
  ;; (setq dape-default-config-functions '(dape-config-autoport dape-config-tramp))

  (add-to-list 'display-buffer-alist
			   `((derived-mode . dape-repl-mode)
				 (display-buffer-reuse-mode-window
				  display-buffer-in-direction)
				 (mode dape-repl-mode)
				 (window . root)
				 (window-width . 0.4)
				 (direction . right)))

  (add-to-list 'display-buffer-alist
               '("\\`\\*\\dape-info .*\\*\\'"
				 (display-buffer-reuse-mode-window
				  display-buffer-in-direction)
				 (window-width . 0.4)))

  (setq dape-configs
		`(
		  ;; (godot
		  ;;  modes (gdscript-mode)
		  ;;  port 6006
		  ;;  :request "launch"
		  ;;  :type "server")

		  ,@(let ((js-debug
				   `( ensure ,(lambda (config)
								(dape-ensure-command config)
								(when-let* ((runtime-executable
											 (dape-config-get config :runtimeExecutable)))
								  (dape--ensure-executable runtime-executable))

								;; (let ((dap-debug-server-path
								;; 	   (car (plist-get config 'command-args))))
								;;   (unless (file-exists-p dap-debug-server-path)
								;; 	(user-error "File %S does not exist" dap-debug-server-path)))

								(unless (commandp "js-debug")
								  (user-error "Command js-debug unavailable on system"))
								
								)
					  command "node"

					  command-args (,(with-temp-buffer
									   (insert-file-contents "/etc/profiles/per-user/nix/bin/js-debug")
									   (nth 5 (split-string (buffer-string))))
									:autoport)
					  port :autoport)))

			  `((js-debug-node
				 modes (js-mode js-ts-mode typescript-mode typescript-ts-mode)
				 ,@js-debug

				 ;; common
				 :type "pwa-node" ;; besides chrome
				 :console "internalConsole" ;; besides attach/chrome
				 :cwd dape-cwd ;; besides attach/chrome
				 :program dape-buffer-default ;; besides attach/chrome

				 ;; ;; debug ts node/bun/tsx
				 ;; :runtimeExecutable "ts-node"
				 ;; :runtimeExecutable "bun"
				 ;; :runtimeExecutable "tsx"

				 ;; ;; debug node attach
				 ;; :request "attach"
				 ;; :port 9229

				 ;; ;; debug chrome
				 ;; :type "pwa-chrome"
				 ;; :url "http://localhost:3000"
				 ;; :webRoot dape-cwd
				 )))))

  (transient-define-prefix dape-transient ()
	["Dape"
	 ["Run"
	  ("d" "Start" dape)
	  ("p" "Pause" dape-pause)
	  ("c" "Resume" dape-continue)
	  ("q" "Terminate" dape-quit)
	  ("f" "Restart frame" dape-restart-frame)
	  ("r" "Restart" dape-restart)
	  ("k" "Kill session" dape-kill) ;; no binding
	  ("D" "Kill adapter" dape-disconnect-quit)
	  ]
	 
	 ["Step"
	  ("n" "Next line" dape-next)
	  ("u" "Run until" dape-until)
	  ("s" "Step in" dape-step-in)
	  ("o" "Step out" dape-step-out)
	  ]
	 
	 ["Breakpoint"
	  ("b" "Toggle" dape-breakpoint-toggle)
	  ("e" "Expression" dape-breakpoint-expression)
	  ("h" "Condition" dape-breakpoint-hits)
	  ("l" "Log" dape-breakpoint-log)
	  ("B" "Remove all" dape-breakpoint-remove-all)
	  ]

	 ["Expression"
	  ("R" "REPL" dape-repl)
	  ("w" "Watch" dape-watch-dwim)
	  ("x" "Evaluate" dape-evaluate-expression)
	  ]

	 ["Info"
	  ("i" "Dape info" dape-info)

	  ("t" "Current thread" dape-select-thread)

	  ("S" "Active stack" dape-select-stack)
	  (">" "Select stacks below" dape-stack-select-down)
	  ("<" "Select stacks above" dape-stack-select-up)

	  ("m" "Edit memory hexdump" dape-memory)
	  ("M" "Disassemble" dape-disassemble)
	  ]

	 ["Custom"
	  ("N" "Next breakpoint" dape-breakpoint-goto-next)
	  ("P" "Prev breakpoint" dape-breakpoint-goto-prev)
	  ("=" "Save breakpoints" dape-breakpoint-save)
	  ("S-=" "Save breakpoints" dape-breakpoint-load)
	  ]
	 ]
	)

  (defun dape--breakpoints-get-pos ()
	;; Returns a list of unsorted breakpoints within the current buffer
	(mapcar 'overlay-start
			(mapcar 'dape--breakpoint-location
					(dape--breakpoints-in-buffer))))

  (defun dape--breakpoint-goto (direction)
	;; DIRECTION positive for next breakpoint, negative for previous
	(let* ((breakpoints-pos (dape--breakpoints-get-pos))
		   (abovep (cl-minusp direction))
		   (belowp (cl-plusp direction))
		   (next-pos (when breakpoints-pos
					   (cond (belowp
							  (seq-find '(lambda (bp) (> bp (point)))
										(sort breakpoints-pos '<)))
							 (abovep
							  (seq-find '(lambda (bp) (< bp (point)))
										(sort breakpoints-pos '>)))
							 (t nil)))))
	  (if breakpoints-pos
		  (if next-pos
			  (goto-char next-pos)
			;; behaviour below could be tweaked to loop back to first/last bp
			(message (concat "No more breakpoint " (cond (belowp "below")
														 (abovep "above")
														 (t nil)))))
		(message "No breakpoint found in this file"))))

  (defun dape-breakpoint-goto-prev ()
	;; Go to the previous breakpoint in the current buffer
	(interactive)
	(dape--breakpoint-goto -1))

  (defun dape-breakpoint-goto-next ()
	;; Go to the next breakpoint in the current buffer
	(interactive)
	(dape--breakpoint-goto 1))

  (defun dape-repl-help ()
   	;; Show dape-repl welcome message with available commands
   	(insert
   	 (format "
* Welcome to the Dape REPL *

Available Dape commands:
%s

Any other input or input starting with a space is sent directly to the
debugger.  An empty line will repeat the last command.\n\n"
   			 (with-temp-buffer
   			   (insert  "  "
   						(mapconcat (pcase-lambda (`(,str . ,command))
   									 (setq str (concat str))
   									 (when dape-repl-use-shorthand
   									   (set-text-properties
   										0 (thread-last (dape--repl-shorthand-alist)
   													   (rassoc command)
   													   (car)
   													   (length))
   										'(font-lock-face help-key-binding)
   										str))
   									 str)
   								   dape-repl-commands
   								   ", "))

   			   (let ((fill-column 72)
   					 (adaptive-fill-mode t))
   				 (fill-region (point-min) (point-max)))
   			   (buffer-string))))

    (set-marker (process-mark (get-buffer-process (current-buffer))) (point))
    (comint-output-filter (get-buffer-process (current-buffer))
                          dape--repl-prompt))

  (defun dape-repl-eval (&rest expression)
	"Evaluate EXPRESSION in REPL buffer."
	(dape-evaluate-expression (dape--live-connection 'last)
                              (string-join expression " ")
                              "watch"))

  (defun dape-repl-js-entries (&rest expression)
	(dape-evaluate-expression
	 (dape--live-connection 'last)
	 (concat
	  "console.log('');"
	  "function displayObject(obj, indent = 0) {
         for (const [key, value] of Object.entries(obj)) {
           const prefix = ' '.repeat(indent * 2) + (indent > 0 ? '> ' : '');
           if (typeof value === 'object' && value !== null) {
             console.log(`${prefix}${key}:`);
             displayObject(value, indent + 1);
           } else {
             console.log(`${prefix}${key}: ${value}`);
           }
         }
       }"
	  "displayObject(" (string-join expression " ") ");"
	  "console.log('');"))
	"watch")

  (mapcar (lambda (pair) (add-to-list 'dape-repl-commands pair))
		  '(("js-entries" . dape-repl-js-entries)
			("fresh (clear)" . comint-clear-buffer)
			("help" . dape-repl-help)))
  :custom-face
  (dape-breakpoint-face ((t (:foreground "#f82570" :height 2))))
  (dape-inlay-hint-face ((t (:height 2))))
  :general (:keymaps 'dape-global-map
					 "H" 'dape-transient
					 "N" 'dape-breakpoint-goto-next
					 "P" 'dape-breakpoint-goto-prev)
  ;; :hook
  ;; (kill-emacs . dape-breakpoint-save)
  ;; (after-init . dape-breakpoint-load)
  )
