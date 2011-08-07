;;; -*- coding:utf-8 -*-
;;; 一些命令注释

;;q        quit
;; f <RET> open file 打开文件
;; o       open file other window 在另一个窗口中打开文件
;;C-o      open file other window (point in this window) ,在另个窗口打开文件,焦点仍在当前window
;;v        view-file 只读打开(q 退出)
;; ^       上层目录 ,我改成了u

;;关于mark,将文件标记之后,一些处理文件的命令会对mark的所有文件
;;采取一致的行动,如删除等.

;; m与*m 标记为"*"
;; **    标记所有可执行文件
;; *@    标记所有软连接文件
;; */    标记所有目录(.与..除外)
;; *s    标记当前目录的所有
;; u与*u     删除标记 (u被我重定义为回到上层)
;; U与*!  删除所有标记
;; %d REGEXP  将所有文件匹配的文件标记为D(删除)
;; %m REGEXP  将所有文件匹配的文件标记为*
;; %g REGEXP <RET>  如果文件中的内容匹配正则表达示则标记之
;; *C-n 移动到下一个标记的文件
;; *C-p .....上...........
;;

;;操作文件的命令,有以下规则
;;如果有前缀参数N 则对从当前文件开始的N个文件执行操作,负数则反向
;;否则对标记mark为*的文件,
;;否则 当前文件

;;C  copy
;; (setq dired-copy-preserve-time t),copy时保留原文件的修改时间 如果cp -p

;;D  delete  ,经确认后马上删除
;;d  detele 实际只是标记此文件为删除,执行x 才真正删除

