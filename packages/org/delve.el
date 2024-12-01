;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                DELVE               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package delve
  ;; :straight (:repo "publicimageltd/delve" :host github :type git)
  :ensure (:repo "publicimageltd/delve" :host github :type git)
  :after (org-roam)
  ;; this is necessary if use-package-always-defer is true
  :demand t
  :general
  ;; "C-c r d" 'delve-index
  ;; ("<f12>" 'delve)
  :config
  ;; set meaningful tag names for the dashboard query
  (setq delve-dashboard-tags '("Index" "Scene" "Character" "Worldbuilding"))

  ;; optionally turn on compact view as default
  (add-hook #'delve-mode-hook #'delve-compact-view-mode)

  ;; turn on delve-minor-mode when Org Roam file is opened:
  (delve-global-minor-mode)

  (setq delve-storage-paths "~/org/Alter/.delve/")

  ;; (setq delve-dashboard-tags '("relevant"))
  ;; (setq delve-last-modified-limit)
  )

(defun delve-index ()
  (interactive)
  "Delve into org-roam index."

  (unless delve-global-minor-mode
    (delve-global-minor-mode))

  (let ((buf "DELVE Zettel imported from 'index.delve'"))
    (if (get-buffer buf)
	(switch-to-buffer buf)
      (switch-to-buffer (delve--get-collection-buffer "~/org/Alter/.delve/index.delve")))))
