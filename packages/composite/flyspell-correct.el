;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          FLYSPELL-CORRECT          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; like jinx. probably a bit cleaner since it uses flyspell but not updated in two years
(use-package flyspell-correct
  :after flyspell
  :general
  :general (:keymaps 'flyspell-mode-map
					 ;; shadows ispell-word
					 ;; it can show options as a drop down list with popup package
					 "M-$" 'flyspell-correct-wrapper))
