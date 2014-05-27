;;;; python-mode.el code
(ensure-packages-installed 'elpy)

(add-hook 'python-mode-hook 'hideshowvis-minor-mode)
(add-hook 'python-mode-hook #'lambda-mode 1)
;(add-hook 'python-mode-hook #'hs-minor-mode 1)
;(add-hook 'python-mode-hook 'ctags-update-minor-mode)


(elpy-enable)
(elpy-use-ipython)

;;old customization that probably isn't necessary anymore
;; '(py-shell-name "ipython")
;; '(py-start-run-py-shell nil)
;; '(ropemacs-guess-project t)



(define-key elpy-mode-map [C-up] 'backward-paragraph)
(define-key elpy-mode-map [C-down] 'forward-paragraph)



(setf flymake-python-pyflakes-executable "flake8")

;;;; pyflakes
(autoload 'mypylint "mypylint")
(autoload 'my-pyflakes-minor-mode "mypylint")
;; (defun maybe-flymake-activate ()
;;   (cond ((not (tramp-handle-file-remote-p (buffer-file-name)))
;;          (message "Activating flymake-python-pyflakes")
;;          (flymake-python-pyflakes-load)
;;          (message "Activing custom navigation minor-mode.")
;;          (my-pyflakes-minor-mode))
;;         (t
;;          (message "Skipping flymake-python-pyflakes for remote tramp buffer."))))

;;; maybe start pyflakes when we load python
;(add-hook 'python-mode-hook 'maybe-flymake-activate)



;; (eval-after-load 'auto-complete
;;   '(progn
;;     (python-settings-load-pymacs-modules)
;;     (ac-ropemacs-initialize)
;;     (add-hook 'python-mode-hook
;;      (lambda ()
;;        (add-to-list 'ac-sources 'ac-source-ropemacs)))))




;; (add-hook 'python-mode-hook
;;           #'(lambda ()
;;               (autopair-mode)
;;               (push '(?' . ?')
;;                     (getf autopair-extra-pairs :code))
;;               (setq autopair-handle-action-fns
;;                     (list #'autopair-default-handle-action
;;                           #'autopair-python-triple-quote-action)))
;;           1)

;; (add-hook 'python-mode-hook
;;           #'(lambda ()
;;               (message "python-mode-hook")
;;               (when delete-selection-mode
;;                 (message "Disabling delete-selection-mode")
;;                 (delete-selection-mode))
;;               (smartparens-mode)
;;               (sp-turn-on-delete-selection-mode)))


;;;;; try to make python inferior processes behave better
;; (require 'comint)
;; (define-key comint-mode-map (kbd "M-") 'comint-next-input)
;; (define-key comint-mode-map (kbd "M-") 'comint-previous-input)
;; (define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
;; (define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)

(provide 'python-settings)
