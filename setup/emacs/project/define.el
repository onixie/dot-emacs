;;; -*- lexical-binding: t; -*-

(defcustom dot-emacs::project-identifiers (list "Chart.yaml" "pom.xml" "package.json") 
  "Project file in the root directory of the project."
  :type '(repeat :tag "Project File" string)
  :group 'dot-emacs)

(defun dot-emacs::project-try-find (identifiers)
  (cl-labels ((parent-directory (path)
                                (let ((parent (file-name-directory (directory-file-name path))))
                                  (unless (string-equal path parent)
                                    parent)))
              (find-project (path)
                            (when path
                              (if (cl-intersection (directory-files path) identifiers :test #'string-equal)
                                  (cons 'transient path)
                                (find-project (parent-directory path))))
                            ))
    #'find-project))

(provide 'setup/emacs/project/define)
