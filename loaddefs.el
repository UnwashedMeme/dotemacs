;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (mo-git-blame-current mo-git-blame-file) "mo-git-blame"
;;;;;;  "site-lisp/mo-git-blame/mo-git-blame.el" (20111 4600))
;;; Generated autoloads from site-lisp/mo-git-blame/mo-git-blame.el

(autoload 'mo-git-blame-file "mo-git-blame" "\
Calls `git blame' for REVISION of FILE-NAME or `HEAD' if
REVISION is not given. Initializes the two windows that will show
the output of 'git blame' and the content.

If FILE-NAME is missing it will be read with `find-file' in
interactive mode.

ORIGINAL-FILE-NAME defaults to FILE-NAME if not given. This is
used for tracking renaming and moving of files during iterative
re-blaming.

With a numeric prefix argument or with NUM-LINES-TO-BLAME only
the NUM-LINES-TO-BLAME lines before and after point are blamed by
using git blame's `-L' option. Otherwise the whole file is
blamed.

\(fn &optional FILE-NAME REVISION ORIGINAL-FILE-NAME NUM-LINES-TO-BLAME)" t nil)

(autoload 'mo-git-blame-current "mo-git-blame" "\
Calls `mo-git-blame-file' for HEAD for the current buffer.

\(fn)" t nil)

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
