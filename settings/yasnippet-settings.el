(use-package yasnippet
             :ensure yasnippet
             :defer 4
             :config (progn (require 'cl)
                            (yas-global-mode t)))

(use-package angular-snippets
             :ensure angular-snippets)

(provide 'yasnippet-settings)
