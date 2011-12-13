;(push (expand-file-name "~/.emacs.d/site-lisp/Pymacs") load-path)
;(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)

;(setq py-python-command-args '("-i" "--colors=LightBG" "--no-term-title"))
;(require 'ipython)
;(setq py-python-command-args '("-i" "--colors=LightBG" "--no-term-title"))


(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                   interpreter-mode-alist))

(autoload 'python-mode "python-mode" "Python editing mode." t)

(eval-after-load 'python-mode 
                 '(run-with-idle-timer  10 nil 
                   '(lambda ()
                     (message "Idle loading ropemacs.")
                     (require 'pymacs)
                     (pymacs-load "ropemacs" "rope-")
                     ;;ropemacs isn't working over tramp for me right now.
                     (remove-hook 'python-mode-hook 'ropemacs-mode)
                     (add-hook 'python-mode-hook 
                      #'(lambda ()
                          (unless (tramp-handle-file-remote-p (buffer-file-name))
                            (ropemacs-mode))))
                     (message "Finished loading ropemacs."))))



(eval-after-load 'auto-complete
  '(progn
     (ac-ropemacs-initialize)
     (add-hook 'python-mode-hook
               (lambda ()
                 (add-to-list 'ac-sources 'ac-source-ropemacs)))))

(require 'virtualenv)


(add-hook 'python-mode-hook #'lambda-mode 1)
(add-hook 'python-mode-hook #'hs-minor-mode 1)

(add-hook 'python-mode-hook
          #'(lambda ()
              (autopair-mode)
              (push '(?' . ?')
                    (getf autopair-extra-pairs :code))
              (setq autopair-handle-action-fns
                    (list #'autopair-default-handle-action
                          #'autopair-python-triple-quote-action)))
          1)

(require 'comint)
(define-key comint-mode-map (kbd "M-") 'comint-next-input)
(define-key comint-mode-map (kbd "M-") 'comint-previous-input)
(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)
