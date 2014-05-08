(ensure-packages-installed 'ido-ubiquitous 'flx-ido)


;;(setq ido-enable-flex-matching t)
;;(setq ido-mode (quote both) nil (ido))
;;(setq ido-enable-flex-matching t)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
(setq flx-ido-use-faces t)


;;; when typing a new filename don't suggest a different directory's
;;; file by the same name
(setq ido-auto-merge-work-directories-length -1)
;;(setq ido-auto-merge-delay-time 999)


(ido-ubiquitous-mode)

(provide 'ido-settings)
