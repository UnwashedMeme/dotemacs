;; less crazy yaml indentation/enter-key

(ensure-packages-installed 'yaml-mode)

(push '("/etc/salt/master\\.d/" . yaml-mode) auto-mode-alist)
(push '("\\.sls$" . yaml-mode) auto-mode-alist)
(autoload 'yaml-mode "yaml-mode.el" "yaml mode" t)

(add-hook 'yaml-mode-hook
          (lambda()
            (electric-indent-local-mode -1)))

(provide 'yaml-settings)
