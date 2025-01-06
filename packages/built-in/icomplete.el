;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              ICOMPLETE             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package icomplete
  :defer t
  :ensure nil
  :general (:keymaps 'icomplete-minibuffer-map
		     "C-n" 'icomplete-forward-completions
		     "C-p" 'icomplete-backward-completions
		     "C-v" 'icomplete-vertical-toggle
		     "RET" 'icomplete-force-complete-and-exit)
  :hook
  (elpaca-after-init . (lambda ()
			 (fido-mode -1)
			 (icomplete-mode 1)
			 (icomplete-vertical-mode 1)))
  :config
  (setq tab-always-indent 'complete  ;; Starts completion with TAB
	icomplete-delay-completions-threshold 0
	icomplete-compute-delay 0
	;; icomplete-show-matches-on-no-input t ;; causes an error with swiper
	icomplete-hide-common-prefix nil
	icomplete-prospects-height 10
	icomplete-separator " . "
	icomplete-with-completion-tables t
	icomplete-in-buffer t
	icomplete-max-delay-chars 0
	icomplete-scroll t)

  (advice-add 'completion-at-point
              :after #'minibuffer-hide-completions)

  ;; FIXME - this is actually an override of internal icomplete to provide
  ;;         in buffer on column completion
  ;;
  ;; As first suggested by Zhengyi Fu:
  ;; https://mail.gnu.org/archive/html/help-gnu-emacs/2024-04/msg00126.html
  ;;
  (cl-defun icomplete--render-vertical
      (comps md &aux scroll-above scroll-below
             (total-space ; number of mini-window lines available
              (1- (min
                   icomplete-prospects-height
                   (truncate (max-mini-window-lines) 1)))))
    ;; Welcome to loopapalooza!
    ;;
    ;; First, be mindful of `icomplete-scroll' and manual scrolls.  If
    ;; `icomplete--scrolled-completions' and `icomplete--scrolled-past'
    ;; are:
    ;;
    ;; - both nil, there is no manual scroll;
    ;; - both non-nil, there is a healthy manual scroll that doesn't need
    ;;   to be readjusted (user just moved around the minibuffer, for
    ;;   example)l
    ;; - non-nil and nil, respectively, a refiltering took place and we
    ;;   may need to readjust them to the new filtered `comps'.
    (when (and icomplete-scroll
               icomplete--scrolled-completions
               (null icomplete--scrolled-past))
      (cl-loop with preds
               for (comp . rest) on comps
               when (equal comp (car icomplete--scrolled-completions))
               do
               (setq icomplete--scrolled-past preds
                     comps (cons comp rest))
               (completion--cache-all-sorted-completions
		(icomplete--field-beg)
		(icomplete--field-end)
		comps)
               and return nil
               do (push comp preds)
               finally (setq icomplete--scrolled-completions nil)))
    ;; Then, in this pretty ugly loop, collect completions to display
    ;; above and below the selected one, considering scrolling
    ;; positions.
    (cl-loop with preds = icomplete--scrolled-past
             with succs = (cdr comps)
             with space-above = (- total-space
                                   1
                                   (cl-loop for (_ . r) on comps
                                            repeat (truncate total-space 2)
                                            while (listp r)
                                            count 1))
             repeat total-space
             for neighbor = nil
             if (and preds (> space-above 0)) do
             (push (setq neighbor (pop preds)) scroll-above)
             (cl-decf space-above)
             else if (consp succs) collect
             (setq neighbor (pop succs)) into scroll-below-aux
             while neighbor
             finally (setq scroll-below scroll-below-aux))
    ;; Halfway there...
    (let* ((selected (propertize (car comps) 'icomplete-selected t))
           (chosen (append scroll-above (list selected) scroll-below))
           (tuples (icomplete--augment md chosen))
           max-prefix-len max-comp-len lines nsections)
      (add-face-text-property 0 (length selected)
                              'icomplete-selected-match 'append selected)
      ;; Figure out parameters for horizontal spacing
      (cl-loop
       for (comp prefix) in tuples
       maximizing (length prefix) into max-prefix-len-aux
       maximizing (length comp) into max-comp-len-aux
       finally (setq max-prefix-len max-prefix-len-aux
                     max-comp-len max-comp-len-aux))
      ;; Serialize completions and section titles into a list
      ;; of lines to render
      (cl-loop
       for (comp prefix suffix section) in tuples
       when section
       collect (propertize section 'face 'icomplete-section) into lines-aux
       and count 1 into nsections-aux
       when (get-text-property 0 'icomplete-selected comp)
       do (add-face-text-property 0 (length comp)
                                  'icomplete-selected-match 'append comp)
       collect (concat prefix
                       (make-string (- max-prefix-len (length prefix)) ? )
                       (completion-lazy-hilit comp)
                       (make-string (- max-comp-len (length comp)) ? )
                       suffix)
       into lines-aux
       finally (setq lines lines-aux
                     nsections nsections-aux))
      ;; Kick out some lines from the beginning due to extra sections.
      ;; This hopes to keep the selected entry more or less in the
      ;; middle of the dropdown-like widget when `icomplete-scroll' is
      ;; t.  Funky, but at least I didn't use `cl-loop'
      (setq lines
            (nthcdr
             (cond ((<= (length lines) total-space) 0)
                   ((> (length scroll-above) (length scroll-below)) nsections)
                   (t (min (ceiling nsections 2) (length scroll-above))))
             lines))
    ;;; ------- NON ORIGINAL HERE...
      (when icomplete--in-region-buffer
	(let ((column
               (with-current-buffer icomplete--in-region-buffer
		 (save-excursion
                   (goto-char (car completion-in-region--data))
                   (current-column)))))
          (dolist (l lines)
            (add-text-properties
             0 1 `(display ,(concat (make-string column ?\s) (substring l 0 1)))
             l))))
    ;;; -------- NON ORIGINAL ENDS HERE...
      ;; At long last, render final string return value.  This may still
      ;; kick out lines at the end.
      (concat " \n"
              (cl-loop for l in lines repeat total-space concat l concat "\n")))))
