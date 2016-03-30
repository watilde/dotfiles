;; Install and load packages
(load (locate-user-emacs-file "package.el"))

;; Load inits files
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
