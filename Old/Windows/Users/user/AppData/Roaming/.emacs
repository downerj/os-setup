;; Setup options.
(defun my/window-setup ()
  ;; Set font.
  ;(set-frame-font "Cascadia Code 12" nil t)
  ;; Set key bindings.
  (global-set-key "\C-j" 'newline)
  ;; Set directory for auto-generated backup files.
  (setq backup-directory-alist `(("." . "~/.emacs-saves")))
  ;; Set options for tabs, parentheses, etc.
  (setq indent-tab-mode nil)
  (setq tab-width 2)
  (setq tab-always-indent nil)
  (setq c-default-style "k&r")
  (setq c-basic-offset 2)
  (setq word-wrap t)
  ;; Line number options.
  (setq global-display-line-numbers-mode t)
  (setq global-linum-mode nil)
  ;; Startup screen options.
  (setq inhibit-startup-screen t)
  ;; Disable bells
  (setq visible-bell nil)
  (setq ring-bell-function 'ignore)
  (when (fboundp 'set-message-beep)
    (set-message-beep 'silent)))
(add-hook 'window-setup-hook 'my/window-setup)

;; Detect system color mode (GNOME).
(defun my/set-color-theme-for-gnome ()
  (if (display-graphic-p)
      (progn
	(setq my/system-theme
	      (string-trim
	       (shell-command-to-string
		"gsettings get org.gnome.desktop.interface color-scheme")))
	(load-theme
	 (if (or
	      (string= my/system-theme "'default'")
	      (string= my/system-theme "'prefer-light'"))
	     'adwaita
	   'manoj-dark)
	 t))))

;; Detect system color mode (Windows).
(defun my/set-color-theme-for-windows ()
  (if (display-graphic-p)
      (progn
	(setq my/system-theme
	      (string-trim
	       (shell-command-to-string
		"powershell Get-ItemPropertyValue -Path HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name AppsUseLightTheme")))
	(load-theme
	 (if (string= my/system-theme "1")
	     'adwaita
	   'manoj-dark)
	 t))))

;(add-hook 'window-setup-hook 'my/set-color-theme-for-gnome)
(add-hook 'window-setup-hook 'my/set-color-theme-for-windows)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-display-line-numbers-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fantasque Sans Mono" :foundry "outline" :slant normal :weight regular :height 120 :width normal)))))
