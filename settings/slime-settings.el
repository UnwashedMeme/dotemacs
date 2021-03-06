;;;;;;;;;;;;; slime-setup ;;;;;;;;;;;;;;

(setf adw-slime-init-keep-slime t)
(setf adw-shared-slime-init (expand-file-name "ADWCodeBase_Lisp/misc/shared-slime-init.el" init-packages-path))
(when (file-exists-p adw-shared-slime-init)
  (load adw-shared-slime-init)
  (setq inferior-lisp-program "sbcl")

  (push (slime-create-filename-translator :machine-instance "progden" :username "nathan")
        slime-filename-translations)
  ;; (push
  ;;  (slime-filename-translation-mount-map
  ;;   "progden" '(("/home/ACCELERATION/nathan/" . "/mnt/progden/home/nathan/")
  ;;               ("/home/ACCELERATION/" . "/mnt/progden/home/")
  ;;               ("/usr/local/share/common-lisp/source/" . "/mnt/progden/site/")
  ;;               ("/opt/lisp/" . "/mnt/progden/")
  ;;               ("/var/git" . "/mnt/progden/gitroot")
  ;;               ("/var/darcs" . "/mnt/progden/darcs-root")))
  ;;  slime-filename-translations)

  (push
   (slime-filename-translation-mount-map
    "internal03" '(("/home/ACCELERATION/nathan/" . "/mnt/progden/home/nathan/")
                   ("/home/ACCELERATION/" . "/mnt/progden/home/")
                   ("/usr/local/share/common-lisp/source/" . "/mnt/progden/site/")
                   ("/opt/lisp/" . "/mnt/progden/")
                   ("/var/git" . "/mnt/progden/gitroot")
                   ("/var/darcs" . "/mnt/progden/darcs-root")))
   slime-filename-translations)

  (push
   (slime-filename-translation-mount-map
    "nathan-ubuntu" '(("" . "")))
   slime-filename-translations)

  ;; (destructuring-bind (name local remote)
  ;;     (slime-filename-translation-mount-map
  ;;      "progden" '(("/home/ACCELERATION/" . "/mnt/progden/home/")
  ;;                  ("/usr/local/share/common-lisp/source/" . "/mnt/progden/site/")
  ;;                  ("/var/git" . "/mnt/progden/gitroot")
  ;;                  ("/var/darcs" . "/mnt/progden/darcs-root")
  ;;                  ("/opt/lisp/" . "/mnt/progden/")))
  ;;   (list (funcall remote     "/var/git/clsql-helper/date.lisp")
  ;;         (funcall local "/mnt/progden/gitroot/clsql")
  ;;         (funcall remote "/something/weird")))

                                        ;(slime-tramp-from-lisp-filename "/home/ACCELERATION/russ/lisp/ADWolf/src/adwolf-model.lisp")


  (defun slime-progden ()
    (interactive)
    (slime-connect "127.0.0.1" 4216))

  (define-key slime-mode-map (kbd "C-c C-f") 'slime-complete-symbol)

  (provide 'slime-settings)
)
