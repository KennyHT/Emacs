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
;;�������ڵĿ�ݼ�
(global-set-key (kbd "<f11>") 'calendar)
(global-set-key (kbd "<f8>") 'list-bookmarks)

;; ����������ʾ���� calendar ���� pC ��ʾ����
(setq chinese-calendar-celestial-stem
  ["��" "��" "��" "��" "��" "��" "��" "��" "��" "��"])
(setq chinese-calendar-terrestrial-branch
  ["��" "��" "��" "î" "��" "��" "��" "δ" "��" "��" "��" "��"])

;; ���� calendar ����ʾ
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1)            ; ��������һΪÿ�ܵĵ�һ��
(setq mark-diary-entries-in-calendar t)     ; ���calendar����diary������
(setq mark-holidays-in-calendar nil)        ; Ϊ��ͻ����diary�����ڣ�calendar�ϲ���ǽ���
(setq view-calendar-holidays-initially nil) ; ��calendar��ʱ����ʾһ�ѽ��� 

;; ȥ�������ĵĽ��գ��趨�Լ�����Ľ��գ��� calendar ���� h ��ʾ����
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '((holiday-fixed 1 1 "Ԫ��")
                         (holiday-fixed 2 14 "���˽�")
                         (holiday-fixed 3 14 "��ɫ���˽�")
                         (holiday-fixed 4 1 "���˽�")
                         (holiday-fixed 5 1 "�Ͷ���")
                         (holiday-float 5 0 2 "ĸ�׽�")
                         (holiday-fixed 6 1 "��ͯ��")
                         (holiday-float 6 0 3 "���׽�")
                         (holiday-fixed 7 1 "������")
                         (holiday-fixed 8 1 "������")
                         (holiday-fixed 9 10 "��ʦ��")
                         (holiday-fixed 10 1 "�����")
                         (holiday-fixed 12 25 "ʥ����")))

(provide 'init-background)
