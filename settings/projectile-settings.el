(ensure-packages-installed 'projectile 'persp-projectile)

(require 'persp-projectile)
(projectile-global-mode)
(persp-mode 1)


(setf projectile-remember-window-configs t)

;; opening a project should show the directory
(setf projectile-switch-project-action 'projectile-dired)

(provide 'projectile-settings)
