(ensure-packages-installed 'php-mode)

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(add-hook 'php-mode-hook 'flycheck-mode)
