;;; apache-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (apache-mode) "apache-mode" "apache-mode.el" (18336
;;;;;;  56441))
;;; Generated autoloads from apache-mode.el

(autoload (quote apache-mode) "apache-mode" "\
Major mode for editing Apache configuration files.

\(fn)" t nil)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;;;***

;;;### (autoloads nil nil ("apache-mode-pkg.el") (18336 56441 57000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; apache-mode-autoloads.el ends here
