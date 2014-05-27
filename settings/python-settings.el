;;;; python-mode.el code
(ensure-packages-installed 'elpy 'flymake-python-pyflakes)

(add-hook 'python-mode-hook 'hideshowvis-minor-mode)
(add-hook 'python-mode-hook #'lambda-mode 1)
;;(add-hook 'python-mode-hook #'hs-minor-mode 1)

;; elpy handles this
;; (add-hook 'python-mode-hook 'ctags-update-minor-mode)


(elpy-enable)
(elpy-use-ipython)


(define-key elpy-mode-map [C-up] 'backward-paragraph)
(define-key elpy-mode-map [C-down] 'forward-paragraph)



(setf flymake-python-pyflakes-executable "flake8")

;;;; pyflakes
(autoload 'mypylint "mypylint" nil t)
(autoload 'my-pyflakes-minor-mode "mypylint")
(defun maybe-flymake-activate ()
  (cond ((not (tramp-handle-file-remote-p (buffer-file-name)))
         (message "Activating flymake-python-pyflakes")
         (flymake-python-pyflakes-load)
         (message "Activing custom navigation minor-mode.")
         (my-pyflakes-minor-mode))
        (t
         (message "Skipping flymake-python-pyflakes for remote tramp buffer."))))

;;; maybe start pyflakes when we load python
(add-hook 'python-mode-hook 'maybe-flymake-activate)



(provide 'python-settings)
