(ensure-packages-installed 'yasnippet)

(run-with-idle-timer 5 nil 'yas-global-mode)
(run-with-idle-timer 8 nil '(lambda()
                              (ensure-packages-installed 'angular-snippets)))

(provide 'yasnippet-settings)
