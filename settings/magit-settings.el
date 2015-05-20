(use-package magit
             :ensure magit
             :bind ("C-x g" . magit-status)
             :init
             (progn
               (setq magit-last-seen-setup-instructions "1.4.0")))

(use-package mo-git-blame
             :ensure mo-git-blame
             :defer 5)

;; (add-to-list 'magit-mode-hook
;;              #'(lambda ()
;;                  (make-local-variable 'scroll-margin)
;;                  (setq scroll-margin 15)))

;(setq magit-read-file-hist ())


(provide 'magit-settings)
