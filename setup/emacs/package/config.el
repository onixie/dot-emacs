(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(when (< emacs-major-version 27)
  (package-initialize))

(dot-emacs::funcall-after #'package-refresh-contents dot-emacs:package-refresh-interval)

(package-install 'use-package t)

(use-package exec-path-from-shell :ensure t :if (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize))

(use-package system-packages :ensure t
  :custom
  (system-packages-package-manager 'nix))

(use-package use-package-ensure-system-package :ensure t)

(provide 'setup/emacs/package/config)
