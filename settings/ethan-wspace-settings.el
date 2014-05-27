(ensure-packages-installed 'ethan-wspace)

(setf mode-require-final-newline nil)
(run-with-idle-timer 2.2 nil 'global-ethan-wspace-mode)

(provide 'ethand-wspace-settings)
