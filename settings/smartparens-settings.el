(ensure-packages-installed 'smartparens)

(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; If non-nil, autoskip of closing pair is cancelled not only when
;; point is moved outside of the pair, but also if the point moved
;; backwards.  See `sp-skip-closing-pair' for more info.
(setf sp-cancel-autoskip-on-backward-movement nil)

; lisp-ish mode key bindings
(when (fboundp 'add-key-to-lisp-maps)
  (add-key-to-lisp-maps (kbd "C-t") 'sp-transpose-sexp)
  (add-key-to-lisp-maps (kbd "C-M-t") 'transpose-chars)
  (add-key-to-lisp-maps (kbd "C-M-k") 'kill-line)
  (add-key-to-lisp-maps (kbd "C-k") 'sp-kill-sexp)
  (add-key-to-lisp-maps (kbd "C-<right>") 'sp-forward-sexp)
  (add-key-to-lisp-maps (kbd "C-<left>") 'sp-backward-sexp)

  ;; (add-key-to-lisp-maps (kbd "C-S-<right>")
  ;;                       (lambda ()
  ;;                         (interactive)
  ;;                         (mark-sexp)))
  ;; (add-key-to-lisp-maps (kbd "C-S-<left>")
  ;;                       (lambda ()
  ;;                         (interactive)
  ;;                         (mark-sexp -1)))
  )


(provide 'smartparens-settings)
