;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               MESSAGE              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package message
  :ensure nil
  :defer t
  :init
  (defun delete-duplicate-multi-messages (message)
	"Uniq on the set of previous messages."
	(setq multi-message-list
		  (seq-remove (lambda (m)
						;; Alternative logic:
						;; (equal (aref m 1) message)
						;; Remove a message that is part of previous one
						;; or vice versa when it's a superset.
						(or (string-search (aref m 1) message)
							(string-search message (aref m 1))))
					  multi-message-list))
	message)

  (defun set-multi-message-with-exceptions (message)
	(if (or (string-match-p "\\*Calendar\\*" (buffer-name))
			(bound-and-true-p edebug-active))
		message
	  (set-multi-message message)))

  (when (boundp 'set-message-functions)
	(setq set-message-functions '(inhibit-message
								  delete-duplicate-multi-messages
								  set-multi-message-with-exceptions
								  set-minibuffer-message)))

  ;; ;; Inhibit some useless messages completely:
  ;; (when (boundp 'inhibit-message-regexps)
  ;;   (add-to-list 'inhibit-message-regexps "^Finding changes")
  ;;   (add-to-list 'inhibit-message-regexps "^Saving")
  ;;   (add-to-list 'inhibit-message-regexps "^Mark set$")
  ;;   (add-to-list 'inhibit-message-regexps "^Mark saved where search started$")
  ;;   (add-to-list 'inhibit-message-regexps "^Omit\\|omit)$")
  ;;   (add-to-list 'inhibit-message-regexps "^Garbage collecting"))
  )
