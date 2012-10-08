;;;;;;;; Managing Settings Files ;;;;;;;;

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

