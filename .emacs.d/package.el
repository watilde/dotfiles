;; list the packages
(setq package-list '(
  tabbar
  init-loader
  neotree
  js2-mode
  haskell-mode
  swift-mode
  rust-mode
  cc-mode
  sass-mode
  mode-icons
  rainbow-delimiters
  tabbar-ruler
  powerline))

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
