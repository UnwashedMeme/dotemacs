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
             :ensure t
             :defer t
             :config
             (progn
               (elpy-enable)
               (setq elpy-test-runner 'elpy-test-pytest-runner)

               (when (require 'flycheck nil t)
                 (message "Enabling flycheck/elpy integration")
                 (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
                 (add-hook 'elpy-mode-hook 'flycheck-mode)
                 (define-key elpy-mode-map "\C-c\C-n" 'flycheck-next-error)
                 (define-key elpy-mode-map "\C-c\C-p" 'flycheck-previous-error)))
             :bind ((:map elpy-mode-map
                          ([C-right] . right-word)
                          ([C-left] . left-word))))
;(elpy-use-ipython)
;(setenv "IPY_TEST_SIMPLE_PROMPT" "1")


(provide 'python-settings)
