;; portable emacs: copy this file to site-lisp and rename to site-start.el.
(when (and load-file-name
           (equal (file-name-nondirectory load-file-name) "site-start.el"))
  (setenv "HOME" (file-name-directory load-file-name)))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))
  
(add-to-list 'load-path "~/.emacs.d/dotemacs")



;;sync Env from shell to Emacs, m-x getenv to check environmnet setting 
(defun set-exec-path-from-shell-PATH()
  (let ((path-from-shell(shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path(split-string path-from-shell path-separator))))
(if window-system (set-exec-path-from-shell-PATH))


;; (add-to-list 'load-path "e:/common/dotemacs")
(load "init-basic" 'noerror)
(load "init-site" 'noerror)
;(load "init-toolbar" 'noerror)
(load "init-background" 'noerror)
(load "init-misc" 'noerror)

;; (add-to-list 'load-path "e:/common/note")
;(load "init-note" 'noerror)

;; (load "~/dotemacs/sample-proj")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (go-mode ggtags ecb))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "DarkSlateGray" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width semi-condensed))))
 '(cursor ((t (:background "skyblue2"))))
 '(fringe ((((class color) (background dark)) (:background "#224444"))))
 '(region ((((class color) (background dark)) (:background "steelblue" :foreground "white"))))
 '(show-paren-match ((((class color)) (:foreground "OrangeRed")))))
