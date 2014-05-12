(ensure-packages-installed 'mmm-mode)
(require 'mmm-auto)



(setq mmm-global-mode 'maybe)
;; in html-mode files with the php extension use 'html-php

(mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)
(mmm-add-mode-ext-class 'html-mode nil 'html-js)
(mmm-add-mode-ext-class 'html-mode nil 'html-css)

(provide 'mmm-settings)
