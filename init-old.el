





;; (let ((base "~/.emacs.d/site-lisp"))
;;   (add-to-list 'load-path base)
;;   (dolist (f (directory-files base))
;;     (let ((name (concat base "/" f)))
;;       (when (and (file-directory-p name) 
;;                  (not (equal f ".."))
;;                  (not (equal f ".")))
;;         (add-to-list 'load-path name)))))




;(setq tramp-default-method "sshx")
;;this breaks tramp right now: ^m on the end of every line; disable it.
;(setq vc-handled-backends (delq 'Git vc-handled-backends))


;(require 'uniquify)




