;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            ALL-THE-ICONS           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package all-the-icons
  ;; do not defer it or dashboard and the packages below won't load
  ;; :defer t
  :if (display-graphic-p)
  :config
  (add-to-list 'all-the-icons-extension-icon-alist '("gd" all-the-icons-fileicon "godot" :face all-the-icons-blue))
  (add-to-list 'all-the-icons-extension-icon-alist '("cljs" all-the-icons-alltheicon "clojure" :face all-the-icons-dblue))

  ;; file: icon and color can be changed
  ;; (add-to-list 'all-the-icons-regexp-icon-alist '("^test\\.test$" all-the-icons-fileicon "test-coffeescript" :height 1.0 :v-adjust 0.0 :face all-the-icons-yellow))

  ;; dir: only icon can change. colour will default to all-the-icons-dired-dir-face
  ;; (add-to-list 'all-the-icons-dir-icon-alist '("test" all-the-icons-octicon "code" :face all-the-icons-dred :height 0.9)) 
  )

;;(all-the-icons-icon-for-dir "file-directory"
;;:face '((t (:foreground "SteelBlue3")))))

(use-package all-the-icons-completion
  :defer t
  ;; main repo abandoned. this fork has a fix for marginalia compatibility
  ;; :ensure (all-the-icons-completion :type git :host github :repo "maxecharel/all-the-icons-completion")
  :after (all-the-icons marginalia) ;; selectrum/vertico
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init (all-the-icons-completion-mode)
  :custom-face (all-the-icons-completion-dir-face ((t (:foreground "SteelBlue3"))))
  :config
  ;; fix for vertico
  (define-minor-mode all-the-icons-completion-mode
    "Add icons to completion candidates."
    :global t
    (if all-the-icons-completion-mode
  	(advice-add (compat-function completion-metadata-get) :around #'all-the-icons-completion-completion-metadata-get)
      (advice-remove (compat-function completion-metadata-get) #'all-the-icons-completion-completion-metadata-get))))


(use-package all-the-icons-ibuffer
  :defer t
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))


(use-package all-the-icons-dired
  :defer t
  :after (all-the-icons dired)
  :hook (dired-mode . all-the-icons-dired-mode)
  :diminish all-the-icons-dired-mode
  :config
  (setq all-the-icons-dired-monochrome nil)
  :custom-face (all-the-icons-dired-dir-face ((t (:foreground "SteelBlue3")))))
