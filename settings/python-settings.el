;;;; python-mode.el code

(elpy-enable)
(elpy-use-ipython)

;; (setq py-install-directory
;;       (first (find-subdirs-containing init-path "python-mode.el")))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)
;; (autoload 'ipython "python-mode" "Start and IPython shell." t)
;; (autoload 'py-shell "python-mode" "Start and python shell." t)


;;;; pymacs code

;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)


;; ;;;; ropemacs 

;; (defun python-settings-load-pymacs-modules ()
;;   (pymacs-load "ropemacs" "rope-")
;;   (defadvice ropemacs-mode (around no-ropemacs-tramp activate)
;;     (unless (tramp-handle-file-remote-p (buffer-file-name))
;;       ad-do-it)))

;; (defun ropemacs-mode ()
;;   "load ropemacs then activate ropemacs mode"
;;   (interactive)
;;   (python-settings-load-pymacs-modules)
;;   (ropemacs-mode))

 

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


(add-hook 'python-mode-hook #'lambda-mode 1)
;(add-hook 'python-mode-hook #'hs-minor-mode 1)
;(add-hook 'python-mode-hook 'ctags-update-minor-mode)


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


