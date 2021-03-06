;(require 'dash)

(defun lunaryorn-use-js-executables-from-node-modules ()
  "Set executables of JS checkers from local node modules."
  (-when-let* ((file-name (buffer-file-name))
               (root (locate-dominating-file file-name "node_modules"))
               (bin-dir (expand-file-name "node_modules/.bin" root)))
    (pcase-dolist (`(,checker . ,module) '((javascript-jshint . "jshint")
                                           (javascript-eslint . "eslint")
                                           (javascript-jscs   . "jscs")))
      (let ((executable-var (flycheck-checker-executable-variable checker))
            (bin (expand-file-name module bin-dir)))
        (when (file-exists-p bin)
          (set (make-local-variable executable-var) bin))))))


(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config (progn
            (setq flycheck-python-flake8-executable "flake8")
            (add-hook 'flycheck-mode-hook #'lunaryorn-use-js-executables-from-node-modules)))

(use-package flycheck-yamllint
  :ensure t
  :defer t
  :init
  (progn
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook 'flycheck-yamllint-setup))
    (add-hook 'yaml-mode-hook 'flycheck-mode)))

;;flycheck-status-emoji

;;(setq flycheck-locate-config-file-functions
;;      '(flycheck-locate-config-file-home
;;        flycheck-locate-config-file-ancestor-directories
;;        flycheck-locate-config-file-absolute-path))


(provide 'flycheck-settings)
