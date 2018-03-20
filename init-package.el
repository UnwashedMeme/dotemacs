(require 'package)

(setq package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
;     ("marmalade" . "https://marmalade-repo.org/packages/")
     ("elpy" . "http://jorgenschaefer.github.io/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))

(defun ensure-packages-installed (&rest packages)
  "Ensure that the given packages are installed with package.el"
  (interactive)
  (dolist (pkg packages)
    (unless (package-installed-p pkg)
      (package-install pkg))))

(ensure-packages-installed 'use-package)

(eval-when-compile
  (require 'use-package))



(provide 'init-package)
