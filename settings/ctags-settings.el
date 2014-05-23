
(ensure-packages-installed 'ctags-update 'ac-etags)

(push "--exclude=bower_components" ctags-update-other-options)
(push "--exclude=dist" ctags-update-other-options)
(push "--exclude=build" ctags-update-other-options)


(eval-after-load "etags" '(progn (ac-etags-setup)))

(provide 'ctags-settings)
