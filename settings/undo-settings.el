(use-package undo-tree
             :ensure undo-tree
             :bind (("C-z" . undo-tree-undo)
                    ("C-S-Z" . undo-tree-redo))
             :init (global-undo-tree-mode))
(provide 'undo-settings)
