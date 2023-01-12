;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            CURSOR-COLOR            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; colors from: https://github.com/ozh/github-colors

(defvar major-mode-colors
  '((fundamental-mode . "#fefff8")
    (python-mode . "#3572A5")
    (emacs-lisp-mode . "#c065db")
    (latex-mode . "#3D6117")
    (org-mode . "#77aa99")))

(defun cursor-major-color ()
  "Update my cursor with COLOR when changing mode."
  (let ((mode-color (assoc major-mode major-mode-colors)))
    (if mode-color
	;; mode color (matches github language color)
	(set-cursor-color (cdr mode-color))
      ;; default color
      (set-cursor-color "#fefff8"))))

(defadvice select-window (after select-window activate) 
  (cursor-major-color))
