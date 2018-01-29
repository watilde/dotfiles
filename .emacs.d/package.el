;; list the packages
(setq package-list '(
  cc-mode
  flycheck
  haskell-mode
  init-loader
  js2-mode
  magit
  neotree
  python-mode
  rainbow-delimiters
  rust-mode
  sass-mode
  swift-mode
  tabbar))

;; Access Marmalade and MELPA repositories, in addition to GNU ELPA
(setq package-archives
  '( ("gnu" . "https://elpa.gnu.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))

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
