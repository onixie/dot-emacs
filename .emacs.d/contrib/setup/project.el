(require 'project)

(defcustom dotemacs-project-identifiers (list "Chart.yaml" "pom.xml" "package.json") 
  "Project file in the root directory of the project."
  :type '(repeat :tag "Project File" string)
  :group 'dotemacs)

(defun dotemacs--project-try-identifiers (path)
  (cl-labels ((parent-directory (path)
                                (let ((parent (file-name-directory (directory-file-name path))))
                                  (unless (string-equal path parent)
                                    parent))))
    (when path
      (if (cl-intersection (directory-files path) dotemacs-project-identifiers :test #'string-equal)
          (cons 'transient path)
        (dotemacs--project-try-identifiers (parent-directory path))))))

(add-to-list 'project-find-functions #'dotemacs--project-try-identifiers t)

(provide 'setup/project)
