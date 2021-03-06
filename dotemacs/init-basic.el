;;; global setting

;; user information
(setq user-full-name "Hait-tao")
(setq user-mail-address "kent.xjtu@gmail.com")

;; environment
(when (eq system-type 'windows-nt)
  (let* ((dir (file-name-directory (directory-file-name data-directory)))
         (bin-dir (expand-file-name "bin" dir)))
    (setenv "PATH" (concat bin-dir ";" (getenv "PATH")))))

;; c/c++ include dir
(defvar user-include-dirs
  '(".." "." "../include" "../inc" "../common" "../public"
    "../.." "../../include" "../../inc" "../../common" "../../public"
    "../interface" "../../interface" "../../../interface" "../../../../interface" "../../../../../interface"
;;    "C:/MinGW/include"
;;    "C:/MinGW/include/c++/3.4.5"
;;    "C:/MinGW/include/c++/3.4.5/mingw32"
;;    "C:/MinGW/include/c++/3.4.5/backward"
;;    "C:/MinGW/lib/gcc/mingw32/3.4.5/include"
;;    "C:/Program Files/Microsoft Visual Studio/VC98/Include"
;;    "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"
;;    ;; "C:/Program Files/Microsoft Visual Studio 10.0/VC/include"
    )
 "User include dirs for c/c++ mode")
;;(defvar c-preprocessor-symbol-files
;;  '("C:/MinGW/include/c++/3.4.5/mingw32/bits/c++config.h"
;;    "C:/Program Files/Microsoft Visual Studio/VC98/Include/xstddef"
;;    )
;;  "Preprocessor symbol files for cedet")

;; tool-bar
(tool-bar-mode t)

