;; -*- coding:utf-8 -*-
;;; joseph-program.el --- some functions for programing

;; Copyright (C) 2010 纪秀峰

;; Author: 纪秀峰  jixiuf@gmail.com
;; Keywords: java csharp code

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Commands:
;;
;; Below are complete command list:
;;
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Code:

(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)
(eval-after-load 'csharp-mode '(add-csc-2-path-env))
(eval-after-load 'csharp-mode '(add-gacutil-2-path-env))

(add-hook 'lua-mode-hook 'flymake-lua-load)


(setq-default gdb-many-windows t)
(add-hook 'c-mode-hook 'flymake-mode-on)
(add-hook 'c++-mode-hook 'flymake-mode-on)
;; (global-set-key [f6] 'gud-step)
;; (global-set-key [f7] 'gud-next)
;; (global-set-key [f8] 'gud-finish)


;;my config file
;;(require 'ajc-java-complete-config)
(autoload 'ajc-java-complete-mode "ajc-java-complete-config" "enable AutoJavaComplete." nil)
(autoload 'ajc-4-jsp-find-file-hook "ajc-java-complete-config" "enable AutoJavaComplete." nil)
(add-hook 'java-mode-hook 'ajc-java-complete-mode)
(add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)

;; # (-u flag for "update")
;; go get -u github.com/nsf/gocode
;; windows
;; go get -u -ldflags -H=windowsgui github.com/nsf/gocode

;; go get -u github.com/dougm/goflymake

;; go get code.google.com/p/rog-go/exp/cmd/godef

;; github.com/syohex/emacs-go-eldoc

;;on mac
;;  cat /etc/launchd.conf
;; setenv GOROOT /usr/local/go
;; setenv GOPATH /Users/jixiuf/repos/proj_golang
;; setenv PATH  /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/go/bin:/Users/jixiuf/Applications/adt-bundle-mac-x86_64-20130522/sdk/platform-tools:/Users/jixiuf/repos/proj_golang/bin
(eval-after-load 'go-mode
  '(progn
     (require 'go-autocomplete)
     ;; (require 'flymake)
     ;; (require 'go-flycheck)
     ;; (require 'go-flymake)
     ;; (define-key go-mode-map ";" 'joseph-append-semicolon-at-eol)

     ;; git pre-commit for gofmt
     ;; http://tip.golang.org/misc/git/pre-commit
     (add-hook 'before-save-hook 'gofmt-before-save)
     (add-hook 'after-save-hook 'go-auto-compile t)

     ;; (require 'go-eldoc) ;; Don't need to require, if you install by package.el
     (add-hook 'go-mode-hook 'go-eldoc-setup) ;autoloaded
     (add-hook 'go-mode-hook (lambda ()
                               (setq require-final-newline nil)
                               (modify-syntax-entry ?_  "_" (syntax-table)) ;还是让 "_" 作为symbol，还不是word
                               (local-set-key (kbd "C-c i") 'go-goto-imports)
                               (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

     ))

(defun go-auto-compile()
  "go auto compile"
  (when (string-match "\\.go$" (buffer-name))
    (compile "go build")
      (shell-command "go install")
    ;; (call-interactively 'next-error)
    ;; (let ((msg  (shell-command-to-string "go build")))
    ;;   (unless (string-equal "" msg)
    ;;     (message "%s " msg)
    ;;     (call-interactively 'next-error)
    ;;     )
    ;;   )
    ;; (start-process "compile my go" "*compilation*" "go" "build" )
    ))

;; (define-key-lazy  java-mode-map ";" 'joseph-append-semicolon-at-eol)
(add-hook 'java-mode-hook 'hs-minor-mode);; hide show mode 代码折叠

;; (when (featurep 'w3m-load)  (require 'w3m-load))

;; M-x : w3m
;; (setq-default w3m-command "w3m")


(provide 'joseph-program)
;;; joseph-program.el ends here
