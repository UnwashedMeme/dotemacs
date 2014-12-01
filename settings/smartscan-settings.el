(use-package smartscan
             :commands smartscan-mode
             :ensure smartscan
             :init (progn
                     (add-hook 'js-mode-hook 'smartscan-mode)
                     (add-hook 'python-mode-hook 'smartscan-mode)
                     (add-hook 'lisp-mode-hook 'smartscan-mode)
                     (add-hook 'emacs-lisp-mode-hook 'smartscan-mode)
                     (add-hook 'html-mode-hook 'smartscan-mode)))

(provide 'smartscan-settings)
