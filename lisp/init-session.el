(require-package 'session)
;;session restore
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(load "desktop")
(desktop-load-default)
;;(desktop-read)
(desktop-save-mode t)
(provide 'init-session)
