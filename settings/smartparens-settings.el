(ensure-packages-installed 'smartparens)

(require 'smartparens-config)
(run-with-idle-timer 1.1 nil 'smartparens-global-mode)
;(define-key sp-keymap (kbd "<C-right>") 'sp-forward-sexp)
;(define-key sp-keymap (kbd "<C-left>") 'sp-backward-sexp)
(provide 'smartparens-settings)
