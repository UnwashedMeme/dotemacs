
;;;;;;;;;;;;; slime-setup ;;;;;;;;;;;;;;
(if (equal (system-name) "nathan-ubuntu")
    (load (expand-file-name "~/projects/lisp/ADWCodeBase/misc/shared-slime-init.el"))
  (progn
    (add-to-list 'load-path "S:/slime")
    (autoload 'slime "S:/home/nathan/lisp/ADWCodeBase/misc/shared-slime-init.el" nil t)
    (autoload 'slime-connect "S:/home/nathan/lisp/ADWCodeBase/misc/shared-slime-init.el" nil t)
    ))

(push 
 (slime-filename-translation-mount-map
  "progden" '(("/home/ACCELERATION/" . "/mnt/progden/home/")
              ("/usr/local/share/common-lisp/source/" . "/mnt/progden/site/")
              ("/opt/lisp" . "/mnt/progden")
              ("/var/git" . "/mnt/progden/gitroot")
              ("/var/darcs" . "/mnt/progden/darcs-root")))
 slime-filename-translations)

;; (destructuring-bind (name local remote)
;;     (slime-filename-translation-mount-map
;;      "progden" '(("/home/ACCELERATION/" . "/mnt/progden/home/")
;;                  ("/usr/local/share/common-lisp/source/" . "/mnt/progden/site/")
;;                  ("/var/git" . "/mnt/progden/gitroot")
;;                  ("/var/darcs" . "/mnt/progden/darcs-root")
;;                  ("/opt/lisp" . "/mnt/progden")))
;;   (list (funcall remote     "/var/git/clsql-helper/date.lisp")
;;         (funcall local "/mnt/progden/gitroot/clsql")
;;         (funcall remote "/something/weird")))

;(slime-tramp-from-lisp-filename "/var/git/clsql-helper/date.lisp")
