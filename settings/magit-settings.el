(use-package magit
             :ensure magit
             :bind ("C-x g" . magit-status))

(use-package mo-git-blame
             :ensure mo-git-blame
             :defer t)

;; (add-to-list 'magit-mode-hook
;;              #'(lambda ()
;;                  (make-local-variable 'scroll-margin)
;;                  (setq scroll-margin 15)))

;(setq magit-read-file-hist ())


(provide 'magit-settings)
