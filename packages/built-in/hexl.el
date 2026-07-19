;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                HEXL                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package hexl
  :ensure nil
  :defer t
  :bind (:map hexl-mode-map
			  ("C-t" . hexadecimal-to-decimal)))

(defun decimal-to-hexadecimal ()
  (interactive)
  (let (xbeg xend xinput)
	(skip-chars-backward "0-9")
	(setq xbeg (point))
	(skip-chars-forward "0-9")
	(setq xend (point))
	(setq xinput (buffer-substring-no-properties xbeg xend))
	;; (delete-region xbeg xend)
	;; (insert (format "%x" (string-to-number xinput)))

	(message
	 "%s
Hexadecimal is: %x
Decimal is: %d"
	 this-command
	 (string-to-number xinput)
	 (string-to-number xinput))))

(defun hexadecimal-to-decimal ()
  (interactive)
  (let (xbeg xend)
	(if (region-active-p)
		(setq xbeg (region-beginning) xend (region-end))
	  (progn
		(save-excursion
		  (skip-chars-backward "[:xdigit:]#x")
		  (setq xbeg (point))
		  (skip-chars-forward "[:xdigit:]#x")
		  (setq xend (point)))))
	(when (eq xbeg xend) (user-error "%s error, input is empty." this-command))

	(let ((xnum (let ((case-fold-search nil))
				  (replace-regexp-in-string "\\`0x\\|\\`#x\\|\\`#" "" (buffer-substring-no-properties xbeg xend)))))
	  (message
	   "%s
Hexadecimal is: %s
Decimal is: %d"
	   this-command
	   xnum (string-to-number xnum 16)))))

;; (defun view-byte-array (format)
;;   "View the current file in od dump"
;;   (interactive "sFormat Code: ")
;;   (let* (($outputbuffer "*od dump*")
;;          ($fname (buffer-file-name))
;;          $cmdStr)
;;     (setq $cmdStr (concat "od --endian=big -t " format " \""   $fname "\" &"))
;;     (message "Running %s" $cmdStr)
;;     (shell-command $cmdStr $outputbuffer)))
