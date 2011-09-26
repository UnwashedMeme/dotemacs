


(prefer-coding-system 'utf-8-unix)
(push (cons "\\.\\(lisp\\|asd\\|sh\\|py\\|cl\\)\\'" 'utf-8-unix) auto-coding-alist)




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




;(setq mouse-drag-copy-region nil)


;(require 'uniquify)


(setq
  scroll-margin 3
  scroll-conservatively 100000
  scroll-preserve-screen-position 1)


;;CSS mode crap
;;try to fix strange stuff in css mode.
;(require 'css-mode)
;(setq cssm-indent-level 2)
;(setq cssm-newline-before-closing-bracket t)
;(setq cssm-indent-function #'cssm-c-style-indenter)
(push '("\\.php$" . html-mode) auto-mode-alist)



(global-set-key (read-kbd-macro "<C-tab>") 'other-window)


;; Replace Stupid yes or no with y or n
(defalias 'old-yes-or-no-p (function yes-or-no-p))
(defalias 'yes-or-no-p (function y-or-n-p))


;(setq whitespace-style '(trailing tabs lines-tail empty))
;(global-whitespace-mode)

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))




