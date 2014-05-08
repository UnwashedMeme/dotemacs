(ensure-packages-installed 'scss-mode)

(setq scss-compile-at-save nil)
(add-to-list 'auto-mode-alist '("\\.s[ac]ss$" . scss-mode))

(add-hook 'scss-mode-hook 'flymake-sass-load)

(provide 'sass-settings)
