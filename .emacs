; package repositories
(require 'package) 
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize) 
(when (< emacs-major-version 24) (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

(put 'upcase-region 'disabled nil)

;; shortcuts
(global-set-key "\C-b" 'buffer-menu)
(global-set-key "\C-c-c" 'c-comment-region)
(global-set-key "\C-c-u" 'c-uncomment-region)
(global-set-key [f9] 'query-replace)

;; disable backup file creation 
(setq backup-inhibited t)

;; cua mode
(cua-mode t)

;; color theme
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
;;(load-theme 'plan9)

;;load jde
;;(add-to-list 'load-path "~/.emacs.d/jdee-2.4.1/lisp")
;;(load "jde")

;;projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; auto complete
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; nxhtml
;(load-file "/home/samit/.emacs.d/nxhtml/autostart.el")


;; jdee
;;(add-to-list 'load-path "~/.emacs.d/jdee-2.4.1/lisp")
;;(load "jde")

;; tabs
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; font face
(set-default-font "Inconsolata-13")

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; frame title bar formatting to show full path of file

(setq-default
 frame-title-format
 (list '((buffer-file-name " %f" (dired-directory
                                  dired-directory
                                  (revert-buffer-function " %b"
                                                          ("%b - Dir:  " default-directory)))))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("2cf7f9d1d8e4d735ba53facdc3c6f3271086b6906c4165b12e4fd8e3865469a6" default)))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)

(blink-cursor-mode 0)
(set-cursor-color "#9400d3")
(desktop-save-mode 1)

;;(require 'feature-mode)
;;(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
;;(setq feature-default-language "fi")

(setq ring-bell-function 'ignore)
