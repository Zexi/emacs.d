;;; misc configure
(defalias 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
(set-scroll-bar-mode nil)
(tool-bar-mode 0)
(menu-bar-mode 0)
(global-linum-mode t)
(winner-mode t)
(ido-mode t)

;; Package window-numbering
(require-package 'window-numbering)
(require 'window-numbering)
(window-numbering-mode 1)

(provide 'init-misc)
