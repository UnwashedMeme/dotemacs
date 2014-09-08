(require 'tramp)
(setf 
 tramp-default-method "scpx"
 tramp-persistency-file-name "~/.emacs.d/persistence/tramp")

; don't try to run VC checks over tramp
(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))

(defun tramp-dissect-file-name-maybe (name &optional nodefault)
  "Like tramp-dissect-file-name, but returns nil instead of error."
  (when (tramp-tramp-file-p name)
    (tramp-dissect-file-name name nodefault)))

(defun toggle-sudo-edit (&optional buf)
  "Toggle BUF between editing as root and normal user.

Default BUF is current buffer. The positions of point and mark
are preserved through the toggle."
  (interactive)
  (let* ((buf (or buf (current-buffer)))
         (old-point (with-current-buffer buf (point)))
         (old-mark (with-current-buffer buf (mark)))
         (filename (buffer-file-name buf))
         (tramp-file-name (tramp-dissect-file-name-maybe filename))
         new-filename)
    (if tramp-file-name
        (let* ((method (aref tramp-file-name 0))
               (user (aref tramp-file-name 1))
               (host (aref tramp-file-name 2))
               (localname (aref tramp-file-name 3)))
          (if (and (string= method "sudo")
                   (string= user "root")
                   (member host '("localhost" (system-name))))
              (setq new-filename localname)
            (error "File %s is a TRAMP file but is not being edited by sudo as root on localhost." filename)))
      (setq new-filename (concat "/sudo:root@localhost:" filename)))
    (find-alternate-file new-filename)
    (goto-char old-point)
    (set-mark old-mark)))
