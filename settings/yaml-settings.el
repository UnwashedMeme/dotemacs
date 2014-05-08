;; less crazy yaml indentation/enter-key

(push '("\\.sls$" . yaml-mode) auto-mode-alist)
(autoload 'yaml-mode "yaml-mode.el")

(add-hook 'yaml-mode-hook
          (lambda()
            (electric-indent-local-mode -1)))

(provide 'yaml-settings)
