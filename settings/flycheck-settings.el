(ensure-packages-installed 'flycheck)

(setq flycheck-locate-config-file-functions
      '(flycheck-locate-config-file-home
        flycheck-locate-config-file-ancestor-directories
        flycheck-locate-config-file-absolute-path))

(provide 'flycheck-settings)
