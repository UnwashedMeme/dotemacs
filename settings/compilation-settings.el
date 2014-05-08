
(ignore-errors
  (defun my-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))

(defun disable-line-wrapping ()
  (toggle-truncate-lines 1))

(add-hook 'compilation-filter-hook 'disable-line-wrapping)

(provide 'compilation-settings)
