(defvar dif-mode-font-lock-keywards
  '(("//.*" . font-lock-comment-face)	;Comment
    ("^[[:space:]]*#include" (0 font-lock-preprocessor-face) ("<[^<>]*>\\|\"[^\"]*\"" nil nil (0 font-lock-string-face))) ;Include Directive
    ("\\(\\$\\)\\([a-z0-9_]+\\)" (1 font-lock-warning-face) (2 font-lock-constant-face)) ;Constant substitution
    ("\"<<[^\"]*\"" . font-lock-string-face) ;For PS command in Option directives
    ("\\(\"\\)\\([a-z0-9_]+\\)\\(/\\)\\([^/\"]+\"\\)" (1 font-lock-string-face) (2 font-lock-variable-name-face) (3 font-lock-warning-face) (4 font-lock-string-face)) ;Option name and text in string
    ("\\([a-z0-9_]+\\)\\(/\\)\\([^/\" \t]+\\)" (1 font-lock-variable-name-face) (2 font-lock-warning-face) (3 font-lock-string-face)) ;Option name and text 
    ("^[[:space:]]*\\(#define\\|#media\\y|#font\\|#po\\)" (1 font-lock-preprocessor-face) ("\\(\\<[a-z0-9_]+\\>\\).*" nil nil (1 font-lock-constant-face))) ;Directives
    ("\"[^\"]*\"" . font-lock-string-face) ;Normal strings
    ("^[[:space:]]*\\(\\*?\\)\\(\\<Attribute\\|Choice\\|ColorDevice\\|ColorModel\\|ColorProfile\\|Copyright\\|CustomMedia\\|Cutter\\|Darkness\\|DriverType\\|Duplex\\|Filter\\|Finishing\\|Font\\|Group\\|HWMargins\\|InputSlot\\|Installable\\|ManualCopies\\|Manufacturer\\|MaxSize\\|MinSize\\|MediaSize\\|MediaType\\|ModelName\\|ModelNumber\\|Option\\|PCFileName\\|Resolution\\|SimpleColorProfile\\|Throughput\\|UIConstraints\\|VariablePaperSize\\|Version\\>\\)" (1 font-lock-warning-face) (2 font-lock-keyword-face) ("\\<\\(custom\\|ps\\|pcl\\|escp\\|none\\|normal\\|flip\\|Special\\|Standard\\|Expert\\|ROM\\|Disk\\|General\\|InstallableOptions\\|no\\|yes\\|gray\\|w\\|k\\|rgb\\|rgba\\|cmyk\\|black\\|chunky\\|chunked\\|planar\\|banded\\|pickone\\|pickmany\\|boolean\\|documentsetup\\|pagesetup\\|anysetup\\)\\>" nil nil (1 font-lock-variable-name-face))) ;Directives
    ))

(defvar dif-mode-map 
  (let ((map (make-sparse-keymap)))
    map)
  "Keymap for dif-mode")

(define-derived-mode dif-mode nil "DriverInfo" 
  "Mode for Driver Information File which is source files for CUPS' PPDC"
  (set (make-local-variable 'font-lock-defaults) '((dif-mode-font-lock-keywards) t t)))

(add-to-list 'auto-mode-alist (cons "\\.drv\\'"  'dif-mode))

(provide 'cups-dif)
