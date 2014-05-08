(ensure-packages-installed 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

;;(require 'magit)



;; (add-to-list 'auto-mode-alist '("\\.?gitignore" . conf-mode))
;; (add-to-list 'auto-mode-alist '("\\.?gitconfig" . conf-mode))

;; (add-to-list 'magit-mode-hook
;;              #'(lambda ()
;;                  (make-local-variable 'scroll-margin)
;;                  (setq scroll-margin 15)))

;(setq magit-read-file-hist ())


(provide 'magit-settings)
