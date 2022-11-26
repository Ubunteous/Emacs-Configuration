;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                REPEAT              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package repeat
  :straight (:type built-in)
  :config
  (repeat-mode))

;; SCROLL
(defvar scroll-repeat-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "v") #'scroll-up-command)
    (define-key map (kbd "b") #'scroll-down-command)
    (define-key map (kbd "j") #'next-line)
    (define-key map (kbd "k") #'previous-line)
    map))

(map-keymap
 (lambda (_key cmd)
   (when (symbolp cmd)
     ;;(put cmd 'scroll-up-command 'scroll-down-command)))
     (put cmd 'repeat-map 'scroll-repeat-map)))
 scroll-repeat-map)

;; SWITCH BUFFER
;; switch easily to a nearby buffer with C-x <arrow>
(defvar switch-buffer-repeat-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<right>") #'next-buffer)
    (define-key map (kbd "<left>") #'previous-buffer)
    map))

;; same as above but does not need to rewrite every key => whatever was "above" does not exist anymore
(map-keymap
 (lambda (_key cmd)
   (when (symbolp cmd)
     (put cmd 'repeat-map 'switch-buffer-repeat-map)))
 switch-buffer-repeat-map)

;; SWITCH PERSPECTIVE
(defvar switch-persp-repeat-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<right>") #'persp-next)
    (define-key map (kbd "<left>") #'persp-prev)
    map))

(map-keymap
 (lambda (_key cmd)
   (when (symbolp cmd)
     (put cmd 'repeat-map 'switch-persp-repeat-map)))
 switch-persp-repeat-map)


;; OTHER WINDOW
(defvar other-window-repeat-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "o") #'other-window)
    map))

(map-keymap
 (lambda (_key cmd)
   (when (symbolp cmd)
     (put cmd 'repeat-map 'other-window-repeat-map)))
 other-window-repeat-map)

;; ORG HEADING MOTION
(defvar heading-repeat-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "n") #'org-next-visible-heading)
    (define-key map (kbd "p") #'org-previous-visible-heading)
    (define-key map (kbd "f") #'org-forward-heading-same-level)
    (define-key map (kbd "b") #'org-backward-heading-same-level)
    map))

(map-keymap
 (lambda (_key cmd)
   (when (symbolp cmd)
     (put cmd 'repeat-map 'heading-repeat-map)))
 heading-repeat-map)

;; ORG SOURCE BLOCK MOTION
(defvar src-block-repeat-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "n") #'org-babel-next-src-block)
    (define-key map (kbd "p") #'org-babel-previous-src-block)
    map))

(map-keymap
 (lambda (_key cmd)
   (when (symbolp cmd)
     (put cmd 'repeat-map 'src-block-repeat-map)))
 src-block-repeat-map)

;; MINI VIM

;; basic vim motions with emacs bindings
;; an hydra would probably be better for this task
;; (defvar mini-vim-repeat-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map (kbd "SPC") #'set-mark-command)
;;     ;;(define-key map (kbd "q") #'kill-region)
;;     ;;(define-key map (kbd "s") #'kill-ring-save)
;;     ;;(define-key map (kbd "$") #'kill-visual-line)
;;     ;;(define-key map (kbd "y") #'yank)

;;     (define-key map (kbd "j") #'next-line)
;;     (define-key map (kbd "k") #'previous-line)
;;     (define-key map (kbd "l") #'forward-char)
;;     (define-key map (kbd "h") #'backward-char)

;;     ;;(define-key map (kbd "u") #'undo)
;;     (define-key map (kbd "w") #'forward-word)
;;     (define-key map (kbd "b") #'backward-word)

;;     (define-key map (kbd "e") #'move-end-of-line)
;;     (define-key map (kbd "a") #'move-beginning-of-line)
;;     (define-key map (kbd "m") #'newline)
;;     map))

;; (map-keymap
;;  (lambda (_key cmd)
;;    (when (symbolp cmd)
;;      (put cmd 'repeat-map 'mini-vim-repeat-map)))
;;  mini-vim-repeat-map)
