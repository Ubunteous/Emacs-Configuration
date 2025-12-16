;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              ACE WINDOW            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ace-window
  :defer t
  :config
  ;; azerty friendly list of keys
  ;; (setq aw-keys '(?& ?é ?\" ?' ?\( ?- ?è ?_ ?ç ?à))
  
  ;; azerty home row to change window
  ;; note: j words as per usual if there are less
  ;; than 7 windows. w will add as a replacement if needed
  ;; (setq aw-keys '(?q ?s ?d ?f ?g ?h ?j ?k ?l))

  (advice-add 'ace-window :before
              (defun other-window-split-if-single (&rest _)
				"Split the frame if there is a single window."
				(when (one-window-p) (split-window-sensibly))))

  ;; (defun ace-window-dwim ()
  ;; 	(interactive)
  ;; 	;; smarter window management
  ;; 	(if (= (count-windows) 1)
  ;; 		(split-window-right)
  ;; 	  (ace-window nil))

  ;; 	;; (let ((nb-windows (count-windows)))
  ;; 	;;   (cond ((= nb-windows 1) (progn
  ;; 	;; 							(split-window-right)
  ;; 	;; 							(windmove-right)))
  ;; 	;; 		((= nb-windows 2) (progn
  ;; 	;; 							;; (windmove-right)
  ;; 	;; 							(split-window-below)
  ;; 	;; 							(windmove-down)))
  ;; 	;; 		(t (ace-window nil))))
  ;; 	)

  (defun ace-window-one-command ()
	"Select a window and execute a command before going back"
	(interactive)
	(let ((win (aw-select " ACE")))
      (when (windowp win)
		(with-selected-window win
          (let* ((command (key-binding
                           (read-key-sequence
							(format "Run in %s..." (buffer-name)))))
				 (this-command command))
			(call-interactively command))))))

  ;; colemak friendly keys
  (setq aw-keys '(?a ?r ?s ?t ?g ?m ?n ?e ?i))

  (add-to-list 'aw-dispatch-alist '(?w aw-switch-buffer-in-window "Select Buffer"))

  ;;;;;;;;;;;;
  ;; EMBARK ;;
  ;;;;;;;;;;;;

  ;; ;; close to ace-window-one-command. run a command and then choose its target window
  ;; (defun ace-window-prefix ()
  ;; 	"Use `ace-window' to display the buffer of the next command.
  ;; The next buffer is the buffer displayed by the next command invoked
  ;; immediately after this command (ignoring reading from the minibuffer).
  ;; Creates a new window before displaying the buffer.
  ;; When `switch-to-buffer-obey-display-actions' is non-nil,
  ;; `switch-to-buffer' commands are also supported."
  ;; 	(interactive)
  ;; 	(display-buffer-override-next-command
  ;; 	 (lambda (buffer _)
  ;;      (let (window type)
  ;; 		 (setq
  ;;         window (aw-select (propertize " ACE" 'face 'mode-line-highlight))
  ;;         type 'reuse)
  ;; 		 (cons window type)))
  ;; 	 nil "[ace-window]")
  ;; 	(message "Use `ace-window' to display next command buffer..."))

  ;; (defun embark-ace-window-prefix ()
  ;; 	"Version of `ace-window-prefix' for use in Embark, in the minibuffer."
  ;; 	(interactive)
  ;; 	(let ((aw-dispatch-always t))
  ;;     (ace-window-prefix))
  ;; 	(when (minibuffer-window-active-p (minibuffer-window))
  ;;     (switch-to-minibuffer))
  ;; 	(embark-act))

  ;; (setq embark-quit-after-action
  ;; 		'((embark-ace-window-prefix . nil)
  ;;         (t . t)))
  :general
  ;; (:keymaps embark-meta-map "C-x 4 4" 'embark-ace-window-prefix)
  ("C-x o" 'ace-window
   "C-x O" 'ace-window-one-command
   "M-o" 'ace-window))
