(ensure-packages-installed 'projectile 'persp-projectile)

(require 'persp-projectile)
(projectile-global-mode)
(persp-mode 1)
(provide 'projectile-settings)
