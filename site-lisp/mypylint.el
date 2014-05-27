(defvar mypylint-history nil "History list for pylint")
(defvar mypylint-ignore-message-ids nil "List of pylint message ids to ignore.")

(defun mypylint-reset-ignore ()
  "Reset the list of ignored pep8/pylint error codes to none."
  (interactive)
  (setf mypylint-ignore-message-ids nil))

(defun mypylint-ignore-message (message-id)
  (interactive
   (list
    (if (string= (buffer-name (current-buffer)) "*python-pylint*")
        (let ((case-fold-search nil)
              (line (thing-at-point 'line)))
          (message line)
          (if (string-match "\\[\\([CWRE][0-9]+\\)" line)
              (match-string 1 line)
              (read-from-minibuffer "Message ID: ")))
        )))
  (cond
    (message-id
     (pushnew message-id mypylint-ignore-message-ids :test 'string=)
     (message "Currently ignoring: %s" mypylint-ignore-message-ids))
    (t (message "No message-id found to ignore."))))

(eval-after-load 'python-pylint
                 '(define-key python-pylint-mode-map "i" 'mypylint-ignore-message))

(defun mypylint (command)
  (interactive
   (progn
     (require 'python-pylint)
     (let* ((tramp (tramp-tramp-file-p (buffer-file-name)))
            (file (or (and tramp
                           (aref (tramp-dissect-file-name (buffer-file-name)) 3))
                      (file-relative-name (buffer-file-name))))
            (python-pylint-options
              (if mypylint-ignore-message-ids
                  (list* "-d" (mapconcat 'identity mypylint-ignore-message-ids ",")
                         python-pylint-options)
                  python-pylint-options))
            (command (mapconcat
                      'identity
                      (list python-pylint-command
                            (mapconcat 'identity python-pylint-options " ")
                            (comint-quote-filename file)) " ")))
       (list (if current-prefix-arg
                 (read-from-minibuffer "Run pylint: " command
                                       nil nil 'mypylint-history)
                 command)))))

  (save-some-buffers (not python-pylint-ask-about-save) nil)

  (message "Running pylint command %s" command)
  (compilation-start command 'python-pylint-mode))


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

(defun my-pyflakes-show-help ()
  "Print in the minibuffer the help text for highlighted error at the current point."
  (let ((help (my-pyflakes-get-help)))
    (when help (message "%s" help))))

;;; run the show-help function after each command so that is is always up to date.
(add-hook 'post-command-hook 'my-pyflakes-show-help)

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
