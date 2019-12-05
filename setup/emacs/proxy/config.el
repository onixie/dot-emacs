(require 'gnutls)
(setq gnutls-trustfiles (file-expand-wildcards "/etc/ssl/certs/*.pem" t))

(require 'url-vars)
(let ((http-proxy  (dot-emacs::remove-scheme (or (getenv "http_proxy")  
						 (getenv "HTTP_PROXY"))))
      (https-proxy (dot-emacs::remove-scheme (or (getenv "https_proxy") 
						 (getenv "HTTPS_PROXY")))))
  (when http-proxy  (push (cons "http"  http-proxy)  url-proxy-services))
  (when https-proxy (push (cons "https" https-proxy) url-proxy-services)))

(provide 'setup/emacs/proxy/config)
