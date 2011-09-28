(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.emacs.d/persistence/backups"))))
 '(clean-buffer-list-delay-general 4)
 '(column-number-mode t)
 '(desktop-path (quote ("." "~/.emacs.d/persistence" "~")))
 '(desktop-save-mode t)
 '(diff-switches "-u")
 '(global-auto-revert-mode t)
 '(global-linum-mode t)
 '(ibuffer-saved-filter-groups nil)
 '(ibuffer-saved-filters (quote (("clsql" ((filename . "lisp/clsql/"))) ("gnus" ((or (mode . message-mode) (mode . mail-mode) (mode . gnus-group-mode) (mode . gnus-summary-mode) (mode . gnus-article-mode)))) ("programming" ((or (mode . emacs-lisp-mode) (mode . cperl-mode) (mode . c-mode) (mode . java-mode) (mode . idl-mode) (mode . lisp-mode)))))))
 '(ido-auto-merge-delay-time 99999)
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(ido-save-directory-list-file "~/.emacs.d/persistence/.ido.last")
 '(indent-tabs-mode nil)
 '(linum-delay t)
 '(mouse-drag-copy-region nil)
 '(mpc-host "mahes")
 '(pc-selection-mode t)
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(require-final-newline t)
 '(safe-local-variable-values (quote ((virtualenv-default-directory . "/home/ACCELERATION/nathan/projects/spat/pynpact/pynpact") (virtualenv-workon . "spat") (Lowercase . T) (Syntax . Common-lisp) (Package . ANSI-LOOP) (c-file-style . ellementel) (Package . CL-FAD) (package . asdf) (Package . UFFI) (syntax . COMMON-LISP) (Package RT :use "COMMON-LISP" :colon-mode :external) (Syntax . Ansi-common-lisp) (Package . :unif) (Package . :util) (Package . :nds) (Package . :newdefsys) (Package . CL-INTERPOL) (Package . containers) (Package . HUNCHENTOOT) (test-case-name . buildbot\.test\.test_steps) (test-case-name . buildbot\.test\.test_steps\,buildbot\.test\.test_properties) (test-case-name . buildbot\.test\.test_dependencies) (test-case-name . buildbot\.test\.test_step) (test-case-name . buildbot\.test\.test_runner) (package . RFC2388) (Package . lift) (Package . CL-USER) (package . puri) (unibyte . t) (Package . SGML) (Package . SAX) (Encoding . utf-8) (package . rune-dom) (show-trailing-whitespace . t) (indent-tabs) (tab . 4) (Package . FLEXI-STREAMS) (Package . CL-PPCRE) (Syntax . Common-Lisp) (Package . CXML) (readtable . runes) (Syntax . COMMON-LISP) (Package . DRAKMA) (Package . odbc) (Syntax . ANSI-Common-Lisp) (Base . 10))))
 '(scroll-conservatively 100000)
 '(scroll-margin 3)
 '(scroll-preserve-screen-position t)
 '(select-active-regions t)
 '(show-paren-mode t)
 '(slime-enable-evaluate-in-emacs t)
 '(slime-net-coding-system (quote utf-8-unix))
 '(smex-save-file "~/.emacs.d/persistence/.smex-items")
 '(tool-bar-mode nil)
 '(tramp-persistency-file-name "/home/ACCELERATION/nathan/.emacs.d/persistence/tramp")
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(user-full-name "Nathan Bird")
 '(user-mail-address "nathan@acceleration.net")
 '(winner-mode t nil (winner))
 '(x-select-enable-clipboard t)
 '(x-select-enable-primary t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(whitespace-line ((t (:background "gray93"))))
 '(whitespace-trailing ((t (:background "#DDBBBB" :foreground "yellow" :weight bold)))))


(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
