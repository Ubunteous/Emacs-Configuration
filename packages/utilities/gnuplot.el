;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               GNUPLOT              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package gnuplot
  :defer t
  :config
  ;; gnuplot-insertions may be worth configuring

  ;; only complete commands related to current mode (recommended)
  ;; ;; (setq read-extended-command-predicate #'command-completion-default-include-p)

  ;; ;; Useful functions
  ;; run-gnuplot/gnuplot-make-buffer
  ;; gnuplot-show-coming-buffer
  ;; gnuplot-send-file/line-to-gnuplot(-and-forward/newline)
  ;; gnuplot-send-buffer/region-to-gnuplot
  ;; gnuplot-context-help/info-at-point
  ;; gnuplot-save-and-plot-from-comint

  )
