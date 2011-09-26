
;;;;;;;;;;;;; slime-setup ;;;;;;;;;;;;;;
(if (equal (system-name) "nathan-ubuntu")
    (load "/home/ACCELERATION/nathan/projects/lisp/ADWCodeBase/misc/shared-slime-init.el")
  (progn
    (add-to-list 'load-path "S:/slime")
    (autoload 'slime "S:/home/nathan/lisp/ADWCodeBase/misc/shared-slime-init.el" nil t)
    (autoload 'slime-connect "S:/home/nathan/lisp/ADWCodeBase/misc/shared-slime-init.el" nil t)
    ))


(lexical-let ((progden-lisp-map
               '(("/home/ACCELERATION/" . "/mnt/progden/home/")
                 ("/usr/local/share/common-lisp/source/" . "/mnt/progden/site/")
                 ("/opt/lisp" . "/mnt/progden")
                 ("/var/git" . "/mnt/progden/gitroot")
                 ("/var/darcs" . "/mnt/progden/darcs-root"))))
(push (list "progden"
            (lambda (local-filename)
              (setf local-filename (replace-in-string local-filename "\\\\" "/"))
              (let ((the-map (find-if (lambda (amap)
                                        (string-starts-with local-filename (shared-lisp-map-local amap)))
                                      progden-lisp-map)))
                (concat (shared-lisp-map-remote the-map)
                        (substring local-filename (length (shared-lisp-map-local the-map))))))
            (lambda (remote-filename)
              (let ((the-map (find-if (lambda (amap)
                                        (string-starts-with remote-filename (shared-lisp-map-remote amap)))
                                      progden-lisp-map)))
                (concat (shared-lisp-map-local the-map)
                        (substring remote-filename
                                   (length (shared-lisp-map-remote the-map)))))))
      slime-filename-translations))