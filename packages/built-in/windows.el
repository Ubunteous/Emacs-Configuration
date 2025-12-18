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
  :general
  ;; auto balance windows upon deletion
  ("C-x 0" '(lambda ()
			  (interactive)
			  (delete-window)

			  ;; balance windows if more than 1
			  (unless (= 1 (length (window-list)))
				(balance-windows)))))
