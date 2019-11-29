
(use-package project
  :config
  (defcustom dot-emacs::project-identifiers (list "Chart.yaml" "pom.xml" "package.json") 
    "Project file in the root directory of the project."
    :type '(repeat :tag "Project File" string)
    :group 'dot-emacs)

  (add-to-list 'project-find-functions (dot-emacs::project-try-find dot-emacs::project-identifiers) t))

(provide 'setup/emacs/project)
