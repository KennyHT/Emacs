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
(setq user-full-name "Kenny Zhou")
(setq user-mail-address "xjtbox@gmail.com")

;; Set melpa.org
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;;sync Env from shell to Emacs, m-x getenv to check environmnet setting
(defun set-exec-path-from-shell-PATH()
  (let ((path-from-shell(shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
	(setenv "PATH" path-from-shell)
	(setq exec-path(split-string path-from-shell path-separator))))
(if window-system (set-exec-path-from-shell-PATH))

(defvar dotemacs-root-dir (file-name-directory
                           (directory-file-name
                            (file-name-directory
                             (or load-file-name buffer-file-name)))))

;; exec-path
(let ((path-eparator (if (eq system-type 'windows-nt) ";" ":"))
      (bin-dirs (list (expand-file-name "bin" dotemacs-root-dir)
                      "~/bin")))
  (dolist (dir (mapcar 'expand-file-name bin-dirs))
    (setenv "PATH" (concat dir path-eparator (getenv "PATH")))
    (add-to-list 'exec-path dir 'append)))

;; load-path
(let ((lisp-dirs (list (expand-file-name "init" dotemacs-root-dir)
                       (expand-file-name "lisp" dotemacs-root-dir)
                       "~/.emacs.d/lisp")))
  (mapc (lambda (dir)
          (add-to-list 'load-path dir)
          (let ((default-directory dir))
            (ignore-errors (normal-top-level-add-subdirs-to-load-path))))
        (mapcar 'expand-file-name lisp-dirs)))

(provide 'init-path)

;;; init-path.el ends here
