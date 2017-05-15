;;Basic configuration for Emacs

;; tool-bar
;;(tool-bar-mode t)

;; Tab Setting
(setq-default tab-width 4)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Enable white space mode
;(global-whitespace-mode 1)

;; To show line for Emacs
;;(global-linum-mode t)
;;(column-number-mode t)

(setq indent-tabs-mode t)
(setq default-tab-width 4)
(setq tab-width 4)

;;support copy and paste
(setq kmacro-call-mouse-event nil)
(setq x-select-enable-clipboard t)
(setq mouse-drag-copy-region nil)


;;forbidden to save any bakcup
(setq make-backup-files nil)
(setq backup-directory-alist '(("." . "~/.backups")))
;; (setq backup-by-copying t)
;; (setq delete-old-versions t)
;; (setq kept-old-versions 2)
;; (setq kept-new-versions 5)
;; (setq version-control t)

;;Show Date and Time
(display-time)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

;; cursor
;;(setq-default cursor-type 'bar)
;;(blink-cursor-mode -1)
(setq x-stretch-cursor t)
;; (mouse-avoidance-mode 'animate)
;; cursor-chg
;(when (and window-system (require 'cursor-chg nil 'noerror))
;  (toggle-cursor-type-when-idle 1)
 ;   (change-cursor-mode 1))

;; Set scroll margin
(setq scroll-margin 5 scroll-conservatively 10000)

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


;; highlight;;
(require 'hl-line) ; highlight by line
(global-hl-line-mode t)
(setq hl-line-face 'underline)          ; for highlight-symbol


(provide 'init-basic)
