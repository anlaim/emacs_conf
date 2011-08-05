;;; -*- coding:utf-8 -*-
;;;###autoload
(defun joseph-byte-compile-files-outside (files)
  "调用外部的emacs byte compile 所有files 中指定的文件.
输出的结果呈现在当前emacs 中的一个buffer中, `files' can be a list of file ,
or a simple file ,前提是emacs.exe emacs 在$PATH路径下"
  (let (file-strings process)
    (if (stringp files)
        (setq file-strings files)
      (dolist (file files)
        (setq file-strings (concat file-strings " " file))))
    (setq process (start-process-shell-command
                   "byte compile all el files" "*joseph-byte-compiles-all*"
                   (format
                    (concat " emacs  -batch    -l " joseph_joseph_install_path "joseph_byte_compile_include.el  -f batch-byte-compile %s ")
                    file-strings))
          )
    (set-process-sentinel process
                          (lambda (proc change)
                            (when (string-match "\\(finished\\|exited\\)" change)
                              (switch-to-buffer (process-buffer proc)))))
    ))


;;;###autoload
(defun joseph_compile_current_el_without_output()
  (when (and (member major-mode '(emacs-lisp-mode lisp-interaction-mode)))
    (start-process-shell-command
     "byte compile" nil (format
                         (concat " emacs  -batch    -l "
                                 joseph_joseph_install_path
                                 "joseph_byte_compile_include.el  -f batch-byte-compile %s ")
                         (buffer-file-name)))))
;;;###autoload
(defun byte-compile-all-my-el-files()
  "byte compile all by el files under ~/.emacs.d/site-lisp/ except cedet ."
  (interactive)
  (let ((files  (joseph-all-files-under-dir-recursively joseph_site-lisp_install_path "\\.el$" )))
    (setq files  (joseph-delete-matched-files files "/cedet-1.0/" t ));;不对cedet 进行编译
    (setq files (joseph-delete-matched-files files "/unused/" t));;对过期不用的不进行编译
    ;;这两句话保证joseph_init.el最后编译,如果先编译了它,那么所有的el都会被load进来,
    ;;包括folding.el ,不知道什么原因byte-compile-file 与folding好像有冲突
    ;;如果一个el里fold了,那么隐藏的内容无法被编译
    (setq files (joseph-delete-matched-files files "joseph_init.el$"))
    (joseph-byte-compile-files-outside files)
    (joseph-byte-compile-files-outside  (expand-file-name "~/.emacs.d/site-lisp/joseph/joseph_init.el"))
    ))
