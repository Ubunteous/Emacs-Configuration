;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                MEOW                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package meow
  :defer t
  :init
  (require 'meow)
  (meow-global-mode 1)
  :config
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-colemak-dh)

  ;; fix incorrect kill ring order
  (setq meow-use-clipboard t)

  ;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; meow org speed keys ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; (defface meow-org-motion-cursor
  ;;   '((((class color) (background dark))
  ;;      (:background "medium spring green"))
  ;;     ;; (((class color) (background light))
  ;;     ;; (:background "medium spring green"))
  ;;     )
  ;;   "Insert org motion cursor."
  ;;   :group 'meow)
  
  ;; (setq meow-org-motion-keymap (make-keymap))
  ;; (meow-define-state org-motion
  ;;   "Org-mode structural motion"
  ;;   :lighter "[O]"
  ;;   :face meow-org-motion-cursor
  ;;   :keymap meow-org-motion-keymap)

  ;; (meow-define-keys 'org-motion
  ;;   '("<escape>" . meow-normal-mode)
  ;;   '("i" . meow-insert-mode)
  ;;   '("g" . meow-normal-mode)
  ;;   '("u" .  meow-undo)
  ;;   ;; Moving between headlines
  ;;   '("k" .  org-previous-visible-heading)
  ;;   '("j" .  org-next-visible-heading)
  ;;   ;; Moving between headings at the same level
  ;;   '("p" .  org-backward-heading-same-level)
  ;;   '("n" .  org-forward-heading-same-level)
  ;;   ;; Moving subtrees themselves
  ;;   '("K" .  org-subtree-up)
  ;;   '("J" .  org-subtree-down)
  ;;   ;; Subtree de/promotion
  ;;   '("L" .  org-demote-subtree)
  ;;   '("H" .  org-promote-subtree)
  ;;   ;; Completion-style search of headings
  ;;   '("v" .  consult-org-heading)
  ;;   ;; Setting subtree metadata
  ;;   '("l" .  org-set-property)
  ;;   '("t" .  org-todo)
  ;;   '("d" .  org-deadline)
  ;;   '("s" .  org-schedule)
  ;;   '("e" .  org-set-effort)
  ;;   ;; Block navigation
  ;;   '("b" .  org-previous-block)
  ;;   '("f" .  org-next-block)
  ;;   ;; Narrowing/widening
  ;;   '("N" .  org-narrow-to-subtree)
  ;;   '("W" .  widen))

  ;;;;;;;;;;;;;;;;;
  ;; buffer mode ;;
  ;;;;;;;;;;;;;;;;;
  
  ;; magit text-mode only needs insert mode
  (setf (alist-get 'text-mode meow-mode-state-list) 'insert)
  (setf (alist-get 'Custom-mode meow-mode-state-list) 'insert)
  ;; (setf (alist-get 'org-mode meow-mode-state-list) 'org-motion)
  (setf (alist-get 'org-mode meow-mode-state-list) 'normal)
  (setf (alist-get 'latex-mode meow-mode-state-list) 'normal)
  (setf (alist-get 'LaTeX-mode meow-mode-state-list) 'normal)
  (setf (alist-get 'markdown-mode meow-mode-state-list) 'normal)

  ;;;;;;;;;;;;;;
  ;; bindings ;;
  ;;;;;;;;;;;;;;

  (meow-motion-overwrite-define-key
   ;; Use e to move up, n to move down.
   ;; Since special modes usually use n to move down, we only overwrite e here.
   '("e" . meow-prev)
   '("<escape>" . ignore))

  (meow-leader-define-key
   '("?" . meow-cheatsheet)
   ;; To execute the originally e in MOTION state, use SPC e.
   ;; '("e" . "H-e") ;; => shadows iedit-replace
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument))

  (meow-normal-define-key
   ;; '("0" . meow-expand-0)
   ;; '("1" . meow-expand-1)
   ;; '("2" . meow-expand-2)
   ;; '("3" . meow-expand-3)
   ;; '("4" . meow-expand-4)
   ;; '("5" . meow-expand-5)
   ;; '("6" . meow-expand-6)
   ;; '("7" . meow-expand-7)
   ;; '("8" . meow-expand-8)
   ;; '("9" . meow-expand-9)
   ;; '("0" . meow-expand-0)

   ;; '("-" . negative-argument)
   ;; '("'" . repeat)

   '("&" . meow-expand-1)
   '("é" . meow-expand-2)
   '("\"" . meow-expand-3)
   '("'" . meow-expand-4)
   '("(" . meow-expand-5)
   '("-" . meow-expand-6)
   '("è" . meow-expand-7)
   '("_" . meow-expand-8)
   '("ç" . meow-expand-9)
   '("à" . meow-expand-0)
   
   '("6" . negative-argument)
   '("4" . repeat)
   
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("/" . meow-visit)

   ;; vim style open above/below
   '("a" . meow-append)
   '("s" . meow-insert)

   ;; '("A" . meow-open-below)
   ;; '("A" . meow-append-at-end)
   ;; '("S" . meow-open-above)
   ;; '("S" . meow-insert-at-begin)

   ;; '("o" . meow-block)
   ;; '("O" . meow-to-block)
   
   '("A" . meow-block)
   '("S" . meow-to-block)
   '("o" . meow-open-below)
   '("O" . meow-open-above)
   
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("e" . meow-prev)
   '("E" . meow-prev-expand)
   '("f" . meow-find)
   '("F" . nt-negative-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   ;; '("h" . meow-left)
   ;; '("H" . meow-left-expand)
   '("h" . meow-mark-word)
   '("H" . meow-mark-symbol)
   '("i" . meow-right)
   '("I" . meow-right-expand)
   '("j" . meow-join)
   '("k" . meow-kill)
   '("l" . meow-line)
   '("L" . meow-goto-line)
   ;; '("m" . meow-mark-word)
   ;; '("M" . meow-mark-symbol)
   '("m" . meow-left)
   '("M" . meow-left-expand)
   '("n" . meow-next)
   '("N" . meow-next-expand)
   ;; '("p" . meow-yank)
   '("p" . meow-yank-delete-selection)
   '("q" . meow-quit)
   '("r" . meow-replace)
   ;; '("R" . meow-org-motion-mode) ;; custom mode
   '("t" . meow-till)
   '("T" . nt-negative-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-search)
   '("w" . meow-next-word)
   '("W" . meow-next-symbol)
   '("x" . meow-delete)
   '("X" . meow-backward-delete)
   '("y" . meow-save)
   '("z" . meow-pop-selection)
   
   '("<escape>" . ignore))

  ;; SPACE will be bound to C-x rather than C-c in normal mode
  ;; (setq meow-keypad-leader-dispatch "C-x") ;; Dispatch to the keymap at C-x
  ;; (setq meow-keypad-leader-dispatch ctl-x-map) ;; Dispatch to the ctl-x-map
  ;; :config
  ;; (setq meow-cheatsheet-physical-layout meow-cheatsheet-physical-layout-iso)

  ;;;;;;;;;;;;;;;;
  ;; appearance ;;
  ;;;;;;;;;;;;;;;;

  (setq meow-cursor-type-insert 'box)
  (custom-set-faces '(meow-insert-cursor ((t (:background "light sea green"))))
		    '(meow-normal-cursor ((t (:background "#fefff8")))))
  ;; :custom-face
  ;; does not work because of inherit
  ;; (meow-insert-cursor ((t (:background "light sea green"))))
  ;; (meow-normal-cursor ((t (:background "#fefff8"))))
  :general (:keymaps 'meow-insert-state-keymap
		     "<DEL>" 'meow-backward-char))

(use-package key-chord
  :defer t
  :config
  ;;Exit insert mode by pressing j and then j quickly
  (setq key-chord-two-keys-delay 0.5)

  (key-chord-define meow-insert-state-keymap "nn" 'meow-normal-mode)
  :hook meow-mode)

;; MEOW BLOCK repeat
(defvar meow-block-repeat-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "s") #'meow-to-block)
    (define-key map (kbd "a") #'meow-block)
    map))

(map-keymap
 (lambda (_key cmd)
   (when (symbolp cmd)
     (put cmd 'repeat-map 'meow-block-repeat-map)))
 meow-block-repeat-map)


(defun meow-backward-char ()
  "Backward should go for the kill if a selection is active."
  (interactive)

  (if (use-region-p)
      (delete-active-region)
    (backward-delete-char-untabify 1)))


(defmacro nt--call-negative (form)
  "Imitate vim's FORM (F/T) backward search."
  `(let ((current-prefix-arg -1))
     (call-interactively ,form)))

(defun nt-negative-find ()
  "Imitate vim's F backward search."
  (interactive)
  (nt--call-negative 'meow-find))

(defun nt-negative-till ()
  "Imitate vim's T backward search."
  (interactive)
  (nt--call-negative 'meow-till))



(defun meow-yank-delete-selection ()
  "Yank and delete selection if it exists."
  (interactive)
  (when (use-region-p)
    (delete-region (region-end) (region-beginning)))
  
  (meow-yank))
