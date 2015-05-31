;; octave-mode
(require-package 'ac-octave)

(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))
(setq-default octave-blink-matching-block t)
(setq-default octave-block-offset 4)
(setq-default octave-continuation-offset 4)
(setq-default octave-continuation-string "\\")

(require 'ac-octave)
(defun ac-octave-mode-setup ()
  (setq ac-sources '(ac-source-octave)))
(add-hook 'octave-mode-hook
          '(lambda () (ac-octave-mode-setup)))

(provide 'init-octave)

