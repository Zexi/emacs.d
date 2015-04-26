;; Download auto-complete required packages
(require-package 'auto-complete)
(require-package 'auto-complete-clang)
(require-package 'auto-complete-c-headers)

;;; auto-complete-mode
(require 'auto-complete-config)
;; Select candidates with C-n/C-p only when completion menu is displayed:
(setq ac-use-menu-map t)
(define-key ac-menu-map "C-n" 'ac-next)
(define-key ac-menu-map "C-p" 'ac-previous)
(ac-config-default)
(setq ac-auto-start nil)

(defun ac-auto-enable()
  (interactive)
  (setq ac-auto-start t)
  (message "ac-auto-start enable."))
(defun ac-auto-disable()
  (interactive)
  (setq ac-auto-start nil)
  (message "ac-auto-start disable!"))

(setq ac-quick-help-delay 0.5)
(setq ac-candidate-limit 100)
(setq ac-use-fuzzy 1.5)
(setq ac-show-menu-immediately-on-auto-complete t)
(setq ac-expand-on-auto-complete nil)
(setq ac-quick-help-height 20)
(setq ac-menu-height 20)
;; (ac-set-trigger-key "TAB")
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
(define-key ac-mode-map  [(control tab)] 'auto-complete)
(setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers ac-source-filename ))
(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
(add-hook 'css-mode-hook 'ac-css-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)

;;clang stuff
(require 'auto-complete-clang)

(defun my:ac-c-mode-setup ()
  (setq ac-clang-flags
        (mapcar(lambda (item)(concat "-I" item))
               (split-string
                "
 /usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/c++/4.9.2
 /usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/c++/4.9.2/x86_64-unknown-linux-gnu
 /usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/c++/4.9.2/backward
 /usr/local/include
 /usr/bin/../lib/clang/3.6.0/include
 /usr/include

")))
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))

(defun my:ac-c-headers-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/c++/4.9.2")
  (add-to-list 'achead:include-directories '"/usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/c++/4.9.2/x86_64-unknown-linux-gnu")
  (add-to-list 'achead:include-directories '"/usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/c++/4.9.2/backward")
  (add-to-list 'achead:include-directories '"/usr/local/include")
  (add-to-list 'achead:include-directories '"/usr/bin/../lib/clang/3.6.0/include")
  (add-to-list 'achead:include-directories '"/usr/include"))

(add-hook 'c-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-mode-setup)
(setq ac-disable-faces nil)
(global-auto-complete-mode t)

(provide 'init-auto-complete)
