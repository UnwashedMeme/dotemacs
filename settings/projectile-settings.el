(use-package projectile
  :ensure t

  :config (progn
            (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
            (projectile-mode +1)
            (add-to-list 'projectile-globally-ignored-directories "bower_components")
            (add-to-list 'projectile-globally-ignored-directories "node_modules")
            (add-to-list 'projectile-globally-ignored-directories "dist")
            (add-to-list 'projectile-globally-ignored-directories "build")
            (add-to-list 'projectile-globally-ignored-directories ".tmp")
            (add-to-list 'projectile-globally-ignored-directories "ve")
            (add-to-list 'projectile-globally-ignored-directories ".ropeproject")
            (if (executable-find "git")
                (setq projectile-switch-project-action 'projectile-use-magit-if-possible)
              (warn "Can't find executable `git`")
              )

            (setq projectile-completion-system 'ivy)
            )
  )

(defun projectile-use-magit-if-possible ()
  "If the project being switched to is a git repository, invoke
    magit-status on the project root directory. Use dired otherwise."
  (interactive)
  (if (eq (projectile-project-vcs) 'git)
      (magit-status (projectile-project-root))
    (dired (projectile-project-root))))


(provide 'projectile-settings)
