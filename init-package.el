(require 'package)
(setq package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/")
     ("elpy" . "http://jorgenschaefer.github.io/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))


;;; this is normally loaded at the end of init; I want it done before
;;; running the -settings files.
(package-initialize)

(defun ensure-packages-installed (&rest packages)
  "Ensure that the given packages are installed with package.el"
  (interactive)
  (dolist (pkg packages)
    (unless (package-installed-p pkg)
      (package-install pkg))))


(provide 'init-package)
