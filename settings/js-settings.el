(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;(add-hook 'js2-mode-hook 'flymake-jshint-load)
(add-hook 'js2-mode-hook 'flycheck-mode)

(add-hook 'js2-mode-hook 'hideshowvis-minor-mode)

(defun js2r-enable-keybindings ()
  (require 'js2-refactor)
  (js2r-add-keybindings-with-prefix "C-c C-r"))
(add-hook 'js2-mode-hook 'js2r-enable-keybindings)

(autoload 'js2-jshint-apply-jshintrc "js2-jshint-extras.el")


(defun nb-js-additional-externs ()
  (let ((jshintrc (expand-file-name ".jshintrc"
                                    (locate-dominating-file
                                     default-directory ".jshintrc"))))
    (when (file-readable-p jshintrc)
      (message "Using jshintrc file: %s" jshintrc)
      (let ((jshintrc-data (json-read-file jshintrc)))
        (setq js2-additional-externs
              (union js2-additional-externs
                      (mapcar #'symbol-name
                              (mapcar #'car
                                      (cdr (assq 'globals jshintrc-data))))))))))

(add-hook 'js2-mode-hook 'nb-js-additional-externs)
(add-hook 'js2-mode-hook 'js2-jshint-apply-jshintrc)
