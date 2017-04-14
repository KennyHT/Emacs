;;;
;; Copyright (C) 2008, 2009, 2010 Meteor Liu
;;
;; This code has been released into the Public Domain.
;; You may do whatever you like with it.
;;
;; @file
;; @author Meteor Liu <meteor1113@gmail.com>
;; @date 2009-08-08
;; @URL http://github.com/meteor1113/dotemacs


;;; global setting
;; Tamanho inicial da janela (largura e altura)
(set-frame-height (selected-frame) 45)
(set-frame-width (selected-frame) 130)

;;chinese setting
(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'chinese-iso-8bit)
(set-selection-coding-system 'chinese-iso-8bit)
(set-terminal-coding-system 'chinese-iso-8bit)
(setq locale-coding-system 'chinese-iso-8bit)
(set-clipboard-coding-system 'chinese-iso-8bit)
(setq file-coding-system-alist 
    (list file-coding-system-alist 
        `(".*" chinese-iso-8bit))) 

;; Set to 70 for easy to read
(setq default-fill-column 70)

(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
'(default ((t (:stipple nil :background "DarkSlateGray" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width semi-condensed))))
'(cursor ((t (:background "skyblue2"))))
'(fringe ((((class color) (background dark)) (:background "#224444"))))
'(region ((((class color) (background dark)) (:background "steelblue" :foreground "white"))))
'(show-paren-match-face ((((class color)) (:foreground "OrangeRed")))))


;;=====================calendar setting===============
;;设置日期的快捷键
(global-set-key (kbd "<f11>") 'calendar)
(global-set-key (kbd "<f8>") 'list-bookmarks)

;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
  ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
  ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

;; 设置 calendar 的显示
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1)            ; 设置星期一为每周的第一天
(setq mark-diary-entries-in-calendar t)     ; 标记calendar上有diary的日期
(setq mark-holidays-in-calendar nil)        ; 为了突出有diary的日期，calendar上不标记节日
(setq view-calendar-holidays-initially nil) ; 打开calendar的时候不显示一堆节日 

;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '((holiday-fixed 1 1 "元旦")
                         (holiday-fixed 2 14 "情人节")
                         (holiday-fixed 3 14 "白色情人节")
                         (holiday-fixed 4 1 "愚人节")
                         (holiday-fixed 5 1 "劳动节")
                         (holiday-float 5 0 2 "母亲节")
                         (holiday-fixed 6 1 "儿童节")
                         (holiday-float 6 0 3 "父亲节")
                         (holiday-fixed 7 1 "建党节")
                         (holiday-fixed 8 1 "建军节")
                         (holiday-fixed 9 10 "教师节")
                         (holiday-fixed 10 1 "国庆节")
                         (holiday-fixed 12 25 "圣诞节")))

(provide 'init-background)
