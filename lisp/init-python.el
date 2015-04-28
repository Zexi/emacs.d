;; Download required packages
(require-package 'python-mode)
(require-package 'jedi)

(require 'python-mode)

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(set-variable 'py-indent-offset 4)
(define-key py-mode-map (kbd "RET") 'newline-and-indent)

(add-hook 'python-mode-hook 'jedi:ac-setup)

(provide 'init-python)
