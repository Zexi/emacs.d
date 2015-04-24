;;;PACKAGE el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;;; add-to-list to load
(add-to-list 'load-path "~/.emacs.d/custom")

;;; misc configure
(defalias 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
(set-scroll-bar-mode nil)
(tool-bar-mode 0)
(menu-bar-mode 0)
(global-linum-mode t)
(winner-mode t)
(ido-mode t)

;;; PACKAGE helm configure
(require 'setup-helm)

;; editing style configure
(require 'setup-editing)

;; Package window-numbering
(require 'window-numbering)
(window-numbering-mode 1)

;; customize theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
