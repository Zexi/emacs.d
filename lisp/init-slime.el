(require-package 'slime)
(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime)
(slime-setup '(slime-fancy))
(provide 'init-slime)
