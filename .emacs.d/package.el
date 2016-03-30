;; list the packages
(setq package-list '(js2-mode tabbar init-loader))

;; Access Marmalade and MELPA repositories, in addition to GNU ELPA
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(setq package-user-dir (locate-user-emacs-file "packages"))


;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
