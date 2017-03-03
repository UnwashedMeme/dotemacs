(use-package ctags-update
  :if (executable-find "ctags-exuberant")
  :config (progn
            (push "--exclude=bower_components/*" ctags-update-other-options)
            (push "--exclude=dist" ctags-update-other-options)
            (push "--exclude=build" ctags-update-other-options)
            (push "--exclude=.git" ctags-update-other-options)
            (push "--exclude=node_modules/*" ctags-update-other-options))
  :commands (ctags-update ctags-auto-update-mode))


;(eval-after-load "etags" '(progn (ac-etags-setup)))

(provide 'ctags-settings)
