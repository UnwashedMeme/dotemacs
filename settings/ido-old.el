(ensure-packages-installed 'smex)

(add-hook 'after-init-hook 'smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)


(ensure-packages-installed 'ido-ubiquitous)

(ido-mode 1)
(ido-everywhere 1)

(defun enable-flx-ido ()
  (ensure-packages-installed 'flx-ido)
  ;; flx-ido-mode is kind of nice in its highlighting but is really
  ;; jumpy in its matching E.g. when typing a filename that is an exact
  ;; match, but with another file in the directory that is a flex
  ;; match, every keystroke flips between the two matches
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights.
  (setq ido-use-faces nil)
  (setq flx-ido-use-faces t)
 (setq ido-enable-flex-matching t)

)

(defun disable-flx-ido ()
  (flx-ido-mode 0)
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces t)
)
(enable-flx-ido)


;;; when typing a new filename don't suggest a different directory's
;;; file by the same name
(setq ido-auto-merge-work-directories-length -1)
;;(setq ido-auto-merge-delay-time 999)


(ido-ubiquitous-mode)

(provide 'ido-settings)
