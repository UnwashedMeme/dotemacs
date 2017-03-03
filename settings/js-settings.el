
(use-package js2-mode
  :mode "\\.js\\'"
;  :bind (:map js2-mode-map ("S-SPC" . company-complete))
  :config (progn
            (setf js2-highlight-external-variables nil)
            (let ((modes '(flycheck-mode hideshowvis-minor-mode rainbow-delimiters-mode company-mode)))
              (mapc (lambda (m) (add-hook 'js2-mode-hook m))
                    (remove-if-not 'functionp modes)))

            (add-hook 'js2-mode-hook
                      '(lambda ()
                         (setq js2-basic-offset 2)
                         (push '("function" . ?λ) prettify-symbols-alist)
                         (push '("<=" . ?≤) prettify-symbols-alist)
                         (push '(">=" . ?≥) prettify-symbols-alist)
                         (prettify-symbols-mode)))

            ))

(use-package js2-refactor)
(require 'flycheck-settings)



(use-package company-tern
  :if (executable-find "tern")
  :commands (company-tern)
  :init (add-hook 'js2-mode-hook 'tern-mode)
  )

;(defun js2-ac-activate ()
;  (auto-complete-mode 1)
;  (add-to-list 'ac-sources 'ac-source-yasnippet)
;  (add-to-list 'ac-sources 'ac-source-etags))
;(add-hook 'js2-mode-hook 'js2-ac-activate)




;(defun js2r-enable-keybindings ()
;  (require 'js2-refactor)
;  (js2r-add-keybindings-with-prefix "C-c C-r"))
;(add-hook 'js2-mode-hook 'js2r-enable-keybindings)



;;; If you want to use flymake instead of flycheck
;; (ensure-packages-installed 'flymake-jshint)
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (setq-local jshint-configuration-path
;;                         (expand-file-name ".jshintrc"
;;                                           (locate-dominating-file
;;                                            default-directory ".jshintrc")))
;;             (flymake-jshint-load)))


;;; If you want js2 to highlight externals:
;; (defun nb-js-additional-externs ()
;;   (let ((jshintrc (expand-file-name ".jshintrc"
;;                                     (locate-dominating-file
;;                                      default-directory ".jshintrc"))))
;;     (when (file-readable-p jshintrc)
;;       (message "Using jshintrc file: %s" jshintrc)
;;       (let ((jshintrc-data (json-read-file jshintrc)))
;;         (setq js2-additional-externs
;;               (union js2-additional-externs
;;                       (mapcar #'symbol-name
;;                               (mapcar #'car
;;                                       (cdr (assq 'globals jshintrc-data))))))))))
;;(add-hook 'js2-mode-hook 'nb-js-additional-externs)


(provide 'js-settings)
