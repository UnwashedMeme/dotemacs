(run-with-idle-timer 5.5 nil
                   '(lambda ()
                     (message "nxhtml start trigger")
                     (load (expand-file-name "nxhtml/autostart.el" init-packages-path))
                     ))

