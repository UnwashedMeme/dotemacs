;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (paren-backward-sexp paren-forward-sexp paren-toggle-open-paren-context
;;;;;;  paren-toggle-matching-quoted-paren paren-toggle-matching-paired-delimiter
;;;;;;  paren-deactivate paren-activate) "mic-paren" "site-lisp/mic-paren.el"
;;;;;;  (19143 56619))
;;; Generated autoloads from site-lisp/mic-paren.el

(autoload 'paren-activate "mic-paren" "\
Activate mic-paren parenthesis highlighting.
Note: This also deactivates the paren.el
and stig-paren.el packages if they are active!

The following options are available via the customize-feature:
  `paren-priority'
  `paren-overlay-priority'
  `paren-sexp-mode'
  `paren-highlight-at-point'
  `paren-highlight-offscreen'
  `paren-display-message'
  `paren-message-linefeed-display'
  `paren-message-no-match'
  `paren-message-show-linenumber'
  `paren-message-truncate-lines'
  `paren-ding-unmatched'
  `paren-delay'
  `paren-dont-touch-blink'
  `paren-match-face'
  `paren-mismatch-face'
  `paren-no-match-face'
  `paren-bind-modified-sexp-functions'

The following options are settable via toggling functions (look at the
documentation of these options for the names of these functions):
  `paren-match-quoted-paren'
  `paren-match-paired-delimiter'
  `paren-open-paren-context-backward'

\(fn)" t nil)

(autoload 'paren-deactivate "mic-paren" "\
Deactivate mic-paren parenthesis highlighting.

\(fn)" t nil)

(autoload 'paren-toggle-matching-paired-delimiter "mic-paren" "\
Toggle matching paired delimiter.
Force on with positive ARG.  Use this in mode hooks to activate or
deactivate paired delimiter matching.  If optional second argument
NO-MESSAGE is non-nil then don't display a message about the
current activation state of the paired-delimiter-matching feature.

\(fn ARG &optional NO-MESSAGE)" t nil)

(autoload 'paren-toggle-matching-quoted-paren "mic-paren" "\
Toggle matching quoted parens.
Force on with positive ARG.  Use this in mode hooks to activate or
deactivate quoted paren matching.  If optional second argument
NO-MESSAGE is non-nil then don't display a message about the
current activation state of the quoted-paren-matching feature.

\(fn ARG &optional NO-MESSAGE)" t nil)

(autoload 'paren-toggle-open-paren-context "mic-paren" "\
Toggle whether or not to determine context of the matching open-paren.
Force backward context with positive ARG.  Use this in mode-hooks.
See `paren-open-paren-context-backward'.

\(fn ARG)" t nil)

(autoload 'paren-forward-sexp "mic-paren" "\
Act like `forward-sexp' but also handle quoted parens.
See `paren-match-quoted-paren'.

\(fn &optional ARG)" t nil)

(autoload 'paren-backward-sexp "mic-paren" "\
Act like `backward-sexp' but also match quoted parens.
See `paren-match-quoted-paren'.

\(fn &optional ARG)" t nil)

;;;***

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

;;;### (autoloads (php-mode php-file-patterns) "php-mode" "site-lisp/php-mode.el"
;;;;;;  (19797 48243))
;;; Generated autoloads from site-lisp/php-mode.el

(defvar php-file-patterns '("\\.php[s34]?\\'" "\\.phtml\\'" "\\.inc\\'") "\
List of file patterns for which to automatically invoke `php-mode'.")

(custom-autoload 'php-file-patterns "php-mode" nil)

(autoload 'php-mode "php-mode" "\
Major mode for editing PHP code.

\\{php-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (git-commit-msg trac-link-title) "site-lisp/trac-fns"
;;;;;;  "site-lisp/trac-fns.el" (20254 55945))
;;; Generated autoloads from site-lisp/trac-fns.el

(autoload 'trac-link-title "site-lisp/trac-fns" "\
Turn the url at point into a trac link titled with the page title at that url.

e.g. http://www.blazingthings.com/dev/zcatalog.html becomes
 [http://www.blazingthings.com/dev/zcatalog.html Standalone ZCatalog search system for the ZODB]

\(fn)" t nil)

(autoload 'git-commit-msg "site-lisp/trac-fns" "\


\(fn INTERACTIVE)" nil nil)

;;;***

;;;### (autoloads (trac-link-title) "trac-fns" "site-lisp/trac-fns.el"
;;;;;;  (20133 45780))
;;; Generated autoloads from site-lisp/trac-fns.el

(autoload 'trac-link-title "trac-fns" "\
Turn the url at point into a trac link titled with the page title at that url.

e.g. http://www.blazingthings.com/dev/zcatalog.html becomes
 [http://www.blazingthings.com/dev/zcatalog.html Standalone ZCatalog search system for the ZODB]

\(fn)" t nil)

;;;***

;;;### (autoloads (tty-format-guess backspace-overstrike-decode backspace-overstrike-encode
;;;;;;  ansi-format-decode ansi-format-encode) "tty-format" "site-lisp/tty-format.el"
;;;;;;  (20090 7968))
;;; Generated autoloads from site-lisp/tty-format.el

(add-to-list 'format-alist '(ansi-colors "ANSI SGR escape sequence colours and fonts." nil ansi-format-decode ansi-format-encode t nil))

(autoload 'ansi-format-encode "tty-format" "\
Sorry, cannot encode `ansi-colors' format.
This function is designed for use in `format-alist'.

There's no support for re-encoding to save a file in
`ansi-colors' format.  (But of course you can copy into another
document with a format that does support saving.)

\(fn BEG END BUFFER)" nil nil)

(autoload 'ansi-format-decode "tty-format" "\
Decode ANSI SGR control sequences between BEG and END into faces.
This function is designed for use in `format-alist'.

ANSI standard \"Esc [ ... m\" terminal control sequences are
turned into corresponding Emacs faces, using `ansi-colours'.

There's no automatic detection of this format, because those
escape sequences could too easily occur in unrelated binary data.
Decode files with an explicit \\[format-decode-buffer], or see
`tty-format-guess' to try automated guessing on text files.

\(fn BEG END)" nil nil)

(add-to-list 'format-alist '(backspace-overstrike "Backspace overstriking for bold and underline." nil backspace-overstrike-decode backspace-overstrike-encode t nil))

(autoload 'backspace-overstrike-encode "tty-format" "\
Sorry, cannot encode `backspace-overstrike' format.
This function is designed for use in `format-alist'.

There's no support for re-encoding to save a file in
`backspace-overstrike' format.  (But of course you can copy into
another document with a format that does support saving.)

\(fn BEG END BUFFER)" nil nil)

(autoload 'backspace-overstrike-decode "tty-format" "\
Decode backspace overstrike sequences between BEG and END into faces.
This function is designed for use in `format-alist'.

The sequences recognised are:

    X backspace X       -- bold
    _ backspace X       -- underline
    U+203E backspace X  -- overline (when unicode available)
    + backspace o       -- bullet point (latin-1 middle dot,
                           as per groff \\=\\[bu]])

Character overstriking like this was used in the past on line
printers and is still sometimes found in text files.

There's no automatic detection of this format in `format-alist',
because backspace sequences could too easily occur in unrelated
binary data.  Decode with an explicit \\[format-decode-buffer] or
see `tty-format-guess' to try automated guessing on text files.

\(fn BEG END)" nil nil)

(autoload 'tty-format-guess "tty-format" "\
Decode text files containing ANSI SGR or backspace sequences.
This is designed for use from `find-file-hook' (or
`find-file-hooks').

If the buffer filename is \".txt\" or \"README\" and there's any
ANSI SGR escapes or backspace overstriking then call
`format-decode-buffer' to decode with `ansi-colors' and/or
`backspace-overstrike' formats respectively.

It'd be too dangerous to look at every file for escape and
backspace sequences, they could too easily occur in binary data
like an image file.  The idea of this function is to check just
text files, presuming you're confident all \".txt\" files should
indeed be ordinary text.

\(fn)" nil nil)

(if (eval-when-compile (boundp 'find-file-hook)) (custom-add-option 'find-file-hook 'tty-format-guess) (custom-add-option 'find-file-hooks 'tty-format-guess))

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
