(require 'project)

(defvar project-identifiers (list "Chart.yaml" "pom.xml" "package.json"))

(defun parent-directory (dir)
  (unless (equal "/" dir)
    (file-name-directory (directory-file-name dir))))

(defun project-try-general (dir)
  (when dir
    (if (cl-intersection (directory-files dir) project-identifiers :test #'string-equal)
        (cons 'transient dir)
      (project-try-general (parent-directory dir)))))

(setq project-find-functions (list #'project-try-vc #'project-try-general))
