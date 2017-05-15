;;; -*- mode: emacs-lisp; coding: utf-8; -*-
;; Copy useful modules from others


;; Show tags searching
(defadvice find-tag (before tags-file-name-advice activate)
  "Find TAGS file in ./ or ../ or ../../ dirs"
  (let ((list (mapcar 'expand-file-name '("./TAGS" "../TAGS" "../../TAGS"))))
    (while list (if (file-exists-p (car list))
		    (progn (setq tags-file-name (car list))
			   (setq list nil)) 100 (setq list (cdr list))))))


(require 'ecb)
(setq ecb-tip-of-the-day nil)
;(setq ecb-auto-activate t)
(setq ecb-use-speedbar-instead-native-tree-buffer 'source)
(setq ecb-primary-secondary-mouse-buttons 'mouse-1--C-mouse-1)
(setq ecb-auto-compatibility-check nil)
(setq inhibit-startup-message t)
(setq ecb-major-modes-show-or-hide (quote ((c-mode c++-mode jde-mode) text-mode emacs-lisp-mode emacs-wiki-mode Info-mode custom-mode help-mode fundamental-mode  python-mode)))
(setq ecb-layout-window-sizes (quote (("left8" (0.21 . 0.21) (0.21 . 0.22) (0.21 . 0.21) (0.21 . 0.17)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add ggtags support 
(require 'ggtags)
(add-hook 'lua-mode-hook 'ggtags-mode)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
	      (ggtags-mode 1))))
(define-key global-map "\M-." 'ggtags-find-tag-dwim)
(define-key global-map "\M-," 'pop-tag-mark)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete
(setq ac-use-comphist nil)
(setq ac-disable-faces nil)
;; (global-set-key (kbd "M-n") 'auto-complete)
(add-hook 'after-init-hook
		  '(lambda ()
			 (ignore-errors (ac-config-default))))
;; (run-with-idle-timer 3 nil #'ac-config-default)
(eval-after-load "auto-complete"
  '(progn
	 (defun auto-complete-mode-maybe ()
	   (unless (minibufferp (current-buffer))
		 (auto-complete-mode 1)))
	 (define-key ac-completing-map [return] 'ac-complete)
	 (defadvice ac-update-word-index-1 (around exclude-hidden-buffer activate)
	   "Exclude hidden buffer, hack for eim."
	   (unless (string= (substring (buffer-name) 0 1) " ")
		 ad-do-it))))
(eval-after-load "auto-complete-config"
  '(progn
	 (add-hook 'ielm-mode-hook 'ac-emacs-lisp-mode-setup)
	 (add-hook 'eshell-mode-hook 'ac-emacs-lisp-mode-setup)
	 (add-hook 'auto-complete-mode-hook
			   '(lambda ()
				  (add-to-list 'ac-sources 'ac-source-yasnippet)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company
(setq company--disabled-backends '(company-pysmell))
;; (autoload 'company-mode "company" nil t)
;; (autoload 'global-company-mode "company" nil t)
(eval-after-load "company"
  '(progn
	 (setq company-idle-delay nil)
	 ;; (setq company-idle-delay t
	 ;;       company-minimum-prefix-length 1
	 ;;       company-begin-commands '(self-insert-command c-electric-lt-gt))
	 (define-key company-mode-map (kbd "M-n") 'company-select-next)
	      (define-key company-mode-map (kbd "M-p") 'company-select-previous)))

(provide 'init-modules)
