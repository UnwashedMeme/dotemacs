(load (expand-file-name "emacs-ipython-notebook/lisp/ein-loaddefs.el" init-packages-path))

;(delete (expand-file-name "~/projects/Pymacs") load-path)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

;(setq py-python-command-args '("-i" "--colors=LightBG" "--no-term-title"))
;(require 'ipython)
;(setq py-python-command-args '("-i" "--colors=LightBG" "--no-term-title"))


;(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;(setq interpreter-mode-alist (cons '("python" . python-mode)
;                                   interpreter-mode-alist))

(autoload 'python-mode "python-mode" "Python editing mode." t)
(autoload 'ipython "python-mode" "Start and IPython shell." t)
(autoload 'py-shell "python-mode" "Start and python shell." t)


(setq py-install-directory
      (first (find-subdirs-containing init-path "python-mode.el")))


(defun python-settings-load-pymacs-modules ()
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-"))


(defun ropemacs-mode ()
  (interactive)
  
  (python-settings-load-pymacs-modules)
  (defadvice ropemacs-mode (around no-ropemacs-tramp activate)
    (unless (tramp-handle-file-remote-p (buffer-file-name))
      ad-do-it))
  (ropemacs-mode))




;; (eval-after-load 'auto-complete
;;   '(progn
;;     (python-settings-load-pymacs-modules)
;;     (ac-ropemacs-initialize)
;;     (add-hook 'python-mode-hook
;;      (lambda ()
;;        (add-to-list 'ac-sources 'ac-source-ropemacs)))))


(add-hook 'python-mode-hook #'lambda-mode 1)
(add-hook 'python-mode-hook #'hs-minor-mode 1)
(add-hook 'python-mode-hook #'ctags-update-minor-mode 1)

(add-hook 'python-mode-hook
          #'(lambda ()
              (autopair-mode)
              (push '(?' . ?')
                    (getf autopair-extra-pairs :code))
              (setq autopair-handle-action-fns
                    (list #'autopair-default-handle-action
                          #'autopair-python-triple-quote-action)))
          1)

;; (add-hook 'python-mode-hook
;;           #'(lambda ()
;;               (message "python-mode-hook")
;;               (when delete-selection-mode
;;                 (message "Disabling delete-selection-mode")
;;                 (delete-selection-mode))
;;               (smartparens-mode)
;;               (sp-turn-on-delete-selection-mode)))

(require 'comint)
(define-key comint-mode-map (kbd "M-") 'comint-next-input)
(define-key comint-mode-map (kbd "M-") 'comint-previous-input)
(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)




(defvar mypylint-history nil "History list for pylint")
(defvar mypylint-ignore-message-ids nil "List of pylint message ids to ignore.")

(defun mypylint-reset-ignore ()
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

