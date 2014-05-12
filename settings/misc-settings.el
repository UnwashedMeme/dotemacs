(prefer-coding-system 'utf-8-unix)
(push (cons "\\.\\(lisp\\|asd\\|sh\\|py\\|cl\\)\\'" 'utf-8-unix) auto-coding-alist)

(setenv "MANWIDTH" "88")
(defun insert-key (key)
  (interactive (list (read-key-sequence "Key: ")))
  (insert "(kbd \"" (key-description key) "\")"))


;; without this the background is *always* white; from
;; https://groups.google.com/forum/#!topic/gnu.emacs.help/e340xVG-Zjo
(setq inhibit-x-resources t)


(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "C-=") 'er/expand-region)


(push '("(\\.|sys)log$" . syslog-mode) auto-mode-alist)

;;; Ensure my baseline packages are installed
(ensure-packages-installed 'markdown-mode 'rainbow-delimiters 'hideshowvis
                           'expand-region 'leuven-theme 'moe-theme 'nginx-mode 'graphviz-dot-mode 'paradox)


;;CSS mode crap
;;try to fix strange stuff in css mode.
;(require 'css-mode)
;(setq cssm-indent-level 2)
;(setq cssm-newline-before-closing-bracket t)
;(setq cssm-indent-function #'cssm-c-style-indenter)

;; Replace Stupid yes or no with y or n
(defalias 'old-yes-or-no-p (function yes-or-no-p))
(defalias 'yes-or-no-p (function y-or-n-p))



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
