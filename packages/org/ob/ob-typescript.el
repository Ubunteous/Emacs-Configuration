;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            OB-TYPESCRIPT           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'ob)

;; optionally define a file extension for this language
(add-to-list 'org-babel-tangle-lang-exts '("typescript-ts" . "ts"))

;; optionally declare default header arguments for language
(defvar org-babel-default-header-args:typescript-ts '())

;; utilities
(defvar org-babel-command-runner:typescript-ts "bun")
(defun ob-typescript--build-script-run-command (path)
  "Create run command according to the PATH."
  (format "%s run %s" org-babel-command-runner:typescript-ts path))

(defun org-babel-execute:typescript-ts (body params)
  (let* ((processed-params (org-babel-process-params params))
         (src-temp (org-babel-temp-file "typescript-src-" ".tsx")))
    (with-temp-file src-temp (insert body))
    (let ((results (org-babel-eval (ob-typescript--build-script-run-command src-temp) "")))
      (org-babel-reassemble-table
       (org-babel-result-cond (cdr (assoc :result-params params))
         (org-babel-read results)
         (let ((tmp-file (org-babel-temp-file "c-")))
           (with-temp-file tmp-file (insert results))
           (org-babel-import-elisp-from-file tmp-file)))
       (org-babel-pick-name
        (cdr (assoc :colname-names params)) (cdr (assoc :colnames params)))
       (org-babel-pick-name
        (cdr (assoc :rowname-names params)) (cdr (assoc :rownames params)))))))

(provide 'ob-typescript)
;;; ob-typescript.el ends here
