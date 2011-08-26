;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (python-pep8) "python-pep8" "site-lisp/python-pep8.el"
;;;;;;  (20055 45778))
;;; Generated autoloads from site-lisp/python-pep8.el

(autoload 'python-pep8 "python-pep8" "\
Run PEP8, and collect output in a buffer.
While pep8 runs asynchronously, you can use \\[next-error] (M-x next-error),
or \\<python-pep8-mode-map>\\[compile-goto-error] in the grep output buffer, to go to the lines where pep8 found matches.

\(fn)" t nil)

(defalias 'pep8 'python-pep8)

;;;***

;;;### (autoloads (virtualenv-minor-mode virtualenv-workon) "virtualenv"
;;;;;;  "site-lisp/virtualenv.el/virtualenv.el" (20018 53507))
;;; Generated autoloads from site-lisp/virtualenv.el/virtualenv.el

(autoload 'virtualenv-workon "virtualenv" "\
Activate a virtual environment for python.
Optional argument ENV if non-nil, either use the string given as
the virtual environment or if not a string then query the user.

\(fn &optional ENV)" t nil)

(autoload 'virtualenv-minor-mode "virtualenv" "\
Toggle Virtualenv minor mode on or off.
Interactively, with no prefix argument, toggle the mode.
With universal prefix ARG turn mode on.
With zero or negative ARG turn mode off.
\\{virtualenv-minor-mode-map}

\(fn &optional ARG)" t nil)

;;;***

(provide 'loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; loaddefs.el ends here
