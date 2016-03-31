;;;; python-mode.el code

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python[0-9.]*" . python-mode)
  :bind (:map python-mode-map
              (("C-x C-e" . python-shell-send-region)))
  :config
  (progn
    (add-hook 'python-mode-hook 'hideshowvis-minor-mode)
    (add-hook 'python-mode-hook
              '(lambda ()
                (push '("lambda" . ?λ) prettify-symbols-alist)
                (push '("<=" . ?≤) prettify-symbols-alist)
                (push '(">=" . ?≥) prettify-symbols-alist)
                (prettify-symbols-mode)))
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

(use-package mypylint
             :ensure python-pylint
             :commands mypylint)

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



;;;; pyflakes ELPY does pretty well with pyflakes/flake8 by itself;
;;;; this adds a bit of ignore logic but...

;; (use-package flymake-python-pyflakes
;;              :ensure flymake-python-pyflakes
;;              :defer t
;;              :config (setf flymake-python-pyflakes-executable "flake8"))


;; (defun maybe-flymake-activate ()
;;   (cond ((not (tramp-handle-file-remote-p (buffer-file-name)))
;;          (message "Activating flymake-python-pyflakes")
;;          (flymake-python-pyflakes-load)
;;          (message "Activing custom navigation minor-mode.")
;;          (my-pyflakes-minor-mode))
;;         (t
;;          (message "Skipping flymake-python-pyflakes for remote tramp buffer."))))

(provide 'python-settings)
