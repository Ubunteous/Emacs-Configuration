;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               TABS                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; CHECK CENTAUR-TABS-BUFFER GROUPS ON GIT
(use-package centaur-tabs
  :defer t
  :demand
  ;; :hook emacs-startup
  :hook (prog-mode . centaur-tabs-mode)
  :config
  (centaur-tabs-headline-match)
  (setq
   ;;centaur-tabs--buffer-show-groups t
   centaur-tabs-set-icons t
   centaur-tabs-set-bar 'over
   centaur-tabs-style "bar"
   centaur-tabs-modified-marker "*")

  (setq centaur-tabs-ace-jump-keys
	'(?& ?é ?\" ?\' ?\( ?- ?è ?_ ?ç))
  :general
  ("C-c j" 'centaur-tabs-ace-jump))
