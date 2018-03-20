;; ripgrep-search-mode

(use-package ripgrep
  :if (executable-find "rg")
  :commands (ripgrep-regexp)
  :ensure t
  :bind (:map ripgrep-search-mode-map
              ("n" . next-error-no-select)
              ("p" . previous-error-no-select)))

(use-package projectile-ripgrep
  :if (executable-find "rg")
  :ensure t
  :commands (projectile-ripgrep)
  :bind (:map projectile-mode-map
              ("C-c p s r" . projectile-ripgrep))
  :config (require 'projectile-settings))


(provide 'ripgrep-settings)
