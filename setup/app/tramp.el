(use-package tramp
  :custom
  (tramp-smb-conf nil)
  :config
  (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='~/.ssh-tramp.%%C' -o ControlPersist=no")
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)

  (add-to-list 'tramp-methods
	           '("ssh"
		         (tramp-login-program        "ssh")
		         (tramp-login-args           (("-l" "%u") ("-p" "%p") ;("%c")
					                          ("-o" "UserKnownHostsFile=/dev/null") ("-o" "StrictHostKeyChecking=no") ("-e" "none") ("%h")))
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
		         (tramp-remote-shell         "env PATH=$HOST_PATH:$PATH /bin/sh")
		         (tramp-remote-shell-login   ("-l"))
		         (tramp-remote-shell-args    ("-c"))))

  (add-to-list 'tramp-methods
               '("sudosu"
                 (tramp-login-program        "sudo")
                 (tramp-login-args           (("-p" "P\"\"a\"\"s\"\"s\"\"w\"\"o\"\"r\"\"d\"\":")
                                              ("/bin/su -") ("%u")))
		         (tramp-remote-shell         "/bin/sh")
                 (tramp-remote-shell-login   ("-L"))
                 (tramp-remote-shell-args    ("-c"))))
  )

(use-package lxc-tramp     :ensure t)
(use-package lxd-tramp     :ensure t)
(use-package docker-tramp  :ensure t)
(use-package vagrant-tramp :ensure t :if (not (member system-type '(ms-dos windows-nt))))

(provide 'setup/app/tramp)
