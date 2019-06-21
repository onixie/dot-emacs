(require 'setup/package)

(require 'tramp)

(package-install 'docker-tramp)
(require 'docker-tramp)

(package-install 'lxc-tramp)
(require 'lxc-tramp)

(package-install 'lxd-tramp)
(require 'lxd-tramp)

(unless (member system-type '(ms-dos windows-nt))
  (package-install 'vagrant-tramp)
  (require 'vagrant-tramp))

(setq tramp-smb-conf nil)

(add-to-list 'tramp-methods
             '("sshv"
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

(provide 'setup/tramp)
