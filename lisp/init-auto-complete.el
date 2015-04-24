;; Download auto-complete required packages
(require-package 'auto-complete)
(require-package 'auto-complete-clang)

;;; auto-complete-mode
(require 'auto-complete-config)
;; Select candidates with C-n/C-p only when completion menu is displayed:
(setq ac-use-menu-map t)
(define-key ac-menu-map "C-n" 'ac-next)
(define-key ac-menu-map "C-p" 'ac-previous)
(ac-config-default)
(setq ac-auto-start t)

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
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
(add-hook 'css-mode-hook 'ac-css-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)

;;clang stuff
(require 'auto-complete-clang)

(provide 'init-auto-complete)
