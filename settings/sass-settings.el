(add-to-list 'auto-mode-alist '("\\.s[ac]ss$" . sass-mode))
(add-hook 'sass-hook 'flymake-sass-load)
