(use-package web-mode
             :ensure web-mode
             :mode (("\\.html\\'" . web-mode)
                    ("\\.html\\.erb\\'" . web-mode)
                    ("\\.mustache\\'" . web-mode)
                    ("\\.jinja\\'" . web-mode)
                    ("\\.php\\'" . web-mode))
             :config (progn
                       (setq web-mode-markup-indent-offset 2
                             web-mode-css-indent-offset 2
                             web-mode-code-indent-offset 2)
                        ))

(provide 'web-mode-settings)
