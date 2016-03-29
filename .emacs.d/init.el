;; list the packages
(setq package-list '(js2-mode tabbar))

;; Access Marmalade and MELPA repositories, in addition to GNU ELPA
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; tabbar
(tabbar-mode 1)
(tabbar-mwheel-mode -1)
(setq tabbar-buffer-groups-function nil)
(setq tabbar-use-images nil)
(setq tabbar-auto-scroll-flag nil)
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))
(global-set-key (kbd "C-]") 'tabbar-forward-tab)
(global-set-key (kbd "C-[") 'tabbar-backward-tab)

(set-face-attribute 'tabbar-default nil
        :background "white"
        :foreground "black"
        :family "Monaco")

(set-face-attribute 'tabbar-selected nil
        :background "black"
        :foreground "white"
        :box '(:line-width 1 :color "black" :style nil))

(set-face-attribute 'tabbar-unselected nil
        :box '(:line-width 1 :color "gray20" :style nil))

(set-face-attribute 'tabbar-highlight nil
        :underline nil
        :background "goldenrod")

(set-face-attribute 'tabbar-button nil
        :foreground "white"
        :box '(:line-width 1 :color "gray50" :style nil))

(set-face-attribute 'tabbar-separator nil
        :background "white"
        :foreground "grey50"
        :height 1.0)

(setq tabbar-separator '(1))


;; display line number
(global-linum-mode t)

;; no message
(setq inhibit-startup-message t)

;; no backup
(setq backup-inhibited t)

;; scroll line by line
(setq scroll-step 1)

;; no line wrap
(setq-default truncate-lines t)
(setq truncate-partial-width-windows t)

;; enable mouse
(xterm-mouse-mode t)
(mouse-wheel-mode t)
(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up 1)))
