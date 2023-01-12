(use-package no-littering
  :defer t
  :init
  (setq no-littering-etc-directory
	(expand-file-name "files/" user-emacs-directory))
  (setq no-littering-var-directory
	(expand-file-name "files/" user-emacs-directory))
  (require 'no-littering))
