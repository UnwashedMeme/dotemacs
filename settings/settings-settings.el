;;;;;;;; Managing Settings Files ;;;;;;;;

(defun directory-list-recursive (dir &optional hidden)
  "Return a list of DIR and all of its subdirectories, recursively.

If HIDDEN is t, include hidden directories. Paths returned are
all absolute. if DIR is a file, an empty list is returned."
  (when (file-directory-p dir)
    (directory-list-recursive-internal (expand-file-name dir) hidden)))

(defun directory-list-recursive-internal (dir hidden)
  "Don't use this function directly. See `directory-list-recursive'."
  (assert (file-name-absolute-p dir))
  (let ((subdirs (remove-if-not (lambda (subdir)
                                  (and (file-directory-p subdir)
                                       (not (member (file-name-nondirectory subdir) '("." "..")))))
                                (directory-files dir 'full nil 'nosort))))
    (when (not hidden)
      (setq subdirs
            (remove-if (lambda (subdir)
                         (string= "." (substring (file-name-nondirectory subdir) 0 1)))
                       subdirs)))
    (cons dir (mapcan (lambda (subdir) (directory-list-recursive-internal subdir hidden))
                      subdirs))))

(defun clean-stale-elc-files (dir &optional recursive hidden)
  "Delete elc files in DIR that do not have corresponding el files."
  (dolist (dir (if recursive
                   (directory-list-recursive dir hidden)
                 (list dir)))
    (dolist (elc (directory-files dir 'full "\\.elc$" 'nosort))
      (unless (file-exists-p (concat (file-name-sans-extension elc) ".el"))
        (message "Cleaning stale elc file %s" elc)
        (delete-file elc)))))

(defun settings-file-stems ()
  "Return a list of names of settings file name stems.

The trailing `-settings.el' in the file name will be removed,
leaving only the unique part of the file name."
  (mapcar (apply-partially 'replace-regexp-in-string "-settings.el$" "")
          (remove-if-not (apply-partially 'string-match-p "-settings.el$")
                         (remove-if (apply-partially 'string-match-p "^\\.")
                                    (directory-files init-settings-path)))))

(defun find-settings-file (name)
  "Visit `NAME'-settings.el in `init-settings-path`.

If `NAME' is nil or empty string, open the settings directory."
  (interactive (list (completing-read "Settings file: " (settings-file-stems))))
  (if (or (not name) (= 0 (length name)))
      (find-file init-settings-path)
    (find-file (expand-file-name (concat name "-settings.el") init-settings-path))))

(provide 'settings-settings)

