;;; -*- coding:utf-8 -*-
;; (eval-when-compile '(require 'cedet-build))
(declare-function cedet-build-in-default-emacs "cedet-build")

;;;###autoload
(defun joseph-byte-compile-files-outside (files)
  "调用外部的emacs byte compile 所有files 中指定的文件.
输出的结果呈现在当前emacs 中的一个buffer中, `files' can be a list of file ,
or a simple file ,前提是emacs.exe emacs 在$PATH路径下"
  (let (file-strings process)
    (if (stringp files) (setq file-strings files)
      (setq file-strings (mapconcat 'identity files " ")))

    (setq process
          (apply 'start-process ;;
                 "compile my el"
                 (concat "*byte-compiles-all*-" (number-to-string (random)))
                 "emacs"
                 (apply 'list "-batch"
                        "-l" (expand-file-name "~/.emacs.d/site-lisp/joseph/joseph_byte_compile_include.el")
                        "-f" "batch-byte-compile"
                        files))
          )
    (set-process-sentinel process
                          (lambda (proc change)
                            (when (string-match "\\(finished\\|exited\\)" change)
                              (switch-to-buffer (process-buffer proc)))))))

;;;###autoload
(defun joseph_compile_current_el_without_output()
  (when  (string-match "\\.el$" (buffer-file-name))
    (apply 'start-process ;;
           "compile my el"
           "*compilation*"
           "emacs"
           (apply 'list "-batch"
                  "-l" (expand-file-name "~/.emacs.d/site-lisp/joseph/joseph_byte_compile_include.el")
                  "-f" "batch-byte-compile"
                  (buffer-file-name)
                  nil)) ))

;;;###autoload
(defun byte-compile-all-my-el-files()
  "byte compile all by el files under ~/.emacs.d/site-lisp/"
  (interactive)
  (let ((files  (all-files-under-dir-recursively (expand-file-name "~/.emacs.d/site-lisp/")  "\\.el$" nil
                                                 "\\.git\\|\\.svn\\|RCS\\|rcs\\|CVS\\|cvs\\|joseph_init.el$\\|malabar-1.5-SNAPSHOT\\b\\|\\bicicles\\b\\|joseph_init.el$\\|\\bcedet-mirror\\b\\|\\bcedet-1.1\\b" t
                                                 ))
        (i 0)
        300eles)
    ;; (setq files  (joseph-delete-matched-files files "/cedet-1.0/" t ));;不对cedet 进行编译
    ;;这两句话保证joseph_init.el最后编译,如果先编译了它,那么所有的el都会被load进来,
    ;;包括folding.el ,不知道什么原因byte-compile-file 与folding好像有冲突
    ;;如果一个el里fold了,那么隐藏的内容无法被编译
    ;; (setq files (joseph-delete-matched-files files "joseph_init.el$"))
    (while (< i (length files))
      (add-to-list '300eles (nth i files))
      (when (and  (= 0 (% i 300)) (> i 0 ))
        (joseph-byte-compile-files-outside 300eles)
        (setq 300eles nil)
        )
      (setq i (1+ i)))
    (add-to-list '300eles   (expand-file-name "~/.emacs.d/custom-file.el") t)
    (add-to-list '300eles   (expand-file-name "~/.emacs.d/site-lisp/joseph/joseph_init.el") t)
    (joseph-byte-compile-files-outside 300eles))
  (when (y-or-n-p "recompile cedet?")
    (require 'cedet-build) (cedet-build-in-default-emacs) ;;compile cedet
    ))

(provide 'joseph-byte-compile)
