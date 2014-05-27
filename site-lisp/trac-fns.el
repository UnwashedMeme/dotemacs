;;;###autoload
(defun trac-link-title ()
  "Turn the url at point into a trac link titled with the page title at that url.

e.g. http://www.blazingthings.com/dev/zcatalog.html becomes
 [http://www.blazingthings.com/dev/zcatalog.html Standalone ZCatalog search system for the ZODB]
"
  (interactive)
  (let ((url (thing-at-point-url-at-point))
        (oldbuf (current-buffer)))

    (let ((buf (url-retrieve-synchronously url)))
      (let ((title (save-excursion
                    (save-window-excursion
                     (switch-to-buffer buf)
                     (goto-char (point-min))
                     (re-search-forward "<\s*title\s*>")
                     (let ((start-of  (point)))
                       (re-search-forward "</\s*title\s*>")
                       (buffer-substring-no-properties start-of (match-beginning 0)))
                     )))
            (thing-bounds (bounds-of-thing-at-point 'url)))
        (goto-char (beginning-of-thing 'url))
        (insert "[")
        (goto-char (end-of-thing 'url))
        (insert " " title "]")))))

(push '("(COMMIT|TAG)_EDITMSG" . git-commit-msg) auto-mode-alist)
;;;###autoload
(defun git-commit-msg ()
  (interactive)
  ;; Make fill-paragraph respect bulleted-lists
  (make-variable-buffer-local 'paragraph-start)
  (make-variable-buffer-local 'paragraph-separate)
  (setq paragraph-start " ?\\*\\|$"
        paragraph-separate "$")
  (auto-fill-mode))
