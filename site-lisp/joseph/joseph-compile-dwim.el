;; -*- coding:utf-8 -*-
;;; joseph-compile-dwim.el --- config about compile dwim

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: compile dwim coinig

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
;;;; autoload  compile-dwim
(autoload 'compile-dwim-run "compile-dwim" "doc" t)
(autoload 'compile-dwim-compile "compile-dwim" "doc" t)
;;;; keybindins
(global-set-key "\C-zs" 'compile-dwim-compile)
(global-set-key "\C-zr" 'compile-dwim-run)

;;;; eval-after-load
(eval-after-load 'compile-dwim
  '(progn
     (defun joseph_compile_current_el_outside()
       (let ((command))
         (setq command
               (format
                (concat " emacs  -batch    -l " joseph_joseph_install_path "joseph_byte_compile_include.el  -f batch-byte-compile %s ")
                (buffer-file-name)))
         (with-current-buffer (get-buffer-create "*joseph_compile_current_el*")
           (insert (shell-command-to-string command)))
         (switch-to-buffer (get-buffer-create "*joseph_compile_current_el*"))))

     (setq compile-dwim-alist
           `((perl (or (name . "\\.pl$")
                       (mode . cperl-mode))
                   "%i -wc \"%f\"" "%i \"%f\"")
             (c    (or (name . "\\.c$")
                       (mode . c-mode))
                   "gcc -o %n %f" "./%n")
             ;; (c    (or (name . "\\.c$")
             ;;           (mode . c-mode))
             ;;       ("gcc -o %n %f" "gcc -g -o %n %f") ("./%n" "cint %f") "%n")
             (c++  (or (name . "\\.cpp$")
                       (mode . c++-mode))
                   ("g++ -o %n %f" "g++ -g -o %n %f") "./%n" "%n")
             (java (or (name . "\\.java$")
                       (mode . java-mode))
                   "javac %f" "java %n" "%n.class")
             (python (or (name . "\\.py$")
                         (mode . python-mode))
                     "%i %f" "%i %f")
             (javascript (or (name . "\\.js$")
                             (mode . javascript-mode))
                         "smjs -f %f" "smjs -f %f")
             (tex   (or (name . "\\.tex$")
                        (name . "\\.ltx$")
                        (mode . tex-mode)
                        (mode . latex-mode))
                    "latex %f" "latex %f" "%n.dvi")
             (texinfo (name . "\\.texi$")
                      (makeinfo-buffer) (makeinfo-buffer) "%.info")
             (sh    (or (name . "\\.sh$")
                        (mode . sh-mode))
                    "%i ./%f" "%i ./%f")
             (f99   (name . "\\.f90$")
                    "f90 %f -o %n" "./%n" "%n")
             (f77   (name . "\\.[Ff]$")
                    "f77 %f -o %n" "./%n" "%n")
             (php   (or (name . "\\.php$")
                        (mode . php-mode))
                    "php %f" "php %f")
             (elisp (or (name . "\\.el$")
                        (mode . emacs-lisp-mode)
                        (mode . lisp-interaction-mode))
                    (joseph_compile_current_el_outside)
                    (emacs-lisp-byte-compile) "%fc"))
           )
     )
  )

(provide 'joseph-compile-dwim)
;;; joseph-compile-dwim.el ends here


