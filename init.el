
(setq init-path (expand-file-name "~/.emacs.d/"))

(setq generated-autoload-file "~/.emacs.d/loaddefs.el")
(load "~/.emacs.d/loaddefs.el")


(setq init-packages-path (expand-file-name "site-lisp" init-path)
      init-settings-path (expand-file-name "settings" init-path)
      init-persistence-path (expand-file-name "persistence" init-path))



(defun find-subdirs-containing (dir pattern)
  "Return a list of all deep subdirectories of DIR that contain files
that match PATTERN."
  (let* ((ret nil)
         (files (directory-files dir))
         (max-lisp-eval-depth 3000))
    (while files
      (let* ((file (car files))
             (path (expand-file-name file dir)))
        (if (and (file-directory-p path)
                 (not (string-match "^\\.+" file)))
            (setq ret (append ret (find-subdirs-containing path pattern)))
          (if (string-match pattern file)
              (add-to-list 'ret dir))))
      (setq files (cdr files)))
    ret))

(defun byte-recompile-init-path ()
  "Recompile all the .el files under init-packages-path, if they're
not up to date.  This can be run from the command line with:
$ emacs -l ~/.emacs -batch -f byte-recompile-init-path"
  (interactive)
  (dolist (dir (find-subdirs-containing init-packages-path "\\.el$"))
    (byte-recompile-directory dir 0)))

(defun add-init-path-to-load-path ()
  "Add the subdirectories of init-path that contain elisp files to the
load-path.  This can safely be run many times in a session, without
adding multiple copies of the directories.  The new directories are
prepended to emacs's initial load-path."
  (interactive)
  (setq load-path (append (find-subdirs-containing init-settings-path "\\.el$")
                          (find-subdirs-containing init-packages-path "\\.el$")
                          initial-load-path)))


;;; Add the init-path tree to the load-path
(setq initial-load-path load-path)
(add-init-path-to-load-path)



;;; get some misc elisp fns that are used in the rest of setup
(require 'elisp-helpers)   ; in ./site-list/elisp-helpers.el

;; get package.el configured and loaded
(load (expand-file-name "init-package" init-path))

(require 'settings-management)
;;; Load ~/elisp/settings/*-settings.el, in sorted order.
(dolist (file (directory-files init-settings-path t "-settings\\.el$"))
  (with-demoted-errors
      (load-file file)))

(message "Finished all settings files.")

(setq custom-file (expand-file-name "custom.el" init-path))
(when (file-readable-p custom-file) (load-file custom-file))

(provide 'init)
