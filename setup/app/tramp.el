
(use-package tramp
	     :config 
	     (setq tramp-smb-conf nil)

	     (add-to-list 'tramp-methods
			  '("ssh"
			    (tramp-login-program        "ssh")
			    (tramp-login-args           (("-l" "%u") ("-p" "%p") ("%c")
							 ("-e" "none") ("%h") ("-o" "UserKnownHostsFile=/dev/null") ("-o" "StrictHostKeyChecking=no")))
			    (tramp-async-args           (("-q")))
			    (tramp-remote-shell         "/bin/sh")
			    (tramp-remote-shell-login   ("-l"))
			    (tramp-remote-shell-args    ("-c"))))

	     (add-to-list 'tramp-methods
			  '("netns"
			    (tramp-login-program        "sudo")
			    (tramp-login-args           (("-u" "%u") ("/sbin/ip netns exec") ("%h") ("/bin/sh")))
			    (tramp-remote-shell         "/bin/sh")
			    (tramp-remote-shell-login   ("-l"))
			    (tramp-remote-shell-args    ("-c"))))

	     (add-to-list 'tramp-methods
			  '("nixsh"
			    (tramp-login-program        "nix-shell")
			    (tramp-login-args           (("-p") ("%h") ("--run /bin/sh")))
			    (tramp-remote-shell         "env PATH=$_PATH:$PATH /bin/sh")
			    (tramp-remote-shell-login   ("-l"))
			    (tramp-remote-shell-args    ("-c"))))
	     )

(use-package docker-tramp
	     :ensure t)

(use-package lxc-tramp
	     :ensure t)

(use-package lxd-tramp
	     :ensure t)

(use-package vagrant-tramp
	     :if (not (member system-type '(ms-dos windows-nt)))
	     :ensure t)

(provide 'setup/app/tramp)
