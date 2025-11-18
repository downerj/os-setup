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
	;; Startup screen options.
	(inhibit-startup-screen t))
(add-hook 'window-setup-hook 'my/window-setup)

;; Detect system color mode.
(defun my/set-color-theme-for-gnome ()
	(if (display-graphic-p)
			(progn
				(setq system-theme (string-trim
														(shell-command-to-string
														 "gsettings get org.gnome.desktop.interface color-scheme")))
				(load-theme
				 (if (or (string= system-theme "'default'") (string= system-theme "'prefer-light'"))
						 'adwaita
					 'manoj-dark) t))))
(add-hook 'window-setup-hook 'my/set-color-theme-for-gnome)
