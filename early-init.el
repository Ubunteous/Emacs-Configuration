;;; early-init.el --- early bird  -*- no-byte-compile: t -*-
;;; Commentary:
;;; Code:

;; straight.el replaces package.el
(setq package-enable-at-startup nil)

;; ;; Set eln-cache dir (does not work)
;; (when (boundp 'native-comp-eln-load-path)
;;   (startup-redirect-eln-cache (expand-file-name "files/eln-cache/" user-emacs-directory)))

;; set eln-cache dir (new attempt)
(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name  "files/eln-cache/" user-emacs-directory))))

;; More speed improvements: https://github.com/hlissner/doom-emacs/blob/develop/docs/faq.org#how-does-doom-start-up-so-quickly

;;; early-init.el ends here
