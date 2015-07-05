(require-package 'helm-w3m)
;;(setq w3m-home-page "http://www.baidu.com")
;; display image
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)
;; use cookies
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
(setq browse-url-browser-function 'w3m-browse-url)                
(setq w3m-view-this-url-new-session-in-background t)

(provide 'init-w3m)
