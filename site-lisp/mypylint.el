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

(provide 'mypylint)