;;R   mv rename 重命名,移动文件
;;H  硬链接
;;M  chmod  ,如M 755 修改为755
;;G  change group
;;O   change owner
;;T  touch file
;;Z   compress or uncompress
;;L   load lisp
;;A REGEXP  ,在文件中search   ,M-, 跳到下一个
;;Q REGEXP  ,query-replace-regexp(`dired-do-query-replace-regexp').

;;子目录
;;i 同时打开目录
;;$ hide or show 当前目录
;;指定隐藏哪些文件 : C-o, toggle


;; g refresh all
;; l  refresh mark的文件
;; k 隐藏指定文件
;; s 排序 字母,或date 间toggle


;;编辑,输入C-x C-q 切换到writable 模式,此时修改文件名,然后C-c c-c 提交
;;也或以移动文件,将文件名写成相应的路径名即可
;;设置在writable 模式下允许修改权限
;;(setq wdired-allow-to-change-permissions t)
;;C-td 会将目录中所有标记的文件生成缩略图,图片预览

;;w  copy the file name
;;C-uw copy 全路径名

;;dired 支持拖放,你可以在pcmanfm nautils 中将文件,拖动到dired buffer 中

;;正则表达式的应用
;;% R FROM <RET> TO <RET>'   ;rename
;;% C FROM <RET> TO <RET>'   ; copy
;;% H FROM <RET> TO <RET>'   ; Hard link
;;% S FROM <RET> TO <RET>'   ; soft link
;;FROM TO 是一个正则,另外在TO 中可以用\&引用FROM整个的匹配组,\数字匹配某一个组
;;如 % R ^.*$ <RET> \&.tmp <RET>' 重命名所有标记的文件为*.tmp

;;= diff
;;M-=  diff 与backup

;;!与X 执行shell 命令,"*" 代表选中的文件名
;;如我想把abc 文件移动到/tmp
;; !cp * /tmp
;; !tar -cf a.tar *
;; !for file in * ; do mv "$file" "$file".tmp; done
;;
;;与*类似但不相同的"?" 表示对mark的文件"分别" 运行这个命令
;;! gzip ?
;;
;;C-x C-j 假如此时你在编辑一个文件, 跳回到相应的此文件所在的dired buffer ,
(autoload 'dired-jump "dired-x" "dired jump" t)
(global-set-key (kbd "C-x C-j") 'dired-jump)
(setq-default image-dired-db-file "~/.emacs.d/cache/image-dired/.image-dired_db")
(setq-default image-dired-dir "~/.emacs.d/cache/image-dired/")
(setq-default image-dired-gallery-dir "~/.emacs.d/cache/image-dired/.image-dired_gallery")
(setq-default image-dired-main-image-directory "~/image")
(setq-default image-dired-temp-image-file "~/.emacs.d/cache/image-dired/.image-dired_temp")
(setq-default thumbs-thumbsdir "~/.emacs.d/cache/thumbs")

;;; wdired的配置
;;(autoload 'wdired-change-to-wdired-mode "wdired")
;;(define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)
(eval-after-load "dired"
          '(progn
             (message "dired is loaded")
             (autoload 'wdired-change-to-wdired-mode "wdired")
             (define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)
             ;;(define-key dired-mode-map "\M-r" 'wdired-change-to-wdired-mode)
             (define-key dired-mode-map
               [menu-bar immediate wdired-change-to-wdired-mode]
               '("Edit File Names" . wdired-change-to-wdired-mode))))

;;; dired的配置
(eval-after-load 'dired
  '(progn
     (setq dired-recursive-copies 'always);让 dired 可以递归的拷贝和删除目录。
     (setq dired-recursive-deletes 'always);;always表示不加询问
     (setq dired-omit-size-limit nil) ;;omit(隐藏某些文件时,字符数的一个限制,设为无限)
     (setq wdired-allow-to-change-permissions t);; writable 时,不仅可以改文件名,还可以改权限
     (setq  dired-dwim-target t );Dired试着猜处默认的目标目录
     (if (equal system-type 'gnu/linux)
       (setq dired-listing-switches " --time-style=+%y-%m-%d$%H:%M  --group-directories-first -alhG")
       (setq dired-listing-switches "-alhG")
         )

     ;;(setq dired-listing-switches "-alhG  --group-directories-first")
     ;;(setq directory-free-space-args "-Pkh")
     ;;u原来绑定为unmark ,可以使用它的另一个绑定"*u"来完成
     (define-key dired-mode-map "u" 'dired-up-directory)
     ;;change to another directory
     (define-key dired-mode-map "c" 'dired)
     ;;(define-key dired-mode-map "q" 'kill-buffer-and-window)
     ))

(add-hook 'dired-load-hook
          (function (lambda ()
                      (require 'dired-x)
                      ;;in dired mode ,C-s works like "M-s f C-s" ,only search filename in dired buffer
                      (setq dired-isearch-filenames t )
                      ;;不知道出什么原因,如果delete-by-moving-to-trash 设成t ,emacs --daemon 会启动失败
                      (setq delete-by-moving-to-trash nil);;using trash
                      ;;dired-x ;;增强的dired功能
                      ;; 如果buffer中有一个路径如/home/jixiuf/,光标移动到其上C-u C-x C-f,会以此路径默认路径
                      ;; Make sure our binding preference is invoked.
                      ;;(setq dired-x-hands-off-my-keys nil) (dired-x-bind-find-file)
                      ;; Set dired-x global variables here.  For example:
                      ;;定义哪些文件会忽略如.git
                      (add-hook 'dired-mode-hook (lambda ()
                                                   (dired-omit-mode  1)));;M-o toggle 是否显示忽略的文件
                      (setq dired-omit-files (concat dired-omit-files "\\|^\\..+$\\|^.*~$\\|^#.*#$\\|^\\.git$\\|^\\.svn$"))
                      (setq dired-omit-extensions '("CVS/" ".o" "~" ".bin" ".lbin"
                                                    ".fasl" ".ufsl" ".a" ".ln" ".blg"
                                                    ".bbl" ".elc" ".lof" ".glo" ".idx"
                                                    ".lot" ".fmt" ".tfm" ".class" ".fas" ".lib" ".x86f"
                                                    ".sparcf" ".lo" ".la" ".toc" ".log" ".aux" ".cp" ".fn" ".ky" ".pg"
                                                    ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs"
                                                    ".idx" ".lof" ".lot" ".glo" ".blg" ".bbl" ".cp" ".cps" ".fn" ".fns" ".ky"
                                                    ".kys" ".pg" ".pgs" ".tp" ".tps" ".vr" ".vrs"))

                      )))


;;; 只显示匹配的文件 do filter  "z" 只显示匹配的文件
(eval-after-load 'dired
  '(progn
     (defun dired-name-filter-only-show-matched-lines(filter-regexp)
       (interactive "s(only show matched):")
       (let ((dired-marker-char 16)
             (files (directory-files default-directory t)))
         ;;(dired-unmark-all-files dired-marker-char)
         (save-excursion
           (dolist (file files)
             (when (and (dired-goto-file  (expand-file-name file))
                        (not (string= "" filter-regexp))
                        (string-match filter-regexp (file-name-nondirectory file)))
               (dired-mark 1)
               )))
         (dired-toggle-marks)
         (dired-do-kill-lines nil (concat "Filter:'" filter-regexp "' omitted %d line%s"))
         (dired-move-to-filename)
         )
       )
     (define-key dired-mode-map  "z" 'dired-name-filter-only-show-matched-lines)
     ;; (dired-mark-unmarked-files "init" nil nil )
     ;; 临时忽略某些文件,用正则表达示  "/"
     (define-key dired-mode-map (kbd "/")  'dired-omit-expunge)))


;;; `,'dired anything history 显示dired的浏览历史
(autoload 'anything-dired-history-view "anything-dired-history"
  "view dired directories you have visited." t)
;;(setq-default anything-dired-history-cache-file "~/.emacs.d/cache/dired-history")
(eval-after-load 'dired
  '(progn
     (defun anything-dired()
       "call `anything' to show dired history and files in current buffers."
       (interactive)
       (require 'anything-dired-history)
       (let ((anything-execute-action-at-once-if-one t)
             (anything-quit-if-no-candidate
              (lambda () (message "No history record."))))
         (anything '(anything-c-source-dired-history anything-c-source-files-in-current-dir+))))
     (define-key dired-mode-map "," 'anything-dired)))
;;; dired-next-line previous-line 的advice ,让光标始终在filename上

(eval-after-load 'dired
  '(progn
     (defadvice dired-next-line (around dired-keep-point-on-filename-next activate)
       "Replace current buffer if file is a directory."
       ad-do-it
       (while (and  (not  (eobp)) (not ad-return-value))
         (forward-line)
         (setq ad-return-value (dired-move-to-filename)))
       (when (eobp)
         (forward-line -1)
         (setq ad-return-value(dired-move-to-filename))))

     (defadvice dired-previous-line (around dired-keep-point-on-filename-previous activate)
       "Replace current buffer if file is a directory."
       ad-do-it
       (while (and  (not  (bobp)) (not ad-return-value))
         (forward-line -1)
         (setq ad-return-value(dired-move-to-filename)))
       (when (bobp)
         (call-interactively 'dired-next-line)))

     (define-key dired-mode-map (kbd "M-<") (lambda ()
                                              (interactive)
                                              (beginning-of-buffer)
                                              (dired-next-line 2)))

     (define-key dired-mode-map (kbd "M->") (lambda ()
                                              (interactive)
                                              (end-of-buffer)
                                              (dired-previous-line 1)))


))

;;; 排序
;;;do sorting
;; 1. s s 按照文件大小排序。
;; 2. s x 按照文件扩展名排序。
;; 3. s t 按照文件访问时间排序。
;; 4. s n 按照文件名称的字母顺序排序。
;; 5. s C-s 原来的s 功能 ,C=u s C-s 可手动编辑ls 的命令
(eval-after-load 'dired
'(progn (require 'dired-sort-map)
        (define-key dired-sort-map "\C-s" 'dired-sort-toggle-or-edit )))
;;; Windows 的文件管理器可以把目录优先排在前面。把下面的代码放在你的 .emacs 中，可以实现这个功能。
(defun dired-sort-directory-first ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))

(defadvice dired-readin
  (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (dired-sort-directory-first))

;;; 避免打开多个dired-buffer,否则进行一定操作后,打开的dired-buffer 会很多很乱
(eval-after-load 'dired '(progn (require 'joseph-single-dired)))
(eval-after-load 'dired '(progn (require 'dired-filetype-face)))

(provide 'joseph_dired)

