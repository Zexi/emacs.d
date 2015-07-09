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

;; Syntax highlighting for systemd files
(add-to-list 'auto-mode-alist '("\\.service\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.timer\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.target\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.mount\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.automount\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.slice\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.socket\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.path\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.netdev\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.network\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.link\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.automount\\'" . conf-unix-mode))

;; install smart-compile for c/c++ compile
(require-package 'smart-compile)

(provide 'init-misc)
