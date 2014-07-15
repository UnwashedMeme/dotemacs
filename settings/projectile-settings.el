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

(provide 'projectile-settings)
