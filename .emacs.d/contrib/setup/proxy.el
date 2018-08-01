(defun setup/proxy--remove-scheme (uri)
  (replace-regexp-in-string "[^/:]+://" "" uri))

(setq url-proxy-services
      `(("http" . ,(setup/proxy--remove-scheme (getenv "http_proxy")))
	("https" . ,(setup/proxy--remove-scheme (getenv "https_proxy")))))

(require 'gnutls)
(setq gnutls-trustfiles (file-expand-wildcards "/etc/ssl/certs/*" t))

(provide 'setup/proxy)
