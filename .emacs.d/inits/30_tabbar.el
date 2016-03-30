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
