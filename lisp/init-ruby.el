(require-package 'robe)
(require-package 'inf-ruby)

;; robe
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
;(autoload 'ac-robe-setup "ac-robe" "auto-complete robe" nil nil)
(add-hook 'ruby-mode-hook 'robe-mode)
;(add-hook 'robe-mode-hook 'ac-robe-setup)

(add-to-list 'auto-mode-alist
             '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

(require 'inf-ruby)
;;(define-key inf-ruby-minor-mode (kbd "C-c C-z") 'run-ruby)
(when (executable-find "pry")
  (add-to-list 'inf-ruby-implementations '("pry" . "pry"))
  (setq inf-ruby-default-implementation "pry"))

(when (require 'smartparens nil 'noerror)
  (require 'smartparens-ruby))

(provide 'init-ruby)
