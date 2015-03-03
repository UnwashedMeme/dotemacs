(ensure-packages-installed 'ethan-wspace)

;(setf mode-require-final-newline nil)
(global-ethan-wspace-mode)
;(run-with-idle-timer 2.2 nil 'global-ethan-wspace-mode)

;; this becomes buffer local when set so need to use setq-default
(setq-default indent-tabs-mode nil)

(provide 'ethand-wspace-settings)
