(use-package centaur-tabs :ensure t
  :custom
  (centaur-tabs-style "wave")
  (centaur-tabs-set-modified-marker t)
  (centaur-tabs-set-icons t)
  (centaur-tabs-cycle-scope 'tabs)
  :config
  (advice-add 'centaur-tabs-project-name  :around #'dot-emacs::centaur-tabs-project-name)
  (advice-add 'centaur-tabs-buffer-groups :around #'dot-emacs::centaur-tabs-buffer-groups)
  (advice-add 'centaur-tabs-hide-tab      :around #'dot-emacs::centaur-tabs-hide-tab)

  (centaur-tabs-change-fonts "Ubuntu Mono" 120)
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t)

  (dot-emacs::centaur-tabs-show-groups))

(provide 'setup/emacs/tabs/config)
