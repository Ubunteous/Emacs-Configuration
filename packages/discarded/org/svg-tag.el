;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               SVG-TAG              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package svg-tag-mode
  :defer t
  :init (setq svg-tag-mode t)
  :hook ((prog-mode . svg-tag-mode)
         (org-mode . svg-tag-mode))
  :config
  (setq svg-tag-tags
        '(
	  (":TODO:" . ((lambda (tag) (svg-tag-make "TODO"))))
	  (":WIP:" . ((lambda (tag) (svg-tag-make "WIP"))))
	  (":DONE:" . ((lambda (tag) (svg-tag-make "DONE"))))
          )))


;; Agenda fix

;; (defun org-agenda-show-svg ()
;;   (let* ((case-fold-search nil)
;;          (keywords (mapcar #'svg-tag--build-keywords svg-tag--active-tags))
;;          (keyword (car keywords)))
;;     (while keyword
;;       (save-excursion
;;         (while (re-search-forward (nth 0 keyword) nil t)
;;           (overlay-put (make-overlay
;;                         (match-beginning 0) (match-end 0))
;;                        'display  (nth 3 (eval (nth 2 keyword)))) ))
;;       (pop keywords)
;;       (setq keyword (car keywords)))))
;; (add-hook 'org-agenda-finalize-hook #'org-agenda-show-svg)
