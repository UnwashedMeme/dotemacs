;(push (expand-file-name "~/.emacs.d/site-lisp/Pymacs") load-path)
;(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)

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




(eval-after-load 'auto-complete
  '(progn
     (ac-ropemacs-initialize)
     (add-hook 'python-mode-hook
               (lambda ()
                 (add-to-list 'ac-sources 'ac-source-ropemacs)))))

(autoload 'virtualenv-workon "virtualenv" nil t)
(eval-after-load "virtualenv"
                 '(progn

                   (message "After virtualenv load; defining advice")
                   (defadvice virtualenv-workon (after virtualenv-kill-pymacs activate)
                    (when (and (boundp 'pymacs-transit-buffer) 
                               pymacs-transit-buffer)
                      (pymacs-terminate-services))
                    (python-settings-load-pymacs-modules))))



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

(require 'comint)
(define-key comint-mode-map (kbd "M-") 'comint-next-input)
(define-key comint-mode-map (kbd "M-") 'comint-previous-input)
(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)
