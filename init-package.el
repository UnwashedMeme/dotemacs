(require 'package)
(setq package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/")
     ("elpy" . "http://jorgenschaefer.github.io/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))


(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(defun ensure-packages-installed (&rest packages)
  "Ensure that the given packages are installed with package.el"
  (interactive)
  (dolist (pkg packages)
    (unless (package-installed-p pkg)
      (package-install pkg))))


(provide 'init-package)
