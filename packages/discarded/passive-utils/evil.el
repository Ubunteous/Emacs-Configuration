;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                EVIL                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; check later
;; + evil-leader
;; + evil-surround
;; + evil-indent-textobject
;; + evil-org
;; + powerline-evil

(use-package evil
  :defer t
  :init
  (setq evil-want-C-i-jump nil) ;; org mode tab cycle visibility
  (setq evil-toggle-key "C-S-z") ;; Control-Shift-Z
  :config
  (setq evil-normal-state-tag "NORMAL"
	evil-insert-state-tag "INSERT"
	evil-visual-state-tag "VISUAL"
	evil-replace-state-tag "REPLACE"
	evil-operator-state-tag "OPERATOR"
	evil-motion-state-tag "MOTION"
	evil-emacs-state-tag "EMACS")

  (setq evil-cross-lines t)
  
  (evil-set-undo-system 'undo-redo)
  (evil-set-initial-state 'helpful-mode 'emacs)

  ;; see also evil-buffer-regexps
  (setq evil-default-state 'emacs)
  (evil-set-initial-state 'prog-mode 'normal)
  (evil-set-initial-state 'org-mode 'normal)
  
  ;; keep emacs bindings in evil insert mode
  (setq evil-insert-state-map (make-sparse-keymap))
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)

  (general-evil-setup)

  ;;;;;;;;;;;;
  ;; LEADER ;;
  ;;;;;;;;;;;;
  
  ;; (general-create-definer evil-leader
  ;;   :prefix "SPC")

  ;; (evil-leader
  ;;  :keymaps 'normal
  ;;  "f" 'find-file)

  ;; WHICH-KEY INTEGRATION
  (which-key-add-keymap-based-replacements
    evil-normal-state-map "SPC x" "C-x map")
  :general
  (:prefix "SPC x" :states 'normal
	   "f" 'find-file
	   "s" 'save-buffer
	   "k" 'kill-buffer-refocus)
  
  (:states '(normal visual)
	   ;; "<ESC>" 'keyboard-quit ;; risk: disables M-x
	   "m" 'evil-backward-char
	   "n" 'evil-next-line
	   "e" 'evil-previous-line
	   "i" 'evil-forward-char
	   
	   "u" 'evil-insert
	   "h" 'evil-undo
	   
	   "j" 'evil-set-marker
	   "k" 'evil-search-next
	   "l" 'evil-forward-word-end

	   ;; maybe bad as it shadows evil-repeat-pop-next
	   "M-." 'evilnc-comment-or-uncomment-lines

	   ;; added since C-u is taken by universal argument
	   ;; "RET" 'newline ;; unfortunately, prevent using org links
	   "C-l" 'evil-scroll-up)

  (:states 'insert "C-o" 'evil-execute-in-normal-state)
  ;; (:states 'insert "C-S-o" 'evil-execute-in-emacs-state)

  ;; ;; keep emacs bindings in insert mode
  ;; ;; => not necessary as handled above
  ;; (:states 'insert
  ;; 	   "C-a" 'crux-move-beginning-of-line
  ;; 	   "C-e" 'end-of-line ;; 'evil-end-of-line
  ;; 	   "C-f" 'evil-forward-char
  ;; 	   "C-k" 'kill-line
  ;; 	   "C-n" 'evil-next-line
  ;; 	   "C-p" 'evil-previous-line

  ;; 	   ;; "C-w" 'evil-delete
  ;; 	   "C-y" 'yank)
  :hook prog-mode)

;;;;;;;;;;;;;;;;;
;; ESCAPE QUIT ;;
;;;;;;;;;;;;;;;;;

(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(use-package key-chord
  :defer t
  :config
  ;;Exit insert mode by pressing j and then j quickly
  (setq key-chord-two-keys-delay 0.5)

  (key-chord-define evil-insert-state-map "nn" 'evil-normal-state)

  ;; (key-chord-define evil-normal-state-map "oo" 'crux-smart-open-line)
  ;; (key-chord-define evil-normal-state-map "OO" 'crux-smart-open-line-above)

  ;; OO does not work in all modes (like python) but it is better than nothing
  (key-chord-define evil-normal-state-map "OO" '(lambda () (interactive)
						  (evil-set-marker ?`)
						  (crux-smart-open-line-above)
						  (evil-goto-mark ?`)))
  
  (key-chord-define evil-normal-state-map "oo" '(lambda () (interactive)
						  (evil-set-marker ?`)
						  (crux-smart-open-line nil)
						  (evil-goto-mark ?`)))
  :hook evil-mode)

;;;;;;;;;;;;;;;;;;
;; DEPENDENCIES ;;
;;;;;;;;;;;;;;;;;;

;; ;; only needed to use with evil-undo-system
;; (use-package undo-tree
;;   :defer t
;;   :config
;;   ;; (global-undo-tree-mode 1)
;;   :hook (evil-local-mode . turn-on-undo-tree-mode))

;; (use-package undo-fu
;;   :defer t)

;;;;;;;;;;;;;;;;
;; EXTENSIONS ;;
;;;;;;;;;;;;;;;;

;; this mode replaces evil's default binding s/S
;; note that it barely matters as s=cl and S=cc=^C
(use-package evil-snipe
  :defer t
  :hook ((prog-mode . evil-snipe-mode)
	 (magit-mode . turn-off-evil-snipe-override-mode))
  ;; :config

  ;; (setq evil-snipe-show-prompt nil)

  ;; (evil-define-key '(normal motion) evil-snipe-local-mode-map
  ;;   "f" 'evil-snipe-s
  ;;   "F" 'evil-snipe-S)
  
  ;; (setq evil-line-scope 'line)
  ;; (setq evil-snipe-smart-case t)
  )

;;;;;;;;;;;;;;;;;;;;;;;
;; POTENTIAL CHANGES ;;
;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Q is normally bound to evil-execute-last-kbd-macro
;; (define-key evil-normal-state-map "Q" 'call-last-kbd-macro)
;; (define-key evil-visual-state-map "Q" 'call-last-kbd-macro)

;; (define-key evil-normal-state-map (kbd "TAB") 'evil-undefine)
;; (defun evil-undefine ()
;;   (interactive)
;;   (let (evil-mode-map-alist)
;;     (call-interactively (key-binding (this-command-keys)))))

;; evil minibuffer quit
;; (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; (define-key evil-motion-state-map "..." '...)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROBLEMATIC BINDINGS ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-. flyspell-auto-correct-word => evil-repeat-pop
;; M-. evilnc-comment-or-uncomment-line evil-repeat-pop-next

;; S-<left>	evil-backward-word-begin
;; S-<right>	evil-forward-word-begin
