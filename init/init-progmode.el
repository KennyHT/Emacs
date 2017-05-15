;;Setup Language mode

;; find-file
(setq ff-always-try-to-create nil)
(setq cc-search-directories '("/usr/include" "/usr/local/include/*"
			      "." "./include" "./inc"
			      "./common" "./public" "./src"
			      ".." "../include" "../inc"
			      "../common" "../public" "../src"
			      "../.." "../../include" "../../inc"
			      "../../common" "../../public" "../../src"))
;; filecache
(eval-after-load "filecache"
  '(progn (file-cache-add-directory-list cc-search-directories)
	  (file-cache-add-directory-recursively "/usr/include/c++")
	            (file-cache-add-directory-recursively "/usr/local/include")))

;; Setup C/C++ mode
;(add-hook 'c-mode-common-hook 'program-common-function)
(add-to-list 'auto-mode-alist '("\\.[ch]\\'" . c++-mode))
(add-hook 'c-mode-hook (lambda () (c-set-style "stroustrup")));
(add-hook 'c++-mode-hook
                (lambda ()
                      (c-set-style "stroustrup")
                      (c-set-offset 'innamespace 0)))

;;Jave-mode
(add-hook 'java-mode-hook (lambda () (c-set-style "java")));
;; jde
(add-hook 'java-mode-hook
	  '(lambda ()
	     (when (require 'jde nil 'noerror)
	              (setq jde-enable-abbrev-mode t))))


;; go-mode
(add-hook 'go-mode-hook
	  '(lambda ()
	     (add-hook 'before-save-hook #'gofmt-before-save)
	     (local-set-key (kbd "M-.") #'godef-jump)
	     (local-set-key (kbd "M-,") #'pop-tag-mark)))
;; go-doc
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; go-snippets
;; go-autocomplete
(add-hook 'go-mode-hook
	  '(lambda ()
	     (when (require 'go-autocomplete nil 'noerror)
	       (local-set-key (kbd "M-n") 'ac-complete-go))))


;; For Python Mode
;; (add-hook 'python-mode-hook
;;           '(lambda ()
;;              (ignore-errors (whitespace-mode t))))
;; auto-complete
(eval-after-load "auto-complete-config"
  '(progn
     (setq ac-source-ropemacs              ; Redefine ac-source-ropemacs
	   '((candidates . (lambda ()
			     (setq ac-ropemacs-completions-cache
				   (mapcar
				    (lambda (completion)
				      (concat ac-prefix completion))
				    (ignore-errors
				      (rope-completions))))))
	     (prefix . c-dot)
	     (requires . 0)))

     (defun ac-complete-ropemacs ()
       (interactive)
       (auto-complete '(ac-source-ropemacs)))

     (defun ac-ropemacs-setup ()
       (when (locate-library "pymacs")
	 (ac-ropemacs-require)
	 ;; (setq ac-sources (append (list 'ac-source-ropemacs) ac-sources))
	 (local-set-key (kbd "M-n") 'ac-complete-ropemacs)))
     (ac-ropemacs-initialize)))


;; text-mode
(defvar text-imenu-generic-expression
  `((nil ,"^ \\{0,4\\}\\([一二三四五六七八九十]+[、. )]\\)+ *[^,。，]+?$" 0)
    (nil ,"^ \\{0,4\\}\\([0-9]+[、. )]\\)+ *[^,。，]+?$" 0)))

(add-hook 'text-mode-hook
	  '(lambda ()
	     (setq imenu-generic-expression text-imenu-generic-expression)
	     (imenu-add-menubar-index)))

(provide 'init-progmode)
