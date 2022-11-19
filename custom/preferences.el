;;; preferences.el --- Summary:
;;; Commentary:
;;; Code:

;; keeps a server running (not necessary>use emacs-client directly)
;;(server-start)

;; winner mode (window history)
;; (winner-mode 1)

;; hide scroll bar
;; (scroll-bar-mode -1)

;; default is set to 300 characters
;; (setq auto-save-interval 20)

;; show both the row and column of the point in the modeline
(setq column-number-mode t)

;; hide minibuffer scroll bar
;; (set-window-scroll-bars (minibuffer-window) nil nil)

;; Remove text properties for kill ring entries (saves times when using savehist)
;; (defun unpropertize-kill-ring ()
;;   (setq kill-ring (mapcar 'substring-no-properties kill-ring)))
;; (add-hook 'kill-emacs-hook 'unpropertize-kill-ring)

;; if C-n is done at the end of the buffer, insert a newline
;; (setq next-line-add-newlines t)

;; set apropos results by relevancy
(setq apropos-sort-by-scores t)

;; save M-x and file history ; Need to check how it works first
;;(savehist-mode 1) ;; already defined elsewhere
;;(setq savehist-file "~/.emacs.d/custom/savehist")

;; suspend-frame is useless in window mode. I am thus replacing it
(put 'suspend-frame' disabled t)

(general-define-key
 ;; undo
 [remap suspend-frame] 'undo)

;; Shortcuts
(general-define-key
 ;; eval buffer quickly
 ;; note: # can be used before a lambda which may be byte compiled
 ;; "C-c x" #'(lambda () (interactxive) (save-buffer) (eval-buffer) (message "buffer evaluation complete"))
 :keymaps 'emacs-lisp-mode-map
 "C-c x" 'eval-region-or-buffer)

(defun eval-region-or-buffer ()
  (interactive)
  (cond
   (mark-active
    (call-interactively 'eval-region)
    (message "Region evaluated!")
    (setq deactivate-mark t))
   (t
    (save-buffer)
    (eval-buffer)
    (message "Buffer evaluated!"))))


;;(defun safe-find-library (library)
;;  "Find LIBRARY and enter view mode."
;;  (interactive "Library name: ")
;;  (find-library library)
;;  (view-mode))

;; save last session
;; (desktop-save-mode 1)

;; custom scratch message
(setq initial-scratch-message ";; This is where the fun begins")

;; insert matching pair of parenthesis
(electric-pair-mode t)
(setq electric-pair-preserve-balance t) ;; add " if another behind

(setq-default electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)

;; (setq-default electric-pair-inhibit-predicate
;;               (lambda (c)
;;                 (if (looking-at "[ \n\t]")
;;                     (electric-pair-default-inhibit c)
;;                   t)))

;; show matching parenthesis
(show-paren-mode t)
(setq show-paren-delay 0)

;; go to help window (move cursor)
;;(setq help-window-select t)

;; no startup message (probably already at the end of init.el)
;;(setq inhibit-startup-message t)
;;(setq inhibit-startup-echo-area-message t)

;; Make M-x compile silent
;;; Shut up compile saves
;;(setq compilation-ask-about-save nil)
;;; Don't save *anything*
;;(setq compilation-save-buffers-predicate '(lambda () nil))

;; highlight the current line
;;(setq global-hl-line-mode t)

;; delete selected text on insertion
(delete-selection-mode +1)

;; line-number
(display-line-numbers-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; remove the tool bar
(tool-bar-mode -1)

;; toggle every scroll bar
;; (toggle-scroll-bar)
(scroll-bar-mode -1)

;; automatic linebreak
;;(auto-fill-mode)


(defun display-startup-echo-area-message ()
  "Custom startup message."
  (message "Let the hacking begin!"))

;; This line corrects a problem with the monokai theme
;; (set-face-attribute 'widget-field nil :background "#272821")



;; show trailing white spaces
(setq show-trailing-whitespace t)

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

;; toggle-truncate-lines or visual-line-mode or global-visual-line-mode
;;(setq-default truncate-lines t)
(global-visual-line-mode t)

;;emacs search and buffers are case insensitive
(setq case-fold-search t)

;; correct accents in filenames
;; (prefer-coding-system 'utf-8)
;;(set-default-coding-systems 'utf-8)
;; (setq file-name-coding-system 'utf-8)


;; use minibuffer in minibuffer. useful to search in minibuffer with swiper
;; (setq enable-recursive-minibuffers t) ;; already defined in vertico

;; move auto save folder in specific directory
(custom-set-variables
 '(auto-save-list-file-prefix (concat user-emacs-directory "files/auto-save-list/.saves-"))
 '(auto-save-list-file-name (concat user-emacs-directory "files/auto-save-list/.saves-5642-nixos~")))

;; move bookmarks in specific directory
(custom-set-variables
 '(bookmark-default-file "~/.emacs.d/files/bookmark/bookmarks"))

;; need to install a dict and setup a daemon first
;; (setq dictionary-server "localhost")

;; query: no more annoying prompts
;; y or n instead of yes or no
(setq use-short-answers t)

;; query: for C-x C-f or C-x b
(setq confirm-nonexistent-file-or-buffer nil)

;; query: live processes
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

;; auto split windows side by side
(setq split-height-threshold nil)
(setq split-width-threshold 80)


;; Does not work yet. Learn more about rg / fd first before replacing emacs' defaults
;; (grep-apply-setting 'grep-command '("rg -H -e -0 ")) ;; "grep --color=auto -nH --null -e "
;; (grep-apply-setting 'grep-find-command '("fd . ")) ;; ("find . -type f -exec grep --color=auto -nH --null -e  \\{\\} +" . 54)
;; (grep-apply-setting 'grep-find-template '("fd . "))

;;; preferences.el ends here
