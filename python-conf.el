;(push (expand-file-name "~/.emacs.d/site-lisp/Pymacs") load-path)
;(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)

(setq py-python-command-args '("-i" "--colors=LightBG" "--no-term-title"))
(require 'ipython)
(setq py-python-command-args '("-i" "--colors=LightBG" "--no-term-title"))


(require 'pymacs)
(pymacs-load "ropemacs" "rope-")

(require 'virtualenv)

;;;; these should be done as autoloads by ~/.emacs.d/loaddefs.el
;(require 'python-pep8)
;(require 'python-pylint)

(add-hook 'python-mode-hook #'lambda-mode 1)

(add-hook 'python-mode-hook
          #'(lambda ()
              (autopair-mode)
              (push '(?' . ?')
                    (getf autopair-extra-pairs :code))
              (setq autopair-handle-action-fns
                    (list #'autopair-default-handle-action
                          #'autopair-python-triple-quote-action)))
          1)