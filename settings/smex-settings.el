;(require 'smex)

(eval-after-load "smex-autoloads"
                 (progn
                   (message "smex-autoloads trigger")
                   (smex-initialize)
                   
                   (global-set-key (kbd "M-x") 'smex)
                   (global-set-key (kbd "M-X") 'smex-major-mode-commands)
                   ;; This is your old M-x.
                   (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
                   ))
(provide 'smex-settings)
