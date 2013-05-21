(defvar mypylint-history nil "History list for pylint")
(defvar mypylint-ignore-message-ids nil "List of pylint message ids to ignore.")

(defun mypylint-reset-ignore ()
  "Reset the list of ignored pep8/pylint error codes to none."
  (interactive)
  (setf mypylint-ignore-message-ids nil)
  (my-flymake-build-ignore))

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

;;; Define a minor mode to help navigate around
;;; Cribbed from http://www.emacswiki.org/emacs/FlyMake
(defvar my-flymake-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\M-p" 'flymake-goto-prev-error)
    (define-key map "\M-n" 'flymake-goto-next-error)
    (define-key map (kbd "C-c i") 'my-flymake-ignore-error)
    map)
  "Keymap for my flymake minor mode.")

(define-minor-mode my-flymake-minor-mode
  "Simple minor mode which adds some key bindings for moving to the next and previous errors.

Key bindings:

\\{my-flymake-minor-mode-map}"
  nil
  nil
  :keymap my-flymake-minor-mode-map)

(defun my-flymake-get-help ()
  "Find the flymake help text for the current point"
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      help)))

(defun my-flymake-show-help ()
  "Print in the minibuffer the help text for highlighted error at the current point."
  (let ((help (my-flymake-get-help)))
    (when help (message "%s" help))))

;;; run the show-help function after each command so that is is always up to date.
(add-hook 'post-command-hook 'my-flymake-show-help)

(defun my-flymake-ignore-error ()
  "Ignore the error code that is highlighting the current point"
  (interactive)
  (let ((help (my-flymake-get-help)))
    (message "help was: %s" help)
    (when (and help (string-match "^\\([CWRE][0-9]+\\)" help))
      (let ((message-id (match-string 1 help)))
        (message "Going to ignore: %s" message-id)
        (pushnew message-id mypylint-ignore-message-ids :test 'string=)
        (my-flymake-build-ignore)
        ))))

(defun my-flymake-build-ignore (run)
  "Build the `--ignore=... argument out of our ignored codes.`"
  (setq flymake-python-pyflakes-extra-arguments
        (when mypylint-ignore-message-ids
            (list (concat "--ignore=" (mapconcat 'identity mypylint-ignore-message-ids ",")))))
  (when flymake-mode
    ;; inc ase this is triggered by mypylint on a buffer not running flymake.
    (flymake-start-syntax-check)))

