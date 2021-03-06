
;;; Ensure my baseline packages are installed
(ensure-packages-installed 'rainbow-delimiters
                           'hideshowvis
                           'leuven-theme 'nginx-mode
                           'graphviz-dot-mode 'paradox
                           'systemd)


;;; Some global modes I want
(global-auto-revert-mode t)


;;I don't know why it is so hard to say "really use utf8"
(prefer-coding-system 'utf-8-unix)
(push (cons "\\.\\(lisp\\|asd\\|sh\\|py\\|cl\\)\\'" 'utf-8-unix) auto-coding-alist)

;;Set manwidth explicitly; otherwise it splits the frame then formats
;;the man page to be the width of the entire frame. (WTF?)
(setenv "MANWIDTH" "80")

(defun insert-key (key)
  (interactive (list (read-key-sequence "Key: ")))
  (insert "(kbd \"" (key-description key) "\")"))


;; without this the background is *always* white; from
;; https://groups.google.com/forum/#!topic/gnu.emacs.help/e340xVG-Zjo
(setq inhibit-x-resources t)


(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "C-c j") 'join-line)

(push '("(\\.|sys)log$" . syslog-mode) auto-mode-alist)

;; use utf-8-dos for some windows-specific files
(push (cons "\\.\\(asp\\|csproj\\|as[cmp]x\\)\\'" 'utf-8-dos) auto-coding-alist)
(push (cons "web\\(\\.\\w+\\)?\\.config\\'" 'utf-8-dos) auto-coding-alist)

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
  "Insert a look of disapproval `ಠ_ಠ' at the current point"
  (interactive)
  (insert "ಠ_ಠ"))

(defun checkmark ()
  "Insert a checkmark `✓' at the current point"
  (interactive)
  (insert-string "✓"))

(autoload 'dired-extra-startup "dired-x")
(autoload 'dired-omit-mode "dired-x" "Ignore garbage files" t)

;; Turn off novice.el functionality
(setq disabled-command-function nil)

(provide 'misc-settings)
