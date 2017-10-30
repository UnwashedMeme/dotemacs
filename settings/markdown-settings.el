(ensure-packages-installed 'markdown-mode 'markdown-toc)

(use-package markdown-mode
             :ensure markdown-mode
             :mode "\\.md\\'"
             :config (progn
                       (when (executable-find "marked")
                         (setf markdown-command "marked"))
                       (setf markdown-css-paths
                             '("https://raw.githubusercontent.com/gollum/gollum/master/lib/gollum/public/gollum/css/template.css")
                                ;"http://kevinburke.bitbucket.org/markdowncss/markdown.css"
                             )
                       (add-to-list 'markdown-mode-hook 'flyspell-mode)
                       (add-to-list 'markdown-mode-hook '(lambda ()
                                                          (electric-indent-local-mode 0)))))

(use-package markdown-toc
             :ensure markdown-toc
             :defer t
             :init (progn
                     ;;markdown-toc doesn't define its own autoloads properly here; do it
                     ;;manually.
                     (autoload 'markdown-toc/generate-toc "markdown-toc" nil t)
                     (autoload 'markdown-toc/version "markdown-toc" nil t)
                     ))
(provide 'markdown-settings)
