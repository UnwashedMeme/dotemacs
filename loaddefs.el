;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (global-ethan-wspace-mode ethan-wspace-mode) "site-lisp/ethan-wspace/lisp/ethan-wspace"
;;;;;;  "site-lisp/ethan-wspace/lisp/ethan-wspace.el" (20899 36597
;;;;;;  382758 731000))
;;; Generated autoloads from site-lisp/ethan-wspace/lisp/ethan-wspace.el

(autoload 'ethan-wspace-mode "site-lisp/ethan-wspace/lisp/ethan-wspace" "\
Minor mode for coping with whitespace.

This just activates each whitespace type in this buffer.

\(fn &optional ARG)" t nil)

(defvar global-ethan-wspace-mode t "\
Non-nil if Global-Ethan-Wspace mode is enabled.
See the command `global-ethan-wspace-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-ethan-wspace-mode'.")

(custom-autoload 'global-ethan-wspace-mode "site-lisp/ethan-wspace/lisp/ethan-wspace" nil)

(autoload 'global-ethan-wspace-mode "site-lisp/ethan-wspace/lisp/ethan-wspace" "\
Toggle Ethan-Wspace mode in all buffers.
With prefix ARG, enable Global-Ethan-Wspace mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Ethan-Wspace mode is enabled in all buffers where
`ethan-wspace-is-buffer-appropriate' would do it.
See `ethan-wspace-mode' for more information on Ethan-Wspace mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (mo-git-blame-current mo-git-blame-file) "site-lisp/mo-git-blame/mo-git-blame"
;;;;;;  "site-lisp/mo-git-blame/mo-git-blame.el" (20622 36305 48408
;;;;;;  929000))
;;; Generated autoloads from site-lisp/mo-git-blame/mo-git-blame.el

(autoload 'mo-git-blame-file "site-lisp/mo-git-blame/mo-git-blame" "\
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

(autoload 'mo-git-blame-current "site-lisp/mo-git-blame/mo-git-blame" "\
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


;;;### (autoloads (turn-off-show-smartparens-mode turn-on-show-smartparens-mode
;;;;;;  show-smartparens-global-mode show-smartparens-mode turn-off-smartparens-mode
;;;;;;  turn-on-smartparens-mode smartparens-global-mode smartparens-mode
;;;;;;  sp-use-smartparens-bindings sp-use-paredit-bindings) "site-lisp/smartparens/smartparens"
;;;;;;  "site-lisp/smartparens/smartparens.el" (20895 53506 823032
;;;;;;  138000))
;;; Generated autoloads from site-lisp/smartparens/smartparens.el

(defvar sp-keymap (make-sparse-keymap) "\
Keymap used for `smartparens-mode'.")

(autoload 'sp-use-paredit-bindings "site-lisp/smartparens/smartparens" "\
Initiate `sp-keymap' with paredit-compatible bindings for
corresponding functions provided by smartparens.  See variable
`sp-paredit-bindings'.

\(fn)" t nil)

(autoload 'sp-use-smartparens-bindings "site-lisp/smartparens/smartparens" "\
Initiate `sp-keymap' with smartparens bindings for navigation functions.
See variable `sp-smartparens-bindings'.

\(fn)" t nil)

(autoload 'smartparens-mode "site-lisp/smartparens/smartparens" "\
Toggle smartparens mode.

\(fn &optional ARG)" t nil)

(defvar smartparens-global-mode nil "\
Non-nil if Smartparens-Global mode is enabled.
See the command `smartparens-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `smartparens-global-mode'.")

(custom-autoload 'smartparens-global-mode "site-lisp/smartparens/smartparens" nil)

(autoload 'smartparens-global-mode "site-lisp/smartparens/smartparens" "\
Toggle Smartparens mode in all buffers.
With prefix ARG, enable Smartparens-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Smartparens mode is enabled in all buffers where
`turn-on-smartparens-mode' would do it.
See `smartparens-mode' for more information on Smartparens mode.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-smartparens-mode "site-lisp/smartparens/smartparens" "\
Turn on `smartparens-mode'.

\(fn)" t nil)

(autoload 'turn-off-smartparens-mode "site-lisp/smartparens/smartparens" "\
Turn off `smartparens-mode'.

\(fn)" t nil)

(autoload 'show-smartparens-mode "site-lisp/smartparens/smartparens" "\
Toggle visualization of matching pairs.  When enabled, any
matching pair is highlighted after `sp-show-pair-delay' seconds
of Emacs idle time if the point is immediately in front or after
a pair.  This mode works similarly to `show-paren-mode', but
support custom pairs.

\(fn &optional ARG)" t nil)

(defvar show-smartparens-global-mode nil "\
Non-nil if Show-Smartparens-Global mode is enabled.
See the command `show-smartparens-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `show-smartparens-global-mode'.")

(custom-autoload 'show-smartparens-global-mode "site-lisp/smartparens/smartparens" nil)

(autoload 'show-smartparens-global-mode "site-lisp/smartparens/smartparens" "\
Toggle Show-Smartparens mode in all buffers.
With prefix ARG, enable Show-Smartparens-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Show-Smartparens mode is enabled in all buffers where
`turn-on-show-smartparens-mode' would do it.
See `show-smartparens-mode' for more information on Show-Smartparens mode.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-show-smartparens-mode "site-lisp/smartparens/smartparens" "\
Turn on `show-smartparens-mode'.

\(fn)" t nil)

(autoload 'turn-off-show-smartparens-mode "site-lisp/smartparens/smartparens" "\
Turn off `show-smartparens-mode'.

\(fn)" t nil)

;;;***

;;;### (autoloads (git-commit-msg trac-link-title) "site-lisp/trac-fns"
;;;;;;  "site-lisp/trac-fns.el" (20738 38656 884357 665000))
;;; Generated autoloads from site-lisp/trac-fns.el

(autoload 'trac-link-title "site-lisp/trac-fns" "\
Turn the url at point into a trac link titled with the page title at that url.

e.g. http://www.blazingthings.com/dev/zcatalog.html becomes
 [http://www.blazingthings.com/dev/zcatalog.html Standalone ZCatalog search system for the ZODB]

\(fn)" t nil)

(autoload 'git-commit-msg "site-lisp/trac-fns" "\


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

;;;### (autoloads (virtualenv-minor-mode virtualenv-deactivate virtualenv-workon)
;;;;;;  "site-lisp/virtualenv.el/virtualenv" "site-lisp/virtualenv.el/virtualenv.el"
;;;;;;  (20895 53349 483124 704000))
;;; Generated autoloads from site-lisp/virtualenv.el/virtualenv.el

(autoload 'virtualenv-workon "site-lisp/virtualenv.el/virtualenv" "\
Activate a virtual environment for python.
Optional argument ENV if non-nil, either use the string given as
the virtual environment or if not a string then query the user.

\(fn &optional ENV)" t nil)

(autoload 'virtualenv-deactivate "site-lisp/virtualenv.el/virtualenv" "\


\(fn)" t nil)

(autoload 'virtualenv-minor-mode "site-lisp/virtualenv.el/virtualenv" "\
Toggle Virtualenv minor mode on or off.
With a prefix argument ARG, enable Virtualenv minor mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.
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