;; scroll-bar
(set-scroll-bar-mode 'right)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; edit
(setq-default tab-width 4)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; cua
(cua-mode t)
(define-key cua-global-keymap (kbd "<M-RET>") 'cua-set-rectangle-mark)
(setq cua-keep-region-after-copy (if window-system t nil))
(setq mouse-drag-copy-region nil)
(setq x-select-enable-clipboard t)
;; (setq mouse-yank-at-point t)

;; mode-line
(column-number-mode t)
;; (size-indication-mode 1)
;(display-time-mode t)

;;Show Date and Time
(setq display-time-day-and-date t) 
(display-time) 
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

(which-function-mode t)
(setq frame-title-format
      '("emacs@"
        (:eval (system-name))
        " - "
        (:eval (or (buffer-file-name) (buffer-name)))))

;; save information
;(require 'saveplace)
;(setq-default save-place t)
;(savehist-mode t)
;(recentf-mode t)
;(desktop-save-mode (if window-system 1 -1))

;; whitespace
;; (setq-default show-trailing-whitespace t) ; use whitespace-mode instead
(setq whitespace-style '(trailing lines-tail newline empty tab-mark))
(when window-system
  (setq whitespace-style (append whitespace-style '(tabs))))
;; (global-whitespace-mode t)
(eval-after-load "whitespace"
  `(defun whitespace-post-command-hook ()
     "Hack for emacs-23.2's whitespace, it's very slow in c++-mode."
     ))

;; bookmark
(setq bookmark-save-flag 1)

;; backup
(setq make-backup-files nil)
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.backups")))
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq version-control t)

;; compile
(setq compilation-auto-jump-to-first-error t)
(setq compilation-scroll-output t)

;; complete
(ido-mode t)
(icomplete-mode t)

;; cursor
;; (setq-default cursor-type 'bar)
;; (blink-cursor-mode -1)
(setq x-stretch-cursor t)
;; (mouse-avoidance-mode 'animate)

;; erc
(setq erc-server-coding-system '(utf-8 . utf-8))

;; program
(show-paren-mode t)
;; (setq show-paren-style 'mixed)
(global-cwarn-mode 1)
;;Same like "%" in VIM or SlickEdit "ctrl+}" to mactch the other } 
(global-set-key "\C-]" 'match-paren) 
(defun match-paren (arg) 
"Go to the matching paren if on a paren; otherwise insert %." 
(interactive "p") 
(cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1)) 
((looking-at "\\s\)") (forward-char 1) (backward-list 1)) 
(t (self-insert-command (or arg 1))))) 

;; highlight
;(require 'hl-line) ; highlight by line
;(global-hl-line-mode t)
(setq hl-line-face 'underline)          ; for highlight-symbol
(global-hl-line-mode (if window-system 1 -1))
;; (global-highlight-changes-mode t)       ; use cedet instead
(dolist (mode '(c-mode c++-mode objc-mode java-mode jde-mode
                       perl-mode cperl-mode python-mode ruby-mode
                       lisp-mode emacs-lisp-mode
                       lisp-interaction-mode sh-mode sgml-mode))
  (font-lock-add-keywords
   mode
   '(("\\<\\(FIXME\\|TODO\\|Todo\\)\\>" 1 font-lock-warning-face prepend)
     ("\\<\\(FIXME\\|TODO\\|Todo\\):" 1 font-lock-warning-face prepend))))

;; ffap
;;(ffap-bindings)
;(when (boundp 'ffap-c-path)
;  (setq ffap-c-path (append ffap-c-path user-include-dirs)))

;; skeleton
;; (global-set-key "<" 'skeleton-pair-insert-maybe)
;; (global-set-key "(" 'skeleton-pair-insert-maybe)
;; (global-set-key "[" 'skeleton-pair-insert-maybe)
;; (global-set-key "{" 'skeleton-pair-insert-maybe)
;; (setq skeleton-pair t)

;; color
(if window-system
    (set-background-color "honeydew"))  ; #f0fff0

;; misc
(setq default-major-mode 'text-mode)
;; (fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t)        ; for no desktop
(require 'generic-x nil 'noerror)
(setq ring-bell-function 'ignore)
(auto-image-file-mode t)
(global-auto-revert-mode t)
;; (setq require-final-newline 'ask)
(setq-default indicate-buffer-boundaries (quote left))
(when (fboundp 'global-linum-mode)
  ;; (setq linum-eager nil)
  (global-linum-mode 1))

(defadvice find-tag (before tags-file-name-advice activate)
  "Find TAGS file in ./ or ../ or ../../ dirs"
  (let ((list (mapcar 'expand-file-name '("./TAGS" "../TAGS" "../../TAGS"))))
    (while list
      (if (file-exists-p (car list))
          (progn
            (setq tags-file-name (car list))
            (setq list nil))
        (setq list (cdr list))))))

(defun find-dotemacs-file ()
  "Open .emacs file"
  (interactive)
  (let* ((homedir (getenv "HOME"))
         (path1 (expand-file-name ".emacs" homedir))
         (path2 (expand-file-name "_emacs" homedir))
         (dotemacs-path path1))
    (when (file-exists-p path2)
      (setq dotemacs-path path2))
    (when (file-exists-p path1)
      (setq dotemacs-path path1))
    (find-file dotemacs-path)))

;; (defun move-line-up (p)
;;   "Move current line up, copy from crazycool@smth"
;;   (interactive "*p")
;;   (let ((c (current-column)))
;;     (beginning-of-line)
;;     (kill-line 1)
;;     (previous-line p)
;;     (beginning-of-line)
;;     (yank)
;;     (previous-line 1)
;;     (move-to-column c)))

;; (defun move-line-down (p)
;;   "Move current line down, copy from crazycool@smth"
;;   (interactive "*p")
;;   (let ((c (current-column)))
;;     (beginning-of-line)
;;     (kill-line 1)
;;     (next-line p)
;;     (beginning-of-line)
;;     (yank)
;;     (previous-line 1)
;;     (move-to-column c)))

(defun format-region ()
  "Format region, if no region actived, format current buffer.
Like eclipse's Ctrl+Alt+F."
  (interactive)
  (let ((start (point-min))
        (end (point-max)))
    (if (region-active-p)
        (progn (setq start (region-beginning))
               (setq end (region-end)))
      (progn (whitespace-cleanup)
             (setq end (point-max))))
    (save-excursion
      (save-restriction
        (narrow-to-region (point-min) end)
        (push-mark (point))
        (push-mark (point-max) nil t)
        (goto-char start)
        (whitespace-cleanup)
        (untabify start (point-max))
        (indent-region start (point-max))))))

(defun moccur-word-all-buffers (regexp)
  "Run `multi-occur' to find regexp in all buffers."
  (if (= 0 (length regexp))
      (message "Regexp is blank.")
    (let ((buffers (buffer-list)))
      (dolist (buffer buffers)
        (let ((pos (string-match " *\\*" (buffer-name buffer))))
          (when (and pos (= 0 pos))
            (setq buffers (remq buffer buffers)))))
      (multi-occur buffers regexp))))

(defun moccur-all-buffers (&optional is-prompt)
  "Run `multi-occur' to find current word in all buffers."
  (interactive "P")
  (let ((word (grep-tag-default)))
    (when (or is-prompt (= (length word) 0))
      (setq word (read-regexp "List lines matching regexp" word)))
    (moccur-word-all-buffers word)))

(autoload 'grep-tag-default "grep")
(defun grep-current-dir (&optional is-prompt wd)
  "Run `grep' to find current word in current directory."
  (interactive "P")
  (let* ((word (or wd (grep-tag-default)))
         (cmd (concat "grep -inrHIE \"" word "\" ."
                      " | grep -vE \"\.svn/|\.git/|\.hg/|\.bzr/|CVS/\"")))
    (grep-apply-setting 'grep-use-null-device nil)
    (if (or is-prompt (= (length word) 0))
        (grep (read-shell-command
               "Run grep (like this): " cmd 'grep-history))
      (if (= 0 (length word))
          (message "Word is blank.")
        (grep cmd)))))

(defun switch-to-other-buffer ()
  "Switch to (other-buffer)."
  (interactive)
  (switch-to-buffer (other-buffer)))
(defadvice switch-to-other-buffer (after pulse-advice activate)
  "After switch-to-other-buffer, pulse the line the cursor lands on."
  (when (and (boundp 'pulse-command-advice-flag) pulse-command-advice-flag
             (interactive-p))
    (pulse-momentary-highlight-one-line (point))))

;; global key bindings
;; (global-set-key (kbd "<M-up>") 'move-line-up)
;; (global-set-key (kbd "<M-down>") 'move-line-down)
(global-set-key (kbd "<select>") 'move-end-of-line) ; for putty
(global-set-key (kbd "C-=") 'align)
(global-set-key (kbd "C-S-u") 'upcase-region)
(global-set-key (kbd "C-S-l") 'downcase-region)
(global-set-key (kbd "C-M-;") 'comment-or-uncomment-region)
(global-set-key (kbd "ESC M-;") 'comment-or-uncomment-region) ; putty
(global-set-key [M-f8] 'format-region)
(global-set-key (kbd "ESC <f8>") 'format-region) ; putty
(global-set-key (kbd "C-S-f") 'format-region)
(global-set-key (kbd "M-P") 'previous-buffer)
(global-set-key (kbd "M-N") 'next-buffer)
(global-set-key [(control tab)] 'switch-to-other-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c q") 'auto-fill-mode)
(global-set-key [f4] 'next-error)
(global-set-key [S-f4] 'previous-error)
(global-set-key [C-f4] 'kill-this-buffer)
(global-set-key (kbd "ESC <f4>") 'kill-this-buffer) ; putty
(global-set-key [f6] 'grep-current-dir)
(global-set-key [C-f6] 'moccur-all-buffers)
(global-set-key [M-f6]
                (lambda () (interactive) (grep-current-dir nil "TODO|FIXME")))
(global-set-key (kbd "ESC <f6>") (key-binding [M-f6]))
(global-set-key [C-M-f6]
                '(lambda ()
                   (interactive)
                   (moccur-word-all-buffers
                    "\\<\\([Tt][Oo][Dd][Oo]\\|[Ff][Ii][Xx][Mm][Ee]\\)\\>")))
(global-set-key (kbd "ESC <C-f6>") (key-binding [C-M-f6]))
(global-set-key [f7] '(lambda () (interactive) (compile compile-command)))


;;; special mode setting
(defvar text-imenu-generic-expression
  `((nil ,"^ \\{0,4\\}\\([一二三四五六七八九十]+[、. )]\\)+\s*[^,。，]+?$" 0)
    (nil ,"^ \\{0,4\\}\\([0-9]+[、. )]\\)+\s*[^,。，]+?$" 0)))
(add-hook 'text-mode-hook
          (lambda ()
            (setq imenu-generic-expression text-imenu-generic-expression)
            (imenu-add-menubar-index)))

(add-hook 'change-log-mode-hook 'turn-on-auto-fill)

(setq org-log-done 'time)
(setq org-export-with-archived-trees t)
(add-hook 'org-mode-hook
          (lambda ()
            (imenu-add-menubar-index)
            (setq comment-start nil)
            (auto-fill-mode t)))
(eval-after-load "org"
  `(progn
     (define-key org-mode-map [(control tab)] nil)
     (define-key org-mode-map (kbd "<C-S-iso-lefttab>")
       'org-force-cycle-archived)
     (define-key org-mode-map (kbd "<C-S-tab>") 'org-force-cycle-archived)))

(when (fboundp 'nxml-mode)
  (add-to-list 'auto-mode-alist
               '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode))
  (setq nxml-bind-meta-tab-to-complete-flag t)
  (add-hook 'nxml-mode-hook
            '(lambda ()
               (require 'sgml-mode)
               (set-syntax-table sgml-mode-syntax-table))))

(defadvice artist-coord-win-to-buf (before tabbar-mode activate compile)
  "Hack artist-mode's wrong position when tabbar-mode."
  (if tabbar-mode (setq coord (cons (car coord) (1- (cdr coord))))))

(defvar hs--overlay-keymap nil "keymap for folding overlay")
(let ((map (make-sparse-keymap)))
  (define-key map [mouse-1] 'hs-show-block)
  (setq hs--overlay-keymap map))
(setq hs-set-up-overlay
      (defun my-display-code-line-counts (ov)
        (when (eq 'code (overlay-get ov 'hs))
          (overlay-put ov 'display
                       (propertize
                        (format " ... <%d lines>"
                                (count-lines (overlay-start ov)
                                             (overlay-end ov)))
                        'face 'mode-line))
          (overlay-put ov 'priority (overlay-end ov))
          (overlay-put ov 'keymap hs--overlay-keymap)
          (overlay-put ov 'pointer 'hand))))
;; (global-set-key (kbd "C-?") 'hs-minor-mode)

(defun program-common-function ()
  (setq indent-tabs-mode nil)
  ;; (local-set-key (kbd "<return>") 'newline-and-indent)
  (when (fboundp 'whitespace-mode)
    (whitespace-mode t))
  (hs-minor-mode t)
  (ignore-errors (imenu-add-menubar-index)))

(add-hook 'c-mode-common-hook 'program-common-function)

(add-to-list 'auto-mode-alist '("\\.[ch]\\'" . c++-mode))
(add-hook 'c-mode-hook (lambda () (c-set-style "stroustrup")))

(add-hook 'c++-mode-hook
          (lambda ()
            (c-set-style "stroustrup")
            (c-set-offset 'innamespace 0)))

(add-hook 'java-mode-hook (lambda () (c-set-style "java")))

(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*@protocol" . objc-mode))
;; (add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*#import" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
(add-hook 'objc-mode-hook (lambda () (c-set-style "stroustrup")))

(add-to-list 'auto-mode-alist '("\\.prc\\'" . sql-mode))
(add-hook 'sql-mode-hook 'program-common-function)

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (program-common-function)
            (turn-on-eldoc-mode)))

(add-hook 'python-mode-hook 'program-common-function)

(add-hook 'sh-mode-hook 'program-common-function)

(add-hook 'makefile-mode-hook 'imenu-add-menubar-index)

(when (fboundp 'whitespace-mode)
  (add-hook 'makefile-mode-hook (lambda () (whitespace-mode 1)))
  (add-hook 'autoconf-mode-hook (lambda () (whitespace-mode 1))))

(add-hook 'perl-mode-hook 'program-common-function)
(add-to-list 'auto-mode-alist
             '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
(add-hook 'cperl-mode-hook
          '(lambda ()
             (program-common-function)
             (cperl-set-style "PerlStyle")
             (setq cperl-continued-brace-offset -4)
             (abbrev-mode t)))

;; gdb
(require 'gdb-ui nil 'noerror)
(require 'gdb-mi nil 'noerror)

(defun gud-break-or-remove (&optional force-remove)
  "Set/clear breakpoin."
  (interactive "P")
  (save-excursion
    (if (or force-remove
            (eq (car (fringe-bitmaps-at-pos (point))) 'breakpoint))
        (gud-remove nil)
      (gud-break nil))))

(defun gud-enable-or-disable ()
  "Enable/disable breakpoint."
  (interactive)
  (let ((obj))
    (save-excursion
      (move-beginning-of-line nil)
      (dolist (overlay (overlays-in (point) (point)))
        (when (overlay-get overlay 'put-break)
          (setq obj (overlay-get overlay 'before-string))))
      (if  (and obj (stringp obj))
          (cond ((featurep 'gdb-ui)
                 (let* ((bptno (get-text-property 0 'gdb-bptno obj)))
                   (string-match "\\([0-9+]\\)*" bptno)
                   (gdb-enqueue-input
                    (list
                     (concat gdb-server-prefix
                             (if (get-text-property 0 'gdb-enabled obj)
                                 "disable "
                               "enable ")
                             (match-string 1 bptno) "\n")
                     'ignore))))
                ((featurep 'gdb-mi)
                 (gud-basic-call
                  (concat
                   (if (get-text-property 0 'gdb-enabled obj)
                       "-break-disable "
                     "-break-enable ")
                   (get-text-property 0 'gdb-bptno obj))))
                (t (error "No gud-ui or gui-mi?")))
        (message "May be there isn't have a breakpoint.")))))

(defun gud-kill ()
  "Kill gdb process."
  (interactive)
  (with-current-buffer gud-comint-buffer (comint-skip-input))
  ;; (set-process-query-on-exit-flag (get-buffer-process gud-comint-buffer) nil)
  ;; (kill-buffer gud-comint-buffer))
  (dolist (buffer '(gdba gdb-stack-buffer gdb-breakpoints-buffer
                         gdb-threads-buffer gdb-inferior-io
                         gdb-registers-buffer gdb-memory-buffer
                         gdb-locals-buffer gdb-assembler-buffer))
    (when (gdb-get-buffer buffer)
      (let ((proc (get-buffer-process (gdb-get-buffer buffer))))
        (when proc (set-process-query-on-exit-flag proc nil)))
      (kill-buffer (gdb-get-buffer buffer)))))

;;(defadvice gdb (before ecb-deactivate activate)
;;  "if ecb activated, deactivate it."
;;  (when (and (boundp 'ecb-minor-mode) ecb-minor-mode)
;;    (ecb-deactivate)))

;; (defun gdb-tooltip-hook ()
;;   (gud-tooltip-mode 1)
;;   (let ((process (ignore-errors (get-buffer-process (current-buffer)))))
;;     (when process
;;       (set-process-sentinel process
;;                             (lambda (proc change)
;;                               (let ((status (process-status proc)))
;;                                 (when (or (eq status 'exit)
;;                                           (eq status 'signal))
;;                                   (gud-tooltip-mode -1))))))))
;; (add-hook 'gdb-mode-hook 'gdb-tooltip-hook)
(add-hook 'gdb-mode-hook (lambda () (gud-tooltip-mode 1)))
(defadvice gud-kill-buffer-hook (after gud-tooltip-mode activate)
  "After gdb killed, disable gud-tooltip-mode."
  (gud-tooltip-mode -1))

(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t)
;; (gud-tooltip-mode t)
(define-key c-mode-base-map [f5] 'gdb)
(define-key gud-minor-mode-map [f5] 'gud-go)
(define-key gud-minor-mode-map [S-f5] 'gud-kill)
(define-key gud-minor-mode-map [f8] 'gud-print)
(define-key gud-minor-mode-map [C-f8] 'gud-pstar)
(define-key gud-minor-mode-map [f9] 'gud-break-or-remove)
(define-key gud-minor-mode-map [C-f9] 'gud-enable-or-disable)
(define-key gud-minor-mode-map [S-f9] 'gud-watch)
(define-key gud-minor-mode-map [f10] 'gud-next)
(define-key gud-minor-mode-map [C-f10] 'gud-until)
(define-key gud-minor-mode-map [C-S-f10] 'gud-jump)
(define-key gud-minor-mode-map [f11] 'gud-step)
(define-key gud-minor-mode-map [C-f11] 'gud-finish)

(provide 'init-basic)
