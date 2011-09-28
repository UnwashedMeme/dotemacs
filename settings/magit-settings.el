(require 'magit)
(global-set-key (kbd "C-c C-m") 'magit-status)
(global-set-key (kbd "C-c g") 'magit-status)

(add-to-list 'auto-mode-alist '("\\.?gitignore" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.?gitconfig" . conf-mode))
