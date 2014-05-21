
(setf auto-save-file-name-transforms
      '(("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" "~/.emacs.d/persistence/auto-saves/\\2" t)
        (".*" "~/.emacs.d/persistence/auto-saves" t))

      backup-directory-alist (quote (("." . "~/.emacs.d/persistence/backups"))))
(provide 'autosave-settings)
