;; -*- Emacs-Lisp -*-
;; Time-stamp: <jixiuf 2011-03-28 20:50:38>
;;;###autoload
(defun my-add-subdirs-to-load-path (dir)
  "把DIR的所有子目录都加到`load-path'里面"
  (interactive)
  (let ((default-directory (concat dir "/")))
    (add-to-list 'load-path dir)
    (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (normal-top-level-add-subdirs-to-load-path))))

;; Fix bug of `normal-top-level-add-subdirs-to-load-path'
;; which can not add directory which name end with ".elc?"
;; copy from emacs23 startup.el and modify it
;;;###autoload
(defun normal-top-level-add-subdirs-to-load-path ()
  "Add all subdirectories of current directory to `load-path'.
More precisely, this uses only the subdirectories whose names
start with letters or digits; it excludes any subdirectory named `RCS'
or `CVS', and any subdirectory that contains a file named `.nosearch'."
  (let (dirs
        attrs
        (pending (list default-directory)))
    ;; This loop does a breadth-first tree walk on DIR's subtree,
    ;; putting each subdir into DIRS as its contents are examined.
    (while pending
      (push (pop pending) dirs)
      (let* ((this-dir (car dirs))
             (contents (directory-files this-dir))
             (default-directory this-dir)
             (canonicalized (if (fboundp 'untranslated-canonical-name)
                                (untranslated-canonical-name this-dir))))
        ;; The Windows version doesn't report meaningful inode
        ;; numbers, so use the canonicalized absolute file name of the
        ;; directory instead.
        (setq attrs (or canonicalized
                        (nthcdr 10 (file-attributes this-dir))))
        (unless (member attrs normal-top-level-add-subdirs-inode-list)
          (push attrs normal-top-level-add-subdirs-inode-list)
          (dolist (file contents)
            ;; The lower-case variants of RCS and CVS are for DOS/Windows.
            (unless (member file '("." ".." "RCS" "CVS" "rcs" "cvs"))
              (when (and (string-match "\\`[[:alnum:]]" file)
                         ;; Avoid doing a `stat' when it isn't necessary
                         ;; because that can cause trouble when an NFS server
                         ;; is down.
                         (file-directory-p file))
                (let ((expanded (expand-file-name file)))
                  (unless (file-exists-p (expand-file-name ".nosearch"
                                                           expanded))
                    (setq pending (nconc pending (list expanded)))))))))))
    (if (equal window-system 'w32)
        (setq load-path (append (nreverse dirs) load-path))
      (normal-top-level-add-to-load-path (cdr (nreverse dirs))))))

;; (joseph-files-in-directory-cyclely"~/.emacs.d/" "\\.el$")
;;;###autoload
(defun joseph-files-in-directory-cyclely(dir &optional pattern )
  "return all files in `dir'  match `pattern'  cyclely, if pattern is nil return all"
  (let((files (directory-files dir t)) (matched-files)
       (intern-pattern (or pattern ""))
       head)
    (while (> (length files) 0)
      (setq head (pop files))
      (when (file-readable-p head)
        (if (file-directory-p head)
            (when (and (not (string-match "^\\." (file-name-nondirectory head)))
                       (file-executable-p head))
              (setq files (append (directory-files head t) files )))
          (when (string-match intern-pattern (file-name-nondirectory head))
            (add-to-list 'matched-files head))
          )
        )
      )
    matched-files
    ))

;;;###autoload
(defun joseph-files-delete-matched-files(files pattern)
  (let ((tmp-files))
    (dolist (file files)
    (unless (string-match pattern file)
      (add-to-list 'tmp-files file)))
    tmp-files))

;;;###autoload
(defun joseph-byte-compile-files-outside (files)
  "调用外部的emacs byte compile 所有files 中指定的文件.
输出的结果呈现在当前emacs 中的一个buffer中"
  (let (file-strings process)
    (dolist (file files)
      (setq file-strings (concat file-strings " " file)))
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
(defun byte-compile-all-my-el-files()
  "byte compile all by el files under ~/.emacs.d/site-lisp/ except cedet ."
  (interactive)
  (let ((files (joseph-files-in-directory-cyclely joseph_site-lisp_install_path "\\.el$")))
    (setq files (joseph-files-delete-matched-files files "/cedet-1.0/"));;不对cedet 进行编译
    (setq files (joseph-files-delete-matched-files files "site-lisp/unused/"));;对过期不用的不进行编译

    ;;这两句话保证joseph_init.el最后编译,如果先编译了它,那么所有的el都会被load进来,
    ;;包括folding.el ,不知道什么原因byte-compile-file 与folding好像有冲突
    ;;如果一个el里fold了,那么隐藏的内容无法被编译
    (setq files (joseph-files-delete-matched-files files "/joseph_init.el"))
;;    (add-to-list 'files (expand-file-name "~/.emacs.d/site-lisp/joseph/joseph_init.el" t))
    (joseph-byte-compile-files-outside files)
    (joseph-byte-compile-files-outside (list (expand-file-name "~/.emacs.d/site-lisp/joseph/joseph_init.el")))
    )
  )

;;;###autoload
(defun joseph-add-hooks (hooks function &optional append local)
  "Call `add-hook' on hook list HOOKS use arguments FUNCTION, APPEND, LOCAL.
HOOKS can be one list or just a hook."
  (if (listp hooks)
      (mapc
       `(lambda (hook)
          (add-hook hook ',function append local))
       hooks)
    (add-hook hooks function append local)))

;;;###autoload
(defun joseph-hide-frame()
  "hide current frame"
  (interactive)
  (make-frame-invisible nil t))

;;;###autoload
(defun joseph-append-semicolon-at-eol(&optional arg)
  "在当前行任何位置输入分号都在行尾添加分号，除非本行有for 这个关键字，
如果行尾已经有分号则删除行尾的分号，将其插入到当前位置,就是说输入两次分号则不在行尾插入而是像正常情况一样."
  (interactive "*p")
  (let* ( ( init_position (point))
          (b (line-beginning-position))
          (e (line-end-position))
          (line_str (buffer-substring b e))
          (semicolon_end_of_line (string-match ";[ \t]*$" line_str ))
          )
    (if semicolon_end_of_line ;;;;如果行尾已经有分号，则删除行尾的分号，并在当前位置输入分号;;;;;;
        (progn
          (save-excursion
            (goto-char (+ semicolon_end_of_line b))
            (delete-char 1) )
          (insert ";") )
      ;;在整行内容中搜索有没有关键字for的存在,或者当前位置已经是行尾,直接插入分号
      (if   (or (string-match "^[ \t]*$" (buffer-substring init_position e))
                (string-match "\\bfor\\b" line_str))
          (insert ";")
        (save-excursion ;;如果搜索不到 for 则在行尾插入分号;
          (end-of-line)
          (delete-trailing-whitespace)
          (insert ";")
          )))))

(provide 'joseph-util)
