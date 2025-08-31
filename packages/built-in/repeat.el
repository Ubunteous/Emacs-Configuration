;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                REPEAT              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package repeat
  :ensure nil
  ;; :straight (:type built-in)
  :config
  (repeat-mode)
  (setq repeat-exit-key "q"))

;; useful but only work with char shortcuts (not <left>)
(defmacro repeat-it (group cmds)
  (let ((map (intern (concat (symbol-name group) "-repeat-map"))))
    `(progn
       (defvar ,map (make-sparse-keymap))
       (cl-loop for (key def hint) in ,cmds do
                (define-key ,map (kbd key) def)
                (put def 'repeat-map ',map)
                (when hint (put def 'repeat-hint hint))))))

;; (defun add-repeat-map (new-repeat-map)
;;   (lambda (_key cmd)
;; 	(when (symbolp cmd)
;;       (put cmd 'repeat-map new-repeat-map)))
;;   `new-repeat-map)

;; ORGTODO
(repeat-it
 todo
 '(("t" org-todo "todo")))

;; SCROLL
(repeat-it
 scroll
 '(("v" scroll-up-command "scroll up")
   ("b" scroll-down-command "scroll down")))

;; SWITCH BUFFER
;; switch easily to a nearby buffer with C-x <arrow>
(defvar switch-buffer-repeat-map
  (let ((map (make-sparse-keymap)))
	(define-key map (kbd "<right>") #'next-buffer)
	(define-key map (kbd "<left>") #'previous-buffer)
	(define-key map (kbd "n") #'previous-buffer)
	(define-key map (kbd "e") #'next-buffer)
	map))

;; same as above but does not need to rewrite every key => whatever was "above" does not exist anymore
(map-keymap
 (lambda (_key cmd)
   (when (symbolp cmd)
	 (put cmd 'repeat-map 'switch-buffer-repeat-map)))
 switch-buffer-repeat-map)

;; ;; SWITCH PERSPECTIVE
;; (defvar switch-persp-repeat-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map (kbd "<right>") #'persp-next)
;;     (define-key map (kbd "<left>") #'persp-prev)
;;     map))

;; (map-keymap
;;  (lambda (_key cmd)
;;    (when (symbolp cmd)
;;      (put cmd 'repeat-map 'switch-persp-repeat-map)))
;;  switch-persp-repeat-map)

;; OTHER WINDOW
(repeat-it
 other-window
 ;; '(("o" other-window "other")))
 '(("o" ace-window "other")))

;; ORG HEADING MOTION
(repeat-it
 heading
 '(("n" org-next-visible-heading "next")
   ("p" org-previous-visible-heading "previous")
   ("f" org-forward-heading-same-level "forward same level")
   ("b" org-backward-heading-same-level "backward same level")))

;; ORG SOURCE BLOCK MOTION
(repeat-it
 src-block
 '(("c" org-babel-execute-src-block "execute")
   ("n" org-babel-next-src-block "next")
   ("p" org-babel-previous-src-block "previous")))

;; SEARCH (swiper)
(repeat-it
 swiper
 '(("s" swiper-C-s "next")
   ("r" swiper-isearch-C-r "previous")))


;; CONFLICT (smerge)
(repeat-it
 smerge
 '(("n" smerge-next "next")
   ("p" smerge-prev "previous")))

;; ;; SEARCH (isearch)
;; (defvar isearch-repeat-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map (kbd "s") #'isearch-repeat-forward)
;;     (define-key map (kbd "r") #'isearch-repeat-backward)
;;     map))

;; (map-keymap
;;  (lambda (_key cmd)
;;    (when (symbolp cmd)
;;      (put cmd 'repeat-map 'isearch-repeat-map)))
;;  isearch-repeat-map)

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
