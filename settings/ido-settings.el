(ensure-packages-installed 'ido-ubiquitous
                           ;'flx-ido
                           )


;;(setq ido-mode (quote both) nil (ido))
;;(setq ido-enable-flex-matching t)

(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)

;;; flx-ido-mode is kind of nice in its highlighting but is really
;;; jumpy in its matching E.g. when typing a filename that is an exact
;;; match, but with another file in the directory that is a flex
;;; match, every keystroke flips between the two matches
;(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
;(setq ido-use-faces nil)
;(setq flx-ido-use-faces t)


;;; when typing a new filename don't suggest a different directory's
;;; file by the same name
(setq ido-auto-merge-work-directories-length -1)
;;(setq ido-auto-merge-delay-time 999)


(ido-ubiquitous-mode)

(provide 'ido-settings)
