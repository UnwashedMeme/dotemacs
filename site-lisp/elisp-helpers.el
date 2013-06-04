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


(defun eval-sexp-at-point ()
  (interactive)
  (let* ((sexp (sexp-at-point))
         (res (eval sexp)))
    (destructuring-bind (start . end) (bounds-of-thing-at-point 'sexp)
      (delete-region start end))
    (princ res (current-buffer))))

(provide 'elisp-helpers)
