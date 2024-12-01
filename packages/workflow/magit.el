;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                MAGIT               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; remove last unmerged commit (set as unstaged change)
;; (magit-reset-soft "HEAD~1"))

;; git porcelaine
(use-package magit
  ;; fixes emacs 29 issue with old transient package (dependency)
  :ensure (:tag "v3.3.0")
  :defer t
  :config
  ;; ;; updates modeline with branch. higher cost than hook
  ;; (setq auto-revert-check-vc-info t
  ;;       auto-revert-interval 10)

  ;; full screen magit
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (setq magit-remote-add-set-remote.pushDefault nil))


;; (defadvice vc-git-mode-line-string (after plus-minus (file) compile activate)
;;   (setq ad-return-value
;; 	(concat ad-return-value
;; 		(let ((plus-minus (vc-git--run-command-string
;; 				   file "diff" "--numstat" "--")))
;; 		  (and plus-minus
;; 		       (string-match "^\\([0-9]+\\)\t\\([0-9]+\\)\t" plus-minus)
;; 		       (format " +%s-%s" (match-string 1 plus-minus) (match-string 2 plus-minus)))))))
