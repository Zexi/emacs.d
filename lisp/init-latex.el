(require-package 'auctex)
;;(require-package 'auto-complete-auctex)
(require-package 'company-auctex)
(require 'company-auctex)
(company-auctex-init)

(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTex-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq Tex-save-query nil)
(setq Tex-PDF-mode t)

(provide 'init-latex)
