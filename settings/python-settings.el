;;;; python-mode.el code

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python[0-9.]*" . python-mode)
  :config
  (progn
    (add-hook 'python-mode-hook 'hideshowvis-minor-mode)
    (add-hook 'python-mode-hook #'lambda-mode 1)
    (require 'elpy)))

(use-package elpy
             :ensure elpy
             :defer t
             :config
             (progn
               (elpy-enable)
               (elpy-use-ipython)
               (setq elpy-test-runner 'elpy-test-pytest-runner)
               (define-key elpy-mode-map [C-right] 'right-word)
               (define-key elpy-mode-map [C-left] 'left-word)))

;; elpy handles this
;; (add-hook 'python-mode-hook 'ctags-update-minor-mode)


;; (setf elpy-rpc-backend nil)
;; (defadvice elpy-rpc--open (around native-rpc-for-tramp activate)
;;   (interactive)
;;   (let ((elpy-rpc-backend
;;          (if (ignore-errors (tramp-tramp-file-p (elpy-project-root)))
;;              "native"
;;            elpy-rpc-backend)))
;;      (message "Using elpy backend: %s for %s" elpy-rpc-backend (elpy-project-root))
;;      ad-do-it))


;(define-key elpy-mode-map [C-up] 'backward-paragraph)
;(define-key elpy-mode-map [C-down] 'forward-paragraph)



(use-package flymake-python-pyflakes
             :ensure flymake-python-pyflakes
             :defer t
             :config (setf flymake-python-pyflakes-executable "flake8"))

;;;; pyflakes
(use-package mypylint
             :commands mypylint my-pyflakes-minor-mode
             :init (add-hook 'python-mode-hook 'maybe-flymake-activate))

(defun maybe-flymake-activate ()
  (cond ((not (tramp-handle-file-remote-p (buffer-file-name)))
         (message "Activating flymake-python-pyflakes")
         (flymake-python-pyflakes-load)
         (message "Activing custom navigation minor-mode.")
         (my-pyflakes-minor-mode))
        (t
         (message "Skipping flymake-python-pyflakes for remote tramp buffer."))))

;;; maybe start pyflakes when we load python




(provide 'python-settings)
