(ensure-packages-installed 'markdown-mode 'markdown-toc)

;;markdown-toc doesn't define its own autoloads properly here; do it
;;manually.
(autoload 'markdown-toc/generate-toc "markdown-toc" nil t)
(autoload 'markdown-toc/version "markdown-toc" nil t)


(provide 'markdown-settings)
