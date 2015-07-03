(require-package 'company)
(require-package 'irony)
(require-package 'company-irony)
(require-package 'company-c-headers)

(require 'company)
(require 'company-c-headers)

(setq company-backends (delete 'company-semantic company-backends))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; ;; (optional) adds CC special commands to `company-begin-commands' in order to
;; ;; trigger completion at interesting places, such as after scope operator
;; ;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; activate it globally
(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'company-backends 'company-c-headers)
(setq command "echo | g++ -v -x c++ -E - 2>&1 |
		grep -A 20 starts | grep ' /usr/.*'")
(setq headers-path (split-string (shell-command-to-string command)))
(defun add-libs-header(list)
  (while list
    (add-to-list 'company-c-headers-path-system (car list))
    (setq list (cdr list))))
(add-libs-header headers-path)

;; comany-mode completion back-end for company-robe buffers
(eval-after-load 'company
    '(push 'company-robe company-backends))

;; backend for python
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)

(provide 'init-company)
