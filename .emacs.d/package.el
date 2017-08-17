;; list the packages
(setq package-list '(
  init-loader
  tabbar
  neotree
  sublime-themes
  js2-mode
  haskell-mode
  swift-mode
  rust-mode
  cc-mode
  python-mode
  sass-mode
  magit
  markdown-mode
  rainbow-delimiters))

;; Access Marmalade and MELPA repositories, in addition to GNU ELPA
(setq package-archives
  '( ("gnu" . "https://elpa.gnu.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")))

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
