(use-package smart-mode-line
             :ensure smart-mode-line
             :init (setq sml/theme "respectful")
             :idle (sml/setup)
             :commands sml/setup)

(provide 'sml-settings)
