;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; flymake-python-pyflakes minor mode for easing navigation.
(setq flymake-python-pyflakes-executable "flake8")

(defvar my-pyflakes-ignore-message-ids nil
  "List of flake8 message ids to ignore.")

;;; Define a minor mode to help navigate around
;;; Cribbed from http://www.emacswiki.org/emacs/FlyMake
(defvar my-pyflakes-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\M-p" 'flymake-goto-prev-error)
    (define-key map "\M-n" 'flymake-goto-next-error)
    (define-key map (kbd "C-c i") 'my-pyflakes-ignore-error)
    map)
  "Keymap for my flymake minor mode.")

(define-minor-mode my-pyflakes-minor-mode
  "Simple minor mode which adds some key bindings for moving to the next and previous errors.

Key bindings:

\\{my-pyflakes-minor-mode-map}"
  nil
  nil
  :keymap my-pyflakes-minor-mode-map)

(defun my-pyflakes-get-help ()
  "Find the flymake help text for the current point"
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      help)))

(defun my-pyflakes-ignore-error ()
  "Ignore the error code that is highlighting the current point"
  (interactive)
  (let ((help (my-pyflakes-get-help)))
    (message "help was: %s" help)
    (when (and help (string-match "^\\([CWRE][0-9]+\\)" help))
      (let ((message-id (match-string 1 help)))
        (pushnew message-id my-pyflakes-ignore-message-ids :test 'string=)
        (my-pyflakes-build-ignore)
        (message "Ignored: %s" message-id)
        ))))

(defun my-pyflakes-build-ignore ()
  "Build the `--ignore=... argument out of our ignored codes.`"
  (setq flymake-python-pyflakes-extra-arguments
        (when my-pyflakes-ignore-message-ids
            (list (concat "--ignore=" (mapconcat 'identity my-pyflakes-ignore-message-ids ",")))))
  (when flymake-mode
    ;; in case this is triggered by mypylint on a buffer not running flymake.
    (flymake-start-syntax-check)))

(defun my-pyflakes-reset-ignore ()
  (interactive)
  (setq my-pyflakes-ignore-message-ids nil)
  (my-pyflakes-build-ignore))

(provide 'mypyflake8)
