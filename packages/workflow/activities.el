;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             ACTIVITIES             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package activities
  :defer t
  :init
  (defvar-subkeymap personal-misc-bindings-keymap "k" activities-keymap "Keymap for activities.")

  ;; :config
  ;; (setq activities-sort-by #'activities-sort-by-active-age)
  ;; (setq activities-annotation-colors '("blue" "red" 0.65)) ; age
  ;; (setq activities-kill-buffers nil) ; on activity suspension

  ;; (setq activities-bookmark-warnings nil) ; when buffer cannot be bookmarked
  ;; (setq activities-bookmark-store t) ; convenience. bookmarks only contain a name

  ;; (setq activities-name-prefix "α: ") ; for tabs/frames
  ;; (setq activities-set-frame-name t) ; set after switching activity.
  ;; (setq activities-default-name-fn #'activities--project-name)

  ;; (setq activities-resume-into-frame 'current)
  ;; (setq activities-mode-idle-frequency 5)

  ;; activities-anti-kill-predicates
  ;; activities-anti-save-predicates
  ;; activities-after-resume-functions
  ;; activities-after-switch-functions
  ;; activities-buffer-local-variables
  ;; activities-before-resume-functions
  :bind (:map activities-keymap
			  ("b" . activities-switch-buffer)
			  ("c" . activities-define)
			  ("d" . activities-discard)
			  ("k" . activities-kill)
			  ("l" . activities-list)
			  ("m" . activities-mode)
			  ("n" . activities-new)
			  ("p" . activities-suspend)
			  ("r" . activities-rename)
			  ("s" . activities-save-all)
			  ("t" . activities-tabs-mode)
			  ("u" . activities-resume)
			  ("v" . activities-revert)
			  ("w" . activities-switch))
  (:map personal-misc-bindings-keymap ("i" . activities-keymap)))
