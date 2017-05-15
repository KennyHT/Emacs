;;; -*- mode: emacs-lisp; coding: utf-8; -*-

;; Copyright (C) 2008- Liu Xin
;;
;; This code has been released into the Public Domain.
;; You may do whatever you like with it.
;;
;; @file
;; @author Liu Xin <meteor1113@qq.com>
;; @URL http://git.oschina.net/meteor1113/dotemacs

;;; Commentary:

;;; Code:

(add-to-list 'load-path
             (expand-file-name "init"
                               (file-name-directory
                                (or load-file-name buffer-file-name))))

(require 'init-path nil 'noerror)
(require 'init-basic nil 'noerror)
(require 'init-progmode nil 'noerror)
(require 'init-modules nil 'noerror)

(provide 'init-emacs)
;;; init-emacs.el ends here
