(menu-bar-mode -1)
(display-time-mode t)
(column-number-mode t)
(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'flymake)

(global-set-key [f3] 'flymake-display-err-menu-for-current-line)
(global-set-key [f4] 'flymake-goto-next-error)

(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
   (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

(autoload 'aspx-mode "aspx-mode" "Major mode for editing ASP.NET code." t)
(setq auto-mode-alist
   (append '(("\\.as.x$" . aspx-mode)) auto-mode-alist))

(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet files." t)
(setq auto-mode-alist
      (append '(("\\.pp$" . puppet-mode)) auto-mode-alist))

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(add-hook 'text-mode-hook 'remove-dos-eol)
(add-hook 'python-mode-hook 'remove-dos-eol)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(espresso-auto-indent-flag nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-constant-face ((t (:foreground "cyan"))))
 '(font-lock-function-name-face ((t (:foreground "color-27"))))
 '(font-lock-string-face ((t (:foreground "color-28"))))
 '(font-lock-type-face ((t (:foreground "color-202"))))
 '(mode-line ((t (:foreground "green"))))
 '(mode-line-inactive ((t (:inherit mode-line :foreground "white" :weight ultra-light)))))
