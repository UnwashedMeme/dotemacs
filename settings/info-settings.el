;;; Commentary: I'm honestly not all that sure what this does but the
;;; config all of this is based on had
;;; it... https://github.com/DarwinAwardWinner/dotemacs/blob/master/site-lisp/init.el

(defun add-init-path-to-info-path ()
  "Add the subdirectories of init-path that contain info directory
files to the Info-directory-list.  This can safely be run many times
in a session, without adding multiple copies of the directories.  The
new directories are prepended to emacs's initial Info path."
  (interactive)
  (setq Info-directory-list (append (find-subdirs-containing init-path "^dir$") initial-info-path)))



(defun add-info-dir-files-to-path (tree)
  "Add all the info files under TREE to info \"dir\" files"
  (let* ((info-regex "\\.info$")
         (info-dirs (find-subdirs-containing tree info-regex)))
    (mapcar (lambda (dir)
              (dolist (file (directory-files dir t info-regex))
                (call-process "install-info" nil nil nil
                              (format "--dir-file=%s/dir" dir)
                              (format "--info-file=%s" file))))
            info-dirs)))

;;; Create dir files for any info files in the init-path
(add-info-dir-files-to-path init-path)

;;; Add the init-path tree to the Info path
(require 'info)
(info-initialize)
(setq initial-info-path Info-directory-list)
(add-init-path-to-info-path)

(provide 'info-settings)
