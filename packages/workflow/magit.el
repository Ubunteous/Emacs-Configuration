;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                MAGIT               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; remove last unmerged commit (set as unstaged change)
;; (magit-reset-soft "HEAD~1"))

;; (use-package compat
;;   :defer t
;;   :ensure (compat :type git :host github :repo "emacs-compat/compat"))

(use-package transient
  :defer t
  :ensure (transient :type git :host github :repo "magit/transient"))

(use-package magit
  ;; fixes emacs 29 issue with old transient package (dependency)
  ;; :ensure (:tag "v3.3.0")
  ;; :after compat
  :after transient
  :defer t
  :config
  ;; ;; updates modeline with branch. higher cost than hook
  ;; (setq auto-revert-check-vc-info t
  ;;       auto-revert-interval 10)

  ;; full screen magit
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (setq magit-remote-add-set-remote.pushDefault nil)
  (setopt magit-format-file-function #'magit-format-file-all-the-icons)) ;; for v4.3.0+

(use-package magit-blame-color-by-age
  :ensure (magit-blame-color-by-age :type git :host github :repo "jdtsmith/magit-blame-color-by-age")
  :after magit
  :config (magit-blame-color-by-age-mode))

;; (defadvice vc-git-mode-line-string (after plus-minus (file) compile activate)
;;   (setq ad-return-value
;; 	(concat ad-return-value
;; 		(let ((plus-minus (vc-git--run-command-string
;; 				   file "diff" "--numstat" "--")))
;; 		  (and plus-minus
;; 		       (string-match "^\\([0-9]+\\)\t\\([0-9]+\\)\t" plus-minus)
;; 		       (format " +%s-%s" (match-string 1 plus-minus) (match-string 2 plus-minus)))))))
