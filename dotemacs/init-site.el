;;;
;; Copyright (C) 2008, 2009, 2010 Meteor Liu
;;
;; This code has been released into the Public Domain.
;; You may do whatever you like with it.
;;
;; @file
;; @author Meteor Liu <meteor1113@gmail.com>
;; @date 2008-08-08
;; @URL http://github.com/meteor1113/dotemacs


;; load-path
(let ((default-directory (expand-file-name "~/.emacs.d")))
  (when (file-exists-p default-directory)
    (add-to-list 'load-path default-directory)
    (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (normal-top-level-add-subdirs-to-load-path))))

;;  (enable-visual-studio-bookmarks)
  (define-key global-map [(control f2)] 'viss-bookmark-toggle)
  (define-key global-map [M-f2] 'viss-bookmark-toggle)
  (define-key global-map (kbd "ESC <f2>") 'viss-bookmark-toggle) ; putty
  (define-key global-map [(f2)] 'viss-bookmark-next-buffer)
  (define-key global-map [(shift f2)] 'viss-bookmark-prev-buffer)
  (define-key global-map [(control shift f2)] 'viss-bookmark-clear-all-buffer)

;  (dolist (file c-preprocessor-symbol-files)
;    (when (file-exists-p file)
;      (setq semantic-lex-c-preprocessor-symbol-file
;            (append semantic-lex-c-preprocessor-symbol-file (list file)))))

  ;; (global-set-key (kbd "C-c , TAB") 'senator-complete-symbol)
  ;; (global-set-key (kbd "C-c , SPC") 'senator-completion-menu-popup)
  ;; (global-set-key (kbd "C-c TAB") 'semantic-ia-complete-symbol)
  ;; (global-set-key (kbd "C-c SPC") 'semantic-ia-complete-symbol-menu)

;; ecb
;(when (require 'ecb nil 'noerror)
;(autoload 'ecb-activate "ecb" nil t)
;(setq ecb-tip-of-the-day nil)
;(setq ecb-auto-compatibility-check nil)
;(setq ecb-source-path (quote ("/")))
;(setq ecb-primary-secondary-mouse-buttons 'mouse-1--C-mouse-1))

;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-gnome2)

;(require 'xcscope) 
(add-to-list 'load-path "speedbar")

(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
(define-key-after (lookup-key global-map [menu-bar tools])
    [speedbar] '("Speedbar" . speedbar-frame-mode) [calendar])

(add-to-list 'load-path "eieio")
(add-to-list 'load-path "semantic")

 

(require 'ecb) 
(setq ecb-tip-of-the-day nil)
(setq ecb-auto-activate t)
(setq ecb-use-speedbar-instead-native-tree-buffer 'source)
(setq ecb-primary-secondary-mouse-buttons 'mouse-1--C-mouse-1)
(setq ecb-auto-compatibility-check nil) 
(setq inhibit-startup-message t)
(setq ecb-major-modes-show-or-hide (quote ((c-mode c++-mode jde-mode) text-mode emacs-lisp-mode emacs-wiki-mode Info-mode custom-mode help-mode fundamental-mode python-mode)))
(setq ecb-layout-window-sizes (quote (("left8" (0.21296296296296297 . 0.2571428571428571) (0.21296296296296297 . 0.22857142857142856) (0.21296296296296297 . 0.2571428571428571) (0.21296296296296297 . 0.17142857142857143)))))
(global-set-key (quote [S-f9]) (quote ecb-activate))
(global-set-key (quote [S-f10]) (quote ecb-deactivate))

     
(require 'ggtags) 
(add-hook 'lua-mode-hook 'ggtags-mode)
(add-hook 'c-mode-common-hook
(lambda ()
(when (derived-mode-p 'c-mode 'c++-mode 'java-mode) 
(ggtags-mode 1))))
(define-key global-map "\M-." 'ggtags-find-tag-dwim)
(define-key global-map "\M-*" 'pop-tag-mark)


;; jde
(add-hook 'java-mode-hook
          '(lambda ()
             (when (require 'jde nil 'noerror)
               (setq jde-enable-abbrev-mode t))))


(provide 'init-site)
