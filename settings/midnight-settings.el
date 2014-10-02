(require 'midnight)
(setf clean-buffer-list-delay-general 5)
(add-to-list 'clean-buffer-list-kill-regexps "^/cifs/")
(provide 'midnight-settings)
