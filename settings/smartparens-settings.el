(ensure-packages-installed 'smartparens)

(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; If non-nil, autoskip of closing pair is cancelled not only
;;when point is moved outside of the pair, but also if the point
;; moved backwards.  See `sp-skip-closing-pair' for more info.
(setf sp-cancel-autoskip-on-backward-movement nil)


;(define-key sp-keymap (kbd "<C-right>") 'sp-forward-sexp)
;(define-key sp-keymap (kbd "<C-left>") 'sp-backward-sexp)
(provide 'smartparens-settings)
