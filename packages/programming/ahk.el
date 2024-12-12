;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 AHK                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ahk-mode
  :defer t
  :config
  (defun ahk-lookup-web ()
    "Look up current word in AutoHotkey's reference doc.
Launches default browser and opens the doc's url."
    (interactive)
    (let* ((acap (ahk-command-at-point))
           (url (concat
		 "https://www.autohotkey.com/docs/v2/lib/" acap ".htm")))
      (browse-url url))))
