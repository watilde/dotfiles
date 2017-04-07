; https://gist.github.com/3demax/1264635/91ccb6c423effd811dbdb1412b70c15e95fa700d
(require 'tabbar)

(set-face-attribute
  'tabbar-default nil
  :background "gray20"
  :foreground "gray20"
  :box '(:line-width 1 :color "gray20" :style nil))

(set-face-attribute
  'tabbar-unselected nil
  :background "gray30"
  :foreground "white"
  :box '(:line-width 5 :color "gray30" :style nil))

(set-face-attribute
  'tabbar-selected nil
  :background "gray75"
  :foreground "black"
  :box '(:line-width 5 :color "gray75" :style nil))

(set-face-attribute
  'tabbar-highlight nil
  :background "white"
  :foreground "black"
  :underline nil
  :box '(:line-width 5 :color "white" :style nil))

(set-face-attribute
  'tabbar-button nil
  :box '(:line-width 1 :color "gray20" :style nil))

(set-face-attribute
  'tabbar-separator nil
  :background "gray20"
  :height 0.6)

(custom-set-variables
  '(tabbar-separator (quote (0.5))))

(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB. That is, a string used to represent it on the tab bar."

(let ((label  (if tabbar--buffer-show-groups
  (format "[%s]  " (tabbar-tab-tabset tab))
  (format "%s  " (tabbar-tab-value tab)))))
  (if tabbar-auto-scroll-flag
    label
    (tabbar-shorten
      label (max 1 (/ (window-width)
        (length (tabbar-view
          (tabbar-current-tabset)))))))))

(tabbar-mode 1)
