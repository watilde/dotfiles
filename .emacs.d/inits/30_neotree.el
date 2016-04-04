(require 'neotree)

(global-set-key (kbd "C-c t") 'neotree-toggle)

(setq neo-smart-open t)

(setq neo-window-position 'right)

(custom-set-faces
 '(col-highlight ((t (:background "color-233"))))
 '(hl-line ((t (:background "color-233"))))
 '(lazy-highlight ((t (:background "black" :foreground "white" :underline t))))
 '(neo-dir-link-face ((t (:foreground "cyan"))))
 '(neo-file-link-face ((t (:foreground "white")))))
(custom-set-variables)
