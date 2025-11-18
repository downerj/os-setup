;; Setup options.
(defun my/window-setup ()
  ;; Set font.
  (set-frame-font "Ubuntu Mono 12" nil t)
  ;; Set key bindings.
  (global-set-key "\C-j" 'newline)
  ;; Set directory for auto-generated backup files.
  (setq backup-directory-alist `(("." . "~/.emacs-saves")))
  ;; Set options for tabs, parentheses, etc.
  (setq tab-width 2)
  (setq tab-always-indent nil)
  (setq c-default-style "k&r"
        c-basic-offset 2)
  (setq word-wrap t)
  ;; Line number options.
  (global-display-line-numbers-mode t)
  (setq global-linum-mode nil)
(add-hook 'window-setup-hook 'my/window-setup)
