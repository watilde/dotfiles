;; Install and load packages

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load (locate-user-emacs-file "package.el"))

;; Load inits files
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
