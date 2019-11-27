(require 'gnutls)

(setq url-proxy-services nil)

(let ((http-proxy (dot-emacs::remove-scheme (or (getenv "http_proxy") (getenv "HTTP_PROXY")))))
  (unless (string-equal "" http-proxy)
    (push (cons "http" http-proxy) url-proxy-services)))

(let ((https-proxy (dot-emacs::remove-scheme (or (getenv "https_proxy") (getenv "HTTPS_PROXY")))))
  (unless  (string-equal "" https-proxy)
    (push (cons "https" https-proxy) url-proxy-services)))

(setq gnutls-trustfiles (file-expand-wildcards "/etc/ssl/certs/*.pem" t))

(provide 'setup/base/proxy)
