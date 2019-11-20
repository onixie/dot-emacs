(require 'gnutls)

(defun dotemacs--remove-scheme (uri)
  (when uri (replace-regexp-in-string "[^/:]+://" "" uri)))

(setq url-proxy-services nil)

(let ((http-proxy (dotemacs--remove-scheme (getenv "http_proxy"))))
  (unless (string-equal "" http-proxy)
    (push (cons "http" http-proxy) url-proxy-services)))

(let ((https-proxy (dotemacs--remove-scheme (getenv "https_proxy"))))
  (unless  (string-equal "" https-proxy)
    (push (cons "https" https-proxy) url-proxy-services)))

(when url-proxy-services
  (setq gnutls-trustfiles (file-expand-wildcards "/etc/ssl/certs/*.pem" t)))

(provide 'setup/proxy)
