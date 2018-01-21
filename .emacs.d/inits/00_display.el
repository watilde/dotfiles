;; no menu-bar
(menu-bar-mode 0)

;; line number
(global-linum-mode t)
(setq linum-format " %d  ")

;; no message
(setq inhibit-startup-message t)

;; no backup
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; scroll line by line
(setq scroll-step 1)

;; no line wrap
(setq truncate-partial-width-windows t)

;; enable mouse
(xterm-mouse-mode t)
(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))

