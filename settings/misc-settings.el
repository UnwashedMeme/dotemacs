(prefer-coding-system 'utf-8-unix)
(push (cons "\\.\\(lisp\\|asd\\|sh\\|py\\|cl\\)\\'" 'utf-8-unix) auto-coding-alist)


(defun insert-key (key)
  (interactive (list (read-key-sequence "Key: ")))
  (insert "(kbd \"" (key-description key) "\")"))


(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "C-c t") 'fold-dwim-toggle)


(push '("\\.pp$" . puppet-mode) auto-mode-alist)
(push '("\\.sls$" . yaml-mode) auto-mode-alist)


;;CSS mode crap
;;try to fix strange stuff in css mode.
;(require 'css-mode)
;(setq cssm-indent-level 2)
;(setq cssm-newline-before-closing-bracket t)
;(setq cssm-indent-function #'cssm-c-style-indenter)
(push '("\\.php$" . html-mode) auto-mode-alist)
(push '("COMMIT_EDITMSG" . git-commit-msg) auto-mode-alist)

;; Replace Stupid yes or no with y or n
(defalias 'old-yes-or-no-p (function yes-or-no-p))
(defalias 'yes-or-no-p (function y-or-n-p))


;(setq whitespace-style '(trailing tabs lines-tail empty))
;(global-whitespace-mode)

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))


(defun fixup-quotes ()
  "Get rid of smart quotes and replace them with normal quotes."
  (interactive)
  (save-excursion
   (goto-char (point-min))
   (while (search-forward-regexp "[“”]" nil t)
          (replace-match "\"" nil t))))


(defun my-help ()
  "If thing at point is a:
function, tries to `describe-function';
variable, uses 'describe-variable';
otherwise uses `manual-entry' to display
manpage of a `current-word'."
  (interactive)
  (let ((var (variable-at-point)))
    (if (symbolp var)
        (describe-variable var)
      (let ((fn (function-called-at-point)))
        (if fn
            (describe-function fn)
          (man (current-word)))))))

(global-set-key (kbd "<C-f1>") 'my-help)


;; C-mwheel for zooming, like other apps
(global-set-key (kbd "<C-mouse-4>")
                (lambda () (interactive) (text-scale-increase 1)))
(global-set-key (kbd "<C-mouse-5>")
                (lambda () (interactive) (text-scale-increase -1)))
(global-set-key (kbd "<C-down-mouse-2>")
                (lambda () (interactive) (text-scale-increase 0)))


;;;;;;;; Managing hooks ;;;;;;;;;

;; (add-hook 'hs-minor-mode-hook (lambda ()
;;                                 (when (and hs-minor-mode (not hideshowvis-minor-mode))
;;                                   (message "hs-minor-mode-hook powers activate hideshowvis")
;;                                   (hideshowvis-enable))))
;; Make scripts executable on save
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)


;;;;;;;; ;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;


(defun twiddle-mode (mode)
  "If MODE is activated, then deactivate it and then activate it again.

If MODE is not active, do nothing."
  (when (eval mode)
    (funcall mode 0)
    (funcall mode 1)))

(defun add-to-head-of-list (list-var element)
  "Like `add-to-list', but ELEMENT is guaranteed to be at the
head of the list, regardless of whether it was previously an
element of the list.

In particular, if ELEMENT is already in LIST-VAR, it is removed
and re-added at the head."
  (set list-var (cons element (remove element (symbol-value list-var)))))

(defun string-ends-with (ending string)
  "Return t if the final characters of STRING are ENDING"
  (string-match-p (concat ending "$") string))

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



(defun eval-sexp-at-point ()
  (interactive)
  (let* ((sexp (sexp-at-point))
         (res (eval sexp)))
    (destructuring-bind (start . end) (bounds-of-thing-at-point 'sexp)
      (delete-region start end))
    (princ res (current-buffer))))

(provide 'misc-settings)

