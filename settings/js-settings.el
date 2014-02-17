(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'flymake-jshint-load)
(add-hook 'js2-mode-hook 'hideshowvis-minor-mode)

(defun js2r-enable-keybindings ()
  (require 'js2-refactor)
  (js2r-add-keybindings-with-prefix "C-c C-r"))
(add-hook 'js2-mode-hook 'js2r-enable-keybindings)
