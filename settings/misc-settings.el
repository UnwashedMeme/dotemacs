(prefer-coding-system 'utf-8-unix)
(push (cons "\\.\\(lisp\\|asd\\|sh\\|py\\|cl\\)\\'" 'utf-8-unix) auto-coding-alist)

(setenv "MANWIDTH" "92")

(defun insert-key (key)
  (interactive (list (read-key-sequence "Key: ")))
  (insert "(kbd \"" (key-description key) "\")"))


(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "C-c t") 'fold-dwim-toggle)
(global-set-key (kbd "C-=") 'er/expand-region)

(push '("\\.pp$" . puppet-mode) auto-mode-alist)


(push '("\\.vcl$" . vcl-mode) auto-mode-alist)
(autoload 'vcl-mode "vcl-mode.el")

(push '("\\.sls$" . yaml-mode) auto-mode-alist)
(autoload 'yaml-mode "yaml-mode.el")

(push '("\\.md$" . markdown-mode) auto-mode-alist)
(autoload 'markdown-mode "markdown-mode"
          "Major mode for editing Markdown files" t)

(run-with-idle-timer 3 nil 'yas-global-mode)

;;CSS mode crap
;;try to fix strange stuff in css mode.
;(require 'css-mode)
;(setq cssm-indent-level 2)
;(setq cssm-newline-before-closing-bracket t)
;(setq cssm-indent-function #'cssm-c-style-indenter)

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


(defun fixup-quotes ()
  "Get rid of smart quotes and replace them with normal quotes."
  (interactive)
  (save-excursion
   (goto-char (point-min))
   (while (search-forward-regexp "[“”]" nil t)
          (replace-match "\"" nil t))))


(defun my-help ()
  "If thing at point is a:
function, tries to `describe-function';
variable, uses 'describe-variable';
otherwise uses `manual-entry' to display
manpage of a `current-word'."
  (interactive)
  (let ((var (variable-at-point)))
    (if (symbolp var)
        (describe-variable var)
      (let ((fn (function-called-at-point)))
        (if fn
            (describe-function fn)
          (man (current-word)))))))

(global-set-key (kbd "<C-f1>") 'my-help)


;; C-mwheel for zooming, like other apps
(global-set-key (kbd "<C-mouse-4>")
                (lambda () (interactive) (text-scale-increase 1)))
(global-set-key (kbd "<C-mouse-5>")
                (lambda () (interactive) (text-scale-increase -1)))
(global-set-key (kbd "<C-down-mouse-2>")
                (lambda () (interactive) (text-scale-increase 0)))


;;;;;;;; Managing hooks ;;;;;;;;;

;; (add-hook 'hs-minor-mode-hook (lambda ()
;;                                 (when (and hs-minor-mode (not hideshowvis-minor-mode))
;;                                   (message "hs-minor-mode-hook powers activate hideshowvis")
;;                                   (hideshowvis-enable))))
;; Make scripts executable on save
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)


;;;;;;;; ;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;

(defun look-of-disapproval ()
  (interactive)
  (insert-string "ಠ_ಠ"))

(autoload 'dired-omit-mode "dired-x" "Ignore garbage files" t)

;; Turn off novice.el functionality
(setq disabled-command-function nil)
(provide 'misc-settings)



