(ensure-packages-installed 'undo-tree)

(require 'undo-tree)

(global-undo-tree-mode)

(global-set-key (read-kbd-macro "C-z") 'undo-tree-undo)
(global-set-key (read-kbd-macro "C-S-Z") 'undo-tree-redo)

(provide 'undo-settings)
