(ensure-packages-installed 'smartparens)

(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; If non-nil, autoskip of closing pair is cancelled not only when
;; point is moved outside of the pair, but also if the point moved
;; backwards.  See `sp-skip-closing-pair' for more info.
(setf sp-cancel-autoskip-on-backward-movement nil)

; lisp-ish mode key bindings
(when (fboundp 'add-key-to-lisp-maps)
  (add-key-to-lisp-maps (kbd "C-t") 'sp-transpose-sexp)
  (add-key-to-lisp-maps (kbd "C-M-t") 'transpose-chars)
  (add-key-to-lisp-maps (kbd "C-M-k") 'kill-line)
  (add-key-to-lisp-maps (kbd "C-k") 'sp-kill-sexp)
  (add-key-to-lisp-maps (kbd "C-<right>") 'sp-forward-sexp)
  (add-key-to-lisp-maps (kbd "C-<left>") 'sp-backward-sexp)

  ;; (add-key-to-lisp-maps (kbd "C-S-<right>")
  ;;                       (lambda ()
  ;;                         (interactive)
  ;;                         (mark-sexp)))
  ;; (add-key-to-lisp-maps (kbd "C-S-<left>")
  ;;                       (lambda ()
  ;;                         (interactive)
  ;;                         (mark-sexp -1)))
  )

;; TODO: Remove these function definitions when upstream is updated
;; these were added to allow shift selcting forward / backward sexps
;; which I could not work without the difference
;; is the carat in (interactive "^p")
;; https://github.com/Fuco1/smartparens/issues/360
;;

(put 'sp-forward-sexp  'CUA 'move)
(put 'sp-backward-sexp 'CUA 'move)
(defun sp-forward-sexp (&optional arg)
  "Move forward across one balanced expression.

With ARG, do it that many times.  Negative arg -N means move
backward across N balanced expressions.  If there is no forward
expression, jump out of the current one (effectively doing
`sp-up-sexp').

With `sp-navigate-consider-symbols' symbols and strings are also
considered balanced expressions.

Examples: (prefix arg in comment)

  |(foo bar baz)   -> (foo bar baz)|

  (|foo bar baz)   -> (foo| bar baz)

  (|foo bar baz)   -> (foo bar| baz) ;; 2

  (foo (bar baz|)) -> (foo (bar baz)|)"
  (interactive "^p")
  (setq arg (or arg 1))
  (if (< arg 0)
      (sp-backward-sexp (- arg))
    (let* ((n arg)
           (ok t))
      (while (and ok (> n 0))
        (setq ok (sp-get-thing))
        (setq n (1- n))
        (when ok (goto-char (sp-get ok :end))))
      ok)))

(defun sp-backward-sexp (&optional arg)
  "Move backward across one balanced expression (sexp).

With ARG, do it that many times.  Negative arg -N means move
forward across N balanced expressions.  If there is no previous
expression, jump out of the current one (effectively doing
`sp-backward-up-sexp').

With `sp-navigate-consider-symbols' symbols and strings are also
considered balanced expressions.

Examples: (prefix arg in comment)

  (foo bar baz)|   -> |(foo bar baz)

  (foo| bar baz)   -> (|foo bar baz)

  (foo bar| baz)   -> (|foo bar baz) ;; 2

  (|(foo bar) baz) -> ((|foo bar) baz)"
  (interactive "^p")
  (setq arg (or arg 1))
  (if (< arg 0)
      (sp-forward-sexp (- arg))
    (let* ((n arg)
           (ok t))
      (while (and ok (> n 0))
        (setq ok (sp-get-thing t))
        (setq n (1- n))
        (when ok (goto-char (sp-get ok :beg))))
      ok)))


(provide 'smartparens-settings)
