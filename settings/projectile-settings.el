(ensure-packages-installed 'projectile
                           ;'persp-projectile
                           )

;(require 'persp-projectile)
(projectile-global-mode)
;(persp-mode 1)

(setf projectile-remember-window-configs t)

;; opening a project should show the directory
(setf projectile-switch-project-action 'projectile-magit-status)

(defun projectile-magit-status ()
  (or (magit-status (or (projectile-project-root)
                        (magit-get-top-dir)
                        (magit-read-top-dir nil))
                    'switch-to-buffer)
      (projectile-dired))
  nil)


(add-to-list 'projectile-globally-ignored-directories "bower_components")
(add-to-list 'projectile-globally-ignored-directories "node_modules")
(add-to-list 'projectile-globally-ignored-directories "dist")
(add-to-list 'projectile-globally-ignored-directories "build")
(add-to-list 'projectile-globally-ignored-directories ".tmp")
(add-to-list 'projectile-globally-ignored-directories "ve")
(add-to-list 'projectile-globally-ignored-directories ".ropeproject")

(provide 'projectile-settings)
