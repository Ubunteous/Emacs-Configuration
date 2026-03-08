;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               WINDOWS              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package windows
  :ensure nil
  :defer t
  :init
  ;; winner mode (window history)
  ;; (winner-mode 1)
  
  ;; auto split windows side by side
  ;; (setq split-height-threshold nil)
  ;; (setq split-width-threshold 80)

  ;; (setq other-window-scroll-default #'get-lru-window)
  ;; (setq other-window-scroll-default
  ;; 		(lambda ()
  ;;         (or (get-mru-window nil nil 'not-this-one-dummy)
  ;;             (next-window) ;fall back to next window
  ;;             (next-window nil nil 'visible))))

  ;;go to help window
  (setq help-window-select t)
  
  ;; jump to compilation window
  ;; (defadvice compilation-start (after compilation-start-maximize activate)
  ;;   (when (equal mode 'grep-mode)
  ;;     (switch-to-buffer "*grep*")
  ;;     ;; you may want to maximize the buffer
  ;;     (delete-other-windows)))

  ;; ;;jump to occur window
  ;; (defadvice occur-1 (after occur-maximize activate)
  ;;   (other-window 1))

  ;; (setq auto-window-vscroll nil)

  ;; auto select window when mouse moves to it (like wm)
  (setq mouse-autoselect-window t)

  (setq switch-to-buffer-in-dedicated-window 'pop)
  (setq switch-to-buffer-obey-display-actions t)

  (defun kill-buffer-refocus ()
	"Not only kill current buffer but also remove its window."
	(interactive)
	(kill-buffer)
	(unless (eq 1 (length (cl-delete-duplicates (mapcar #'window-buffer (window-list)))))
	  (delete-window)))

  ;;;;;;;;;;;;;;;;;;;;;;
  ;; WINDOW POSITIONS ;;
  ;;;;;;;;;;;;;;;;;;;;;;

  ;; example: (display-buffer-in-side-window) (side . left) (window-width . 70)
  ;; also check set-window-parameter to change rules on the fly (like no-other-window)
  (setq display-buffer-alist
		'(("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
		   (display-buffer-no-window)
		   (allow-no-window . t))
		  ("*Apropos*" (display-buffer-same-window)) ))

  (add-to-list 'display-buffer-alist
			   `(,(rx (| "*xref*"
						 "*grep*"
						 "*Occur*"))
				 display-buffer-reuse-window
				 (inhibit-same-window . nil)))

  (add-to-list 'display-buffer-alist '("\\*Eldoc.*" display-buffer-same-window))

  (add-to-list 'display-buffer-alist '("\\*General Keybindings\\*" display-buffer-full-frame))

  ;; (add-to-list 'display-buffer-alist
  ;;			   '("\\*Completions\\*"
  ;;				 (display-buffer-reuse-window display-buffer-pop-up-window)
  ;;				 (inhibit-same-window . t)
  ;;				 (window-height . 10)))
  ;; also see function toggle-window-dedicated

  ;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; MACROS AND FUNCTIONS ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;

  (defmacro with-other-window (&rest body)
	"Execute forms in BODY in the other-window."
	`(unless (one-window-p)
	   (with-selected-window (other-window-for-scrolling)
		 ,@body)))

  ;; The above examples become straightforward applications of this macro
  (defun isearch-other-window (regexp-p)
	(interactive "P")
	(with-other-window (isearch-forward regexp-p)))

  (defun isearch-other-window-backwards (regexp-p)
	(interactive "P")
	(with-other-window (isearch-backward regexp-p)))

  (defun other-window-mru ()
	"Select the most recently used window on this frame."
	(interactive)
	(when-let ((mru-window
				(get-mru-window
				 nil nil 'not-this-one-dummy)))
	  (select-window mru-window)))

  ;;;;;;;;;;;;;;;
  ;; NTH CYCLE ;;
  ;;;;;;;;;;;;;;;

  ;;   (defun my/next-buffer (&optional arg)
  ;;	"Switch to the next ARGth buffer.

  ;; With a universal prefix arg, run in the next window."
  ;;	(interactive "P")
  ;;	(if-let (((equal arg '(4)))
  ;;			 (win (other-window-for-scrolling)))
  ;;		(with-selected-window win
  ;;           (next-buffer)
  ;;           (setq prefix-arg current-prefix-arg))
  ;;       (next-buffer arg)))

  ;;   (defun my/previous-buffer (&optional arg)
  ;;	"Switch to the previous ARGth buffer.

  ;; With a universal prefix arg, run in the next window."
  ;;	(interactive "P")
  ;;	(if-let (((equal arg '(4)))
  ;;			 (win (other-window-for-scrolling)))
  ;;		(with-selected-window win
  ;;           (previous-buffer)
  ;;           (setq prefix-arg current-prefix-arg))
  ;;       (previous-buffer arg)))

  ;;   ;; switch-to-buffer, but possibly in the next window
  ;;   (defun my/switch-buffer (&optional arg)
  ;;	(interactive "P")
  ;;	(run-at-time
  ;;	 0 nil
  ;;	 (lambda (&optional arg)
  ;;        (if-let (((equal arg '(4)))
  ;;				(win (other-window-for-scrolling)))
  ;;            (with-selected-window win
  ;;			 (switch-to-buffer
  ;;               (read-buffer-to-switch
  ;;               (format "Switch to buffer (%S)" win))))
  ;;		 (call-interactively #'switch-to-buffer)))
  ;;	 arg))

  ;;   (defvar-keymap buffer-cycle-map
  ;;	:doc "Keymap for cycling through buffers, intended for `repeat-mode'."
  ;;	:repeat t
  ;;	"n" 'my/next-buffer
  ;;	"p" 'my/previous-buffer
  ;;	"b" 'my/switch-buffer)

  ;;;;;;;;;;;;;;;;;;;;;;;
  ;; DWIM other-window ;;
  ;;;;;;;;;;;;;;;;;;;;;;;

  ;;   (defvar pmx--direction -1)
  ;;   (defvar pmx--last-win nil)
  ;;   (defun pmx-other-window (frame)
  ;; 	"Switch window, with DWIM behavior.
  ;; Prefix argument FRAME will unconditionally switch frames.
  ;; When called without any windows to switch to, split and select.
  ;; If called not in repeat, reverse directions and switch back to
  ;; usually the most recent window (though not `get-mru-window').
  ;; Finally, when called in repeat, continue in the same direction so
  ;; that we can usually get to the right window faster than an `avy'
  ;; call unless there's a ton of windows for some reason."
  ;; 	(interactive "P")
  ;; 	(cond (frame (other-frame 1))          ; unconditional with prefix arg
  ;;           ((equal 1 (length (window-list
  ;; 							 (selected-frame))))
  ;;            ;; If there is no window or even minibuffer open, split window.  Change
  ;;            ;; the direction so that we go back to the source window on repeat or
  ;;            ;; next call.
  ;;            (let ((source (selected-window))
  ;; 				 (tall (> (frame-pixel-height) (frame-pixel-width))))
  ;; 			 (select-window (split-window-right))
  ;; 			 (if (eq source (next-window))
  ;; 				 (setq pmx--direction 1)
  ;;                (setq pmx--direction -1)
  ;;                (when (not (eq source (previous-window)))
  ;; 				 (warn "Split window sucessor inconsistent")))))
  ;;           ((not (eq last-command 'pmx-other-window))
  ;;            ;; If we are not repeating an other-window command, reverse the
  ;;            ;; direction and select in that direction.
  ;;            (if (eq pmx--last-win (selected-window))
  ;;                (setq pmx--directionapmx--direction (- pmx--direction))
  ;; 			 ;;  we changed windows out of band. Reverse directions.
  ;; 			 (setq pmx--direction -1))
  ;;            (other-window pmx--direction))
  ;;           (t
  ;;            ;; We are repeating.  Continue going in the established direction.
  ;;            (other-window pmx--direction)))
  ;; 	(setq pmx--last-win (selected-window)))
  :general
  ;; auto balance windows upon deletion
  ("C-x 0" '(lambda ()
			  (interactive)
			  (delete-window)

			  ;; balance windows if more than 1
			  (unless (= 1 (length (window-list)))
				(balance-windows)))))
