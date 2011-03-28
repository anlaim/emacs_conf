;;{{{ byte compile

(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
  )
(add-to-list 'load-path (concat joseph_site-lisp_install_path "dired/"))

;;}}}
;;{{{ 一些命令注释

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

;;}}}

(require 'dired)
(require 'wdired)
(require 'dired-x)
(setq dired-recursive-copies 'always);让 dired 可以递归的拷贝和删除目录。 
(setq dired-recursive-deletes 'always);;always表示不加询问
(setq dired-omit-size-limit nil) ;;omit(隐藏某些文件时,字符数的一个限制,设为无限)
(setq wdired-allow-to-change-permissions t);; writable 时,不仅可以改文件名,还可以改权限
(setq  dired-dwim-target t );Dired试着猜处默认的目标目录
(setq dired-listing-switches " --time-style=+%y年%m月%d日%H时%M分  --group-directories-first -alhG")
;;(setq dired-listing-switches "-alhG  --group-directories-first")
;;(setq directory-free-space-args "-Pkh")

;;u原来绑定为unmark ,可以使用它的另一个绑定"*u"来完成
(define-key dired-mode-map "u" 'dired-up-directory)
;;(define-key dired-mode-map "q" 'kill-buffer-and-window)

;;{{{ 使用外部命令打开文件 "!"
;;可用，但很少用，故注释掉了
;; ;;在*.RM文件上使用"!" 命令,则会用mplayer 打开此文件
;; ;;在字符串里面如果有 * 出现则会被替换成文件名，另外，也可以直接在 Elisp 表达式里面使用 file 这个变量
;; ;;这里的设置对直接"回车"或"f"命令打开的文件不起作用.
;; (setq dired-guess-shell-alist-user
;;       '(("\\.pdf$" "acroread * &") ("\\.mp3$" "play_one_mp3.sh * &")
;;         ("\\.RM$" "mplayer * &") ("\\.rm$" "mplayer * &")
;;         ("\\.RMVB$" "mplayer * &") ("\\.avi$" "mplayer * &")
;;         ("\\.AVI$" "mplayer * &") ("\\.flv$" "mplayer * &")
;;         ("\\.mp4$" "mplayer * &") ("\\.mkv$" "mplayer * &")
;;         ("\\.rmvb$" "mplayer * &") ("\\.jpg$" "gpicview * &")
;;         ("\\.jpeg$" "gpicview * &")("\\.png$" "gpicview * &")
;;         ("\\.bmp$" "gpicview * &") ("\\.gif$" "gpicview * &")
;;         ("\\.html$" "firefox * &") ("\\.htm$" "firefox * &")
;;         ("\\.HTML$" "firefox * &") ("\\.HTM$" "firefox * &")
;;         ("\\.chm$" "chmsee * &"  "hh.exe") ("\\.CHM$" "chmsee * &" "hh.exe" )
;;         ("\\.rar$"  (concat "mkdir -p "
;;                  (file-name-sans-extension file) ";"
;;                  "unrar x -y "   "* "
;;                  (file-name-sans-extension file) " &"))
;;         ("\\.t\\(ar\\.\\)?gz$"
;;          (concat "mkdir  -p "
;;                  (file-name-sans-extension file)
;;                  "; " dired-guess-shell-gnutar " -C "
;;                  (file-name-sans-extension file)
;;                  " -zxvf * &")
;;          (concat "mkdir -p  "
;;                  (file-name-sans-extension file)
;;                  "; gunzip -qc * | tar -C "
;;                  (file-name-sans-extension file)
;;                  " -xvf - * & "))
;;         ))
;; ;;另外，对于 X 下的应用程序，我们通常不希望它把 Emacs 阻塞掉，
;; ;;而是同步执行，只需要在末尾加上 & 即可同步执行，同时 Emacs 会收集程序输出.
;; ;;可是有些程序的输出含有很多终端控制字符，mplayer 就是一个例子，我在这样运行
;; ;;mplayer 的时候显得十分卡，我想可能是输出被 Emacs 捕获到 buffer 里面的原因。
;; ;;这些输出本身就没有什么用，如果还会让程序运行缓慢的话，就更可恶了。
;; ;;把所有以 & 结尾的后台程序的输出都直接丢弃掉。
;; (defadvice dired-run-shell-command (around kid-dired-run-shell-command (command))
;;   "run a shell command COMMAND .
;; If the COMMAND ends with `&' then run it in background and *discard* the
;; output, otherwise simply let the original `dired-run-shell-command' run it."
;;   (if (string-match "&[[:blank:]]*$" command)
;;         (let ((proc (start-process "kid-shell" nil shell-file-name
;;                                    shell-command-switch
;;                                    (substring command 0 (match-beginning 0)))))
;;           (set-process-sentinel proc 'shell-command-sentinel))
;;       ad-do-it))
;; (ad-activate 'dired-run-shell-command)

;;}}}
;;{{{ dired-x 的一些配置

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

(setq dired-bind-jump t);;C-x C-j jump to dired
;;;;;;;;;;;;;;;;;;end of dired-x

;;}}}

;;{{{ 对于Windows 用户,隐藏掉不需要的信息,如文件权限

;;   (defvar wcy-dired-mode-hide-column-regex
;;   "^\\s-\\{2\\}[drwx-]\\{10\\}\\s-+[0-9]+\\s-+\\sw+\\s-+\\sw+"
;;   "doc")
;; (defun wcy-dired-mode-hide-column ()
;;   (interactive)
;;   (when (eq major-mode 'dired-mode)
;;     (save-excursion
;;       (save-match-data
;;         (goto-char (point-min))
;;         (while (re-search-forward wcy-dired-mode-hide-column-regex nil t nil)
;;           (let ((o (make-overlay (match-beginning 0) (match-end 0))))
;;             (overlay-put o 'invisible t)
;;             (overlay-put o 'id 'wcy-dired-mode-hide-column)))))))

;; (defun wcy-dired-mode-show-column ()
;;   (interactive)
;;   (when (eq major-mode 'dired-mode)
;;     (mapc (lambda (o)
;;             (if (eq (overlay-get o 'id) 'wcy-dired-mode-hide-column)
;;                 (delete-overlay o)))
;;           (overlays-in (point-min) (point-max)))))
;;;; 注意和 (add-hook 'dired-after-readin-hook 'sof/dired-sort) 的冲突要保证
;;;; dired-after-readin-hook 中 wcy-dired-mode-hide-column 在 sof/dired-sort 之后
;; (when (eq system-type 'windows-nt)
;;   (add-hook 'dired-after-readin-hook 'wcy-dired-mode-hide-column t nil))

;;;end of 对于Windows 用户,隐藏掉不需要的信息,如文件权限

;;}}}

;;{{{dired-view 可以只输入文件名的开头字母跳到相应的文件,
;;很少使用
;; ;;因为它对所有字母数字按键重新进行的绑定,所以与dired下的很多命令冲突
;; ;;故提供的一个toggle 按键 决定起不起有
;; (require 'dired-view)
;; ;;(add-hook 'dired-mode-hook 'dired-view-minor-mode-on) 是否 默认启用,否
;; (define-key dired-mode-map (kbd ";") 'dired-view-minor-mode-toggle)
;; (define-key dired-mode-map (kbd ":") 'dired-view-minor-mode-dired-toggle)
;;}}}
;;{{{ files+ ls-lisp+ 没什么用
;;;; files+.el对files.el增强
;;;; ls-list+.el 对ls-list.el增强 ,主要在MS系统上使用
;;;; ls-list+.el里面自动require files+
;; (eval-after-load "files"
;;   '(cond ((eq system-type 'gnu/linux)
;;          (require 'files+) )
;;         ((eq system-type 'windows-nt)
;;          (require 'ls-lisp+)))
;; )
;;}}}
;;{{{ dired+

(require 'dired+)
;;(setq diredp-dir-priv '((t (:foreground "DarkRed"))))
(setq diredp-display-msg '((t (:foreground "Goldenrod"))))
(setq diredp-exec-priv '((t (:foreground "cyan"))))
(setq diredp-file-name '((t (:foreground "LightCyan"))))
(setq diredp-file-suffix '((t (:foreground "LawnGreen"))))
(setq diredp-no-priv '((t nil)))
(setq diredp-number '((t (:foreground "DarkOliveGreen"))))
(setq diredp-rare-priv '((t (:foreground "Magenta"))))
(setq diredp-read-priv '((t (:foreground "SteelBlue"))))
(setq diredp-write-priv '((t (:foreground "OliveDrab"))))
(setq diredp-dir-priv '((t (:foreground "green"))))
(setq diredp-executable-tag '((t (:foreground "SpringGreen"))))

(define-key ctl-x-map   "d" 'diredp-dired-files)
(define-key ctl-x-4-map "d" 'diredp-dired-files-other-window)
;;    Most of the commands (such as `C' and `M-g') that operate on
;;    marked files have the added feature here that multiple `C-u' use
;;    not the files that are marked or the next or previous N files,
;;    but *all* of the files in the Dired buffer.  Just what "all"
;;    files means changes with the number of `C-u', as follows:

;;    `C-u C-u'         - Use all files present, but no directories.
;;    `C-u C-u C-u'     - Use all files and dirs except `.' and `..'.
;;    `C-u C-u C-u C-u' - use all files and dirs, `.' and `..'.
;;
;;    (More than four `C-u' act the same as two.)

;;}}}
;;{{{ 只显示匹配的文件 do filter  "z" 只显示匹配的文件
(defun dired-name-filter-only-show-matched-lines(filter-regexp)
  (interactive "s(only show matched):")
  (let ((dired-marker-char 16))
      (dired-map-dired-file-lines
       '(lambda (name)
          (print name)
	  (unless (string-match filter-regexp name)
	    (dired-mark 1))))
      (dired-do-kill-lines nil (concat "Filter" filter-regexp " omitted %d line%s")))
  (dired-move-to-filename)
  )
(define-key dired-mode-map  "z" 'dired-name-filter-only-show-matched-lines)

;;}}}
;;{{{ 临时忽略某些文件,用正则表达示  "/"
;; (dired-mark-unmarked-files "init" nil nil )
(define-key dired-mode-map (kbd "/")  'dired-omit-expunge)
;;}}}
;;{{{ `,'dired anything history 显示dired的浏览历史
(autoload 'anything-dired-history-view "anything-dired-history"
  "view dired directories you have visited." t)        
(setq-default anything-dired-history-cache-file "~/.emacs.d/dired-history")
(define-key dired-mode-map "," 'anything-dired-history-view)
;;}}}
;;{{{ dired-next-line previous-line 的advice ,让光标始终在filename上

(defadvice dired-next-line (around dired-next-line+ activate)
  "Replace current buffer if file is a directory."
        ad-do-it
        (while (and  (not  (eobp)) (not ad-return-value))
          (forward-line)
          (setq ad-return-value (dired-move-to-filename))
          )
        (when (eobp)
            (forward-line -1)
            (setq ad-return-value(dired-move-to-filename))
            )
  )
(defadvice dired-previous-line (around dired-previous-line+ activate)
  "Replace current buffer if file is a directory."
        ad-do-it
        (while (and  (not  (bobp)) (not ad-return-value))
          (forward-line -1)
          (setq ad-return-value(dired-move-to-filename))
          )
        (when (bobp)
          (call-interactively 'dired-next-line)
            )
  )

;;}}}

;;{{{ 排序
;;要放到dired+之后,
;;1菜单排序 Shift+中键弹出菜单
(require 'dired-sort-menu)
(require 'dired-sort-menu+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;end of do filter
;;;do sorting
;; 1. s s 按照文件大小排序。
;; 2. s x 按照文件扩展名排序。
;; 3. s t 按照文件访问时间排序。
;; 4. s n 按照文件名称的字母顺序排序。
;; 5. s C-s 原来的s 功能 ,C=u s C-s 可手动编辑ls 的命令
(require 'dired-sort-map)
(define-key dired-sort-map "\C-s" 'dired-sort-toggle-or-edit )

;;Windows 的文件管理器可以把目录优先排在前面。把下面的代码放在你的 .emacs 中，可以实现这个功能。
(defun sof/dired-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))
(add-hook 'dired-after-readin-hook 'sof/dired-sort)
;;;end of  do sorting

;;}}}
;;{{{ 避免打开多个dired-buffer,否则进行一定操作后,打开的dired-buffer 会很多很乱
;;(toggle-dired-find-file-reuse-dir 1)
;;(toggle-dired-find-file-reuse-dir -1)
;;dired+ 提供了相同的功能, 所以这里注释掉
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;dired from wiki
(defun joseph-kill-all-other-dired-buffers ( &optional current-buf)
  "kill all dired-buffers and diredp-w32-drivers-mode(w32 use this mode )
  except current-buf ,if current-buf is nil then kill all"
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (not (eq current-buf buf))
                 (or  (eq 'dired-mode  major-mode)
                      (eq 'diredp-w32-drives-mode major-mode))
                 )
        (kill-buffer buf)
        )))
  )
(defadvice dired-find-file (around dired-find-file-single-buffer activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer))
        (filename (dired-get-file-for-visit)))
    ad-do-it
    (when (and (file-directory-p filename)
               (not (eq (current-buffer) orig)))
      (joseph-kill-all-other-dired-buffers (current-buffer)))))

;;dired+ 没提供dired-up-directory使用同一个buffer 的功能,所以
;; (defadvice dired-up-directory (around dired-up-directory-single-buffer activate)
;;   "Replace current buffer if file is a directory."
;;   (interactive)
;;   (let ((orig (current-buffer))
;;         (filename (dired-get-file-for-visit)))
;;     ad-do-it
;;     (when (and (file-directory-p filename)
;;                (not (eq (current-buffer) orig)))
;;       (kill-buffer orig)
;;       (joseph-kill-all-other-dired-buffers (current-buffer)))) )
(defadvice dired-up-directory (around dired-up-directory-single-buffer activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer)))
    ad-do-it
;;    (kill-buffer orig)
    (joseph-kill-all-other-dired-buffers (current-buffer))
    ))


;;虽然做了以上处理,但是C-x d 命令打开dired时,仍然会新建一个dired-buffer
;;所以要做以下几个advice ,如果不用dired+则需要在(dired)上做advice
;;如果用了dired+ 则需要在dired+提供的几个函数上做advice
;;如果不用dired+ 
;; (defadvice dired (before dired-single-buffer activate)
;;   "Replace current buffer if file is a directory."
;;   (joseph-kill-all-dired-buffers)
;; )
;;change to another directory
;;(define-key dired-mode-map "c" 'dired)
;;
;;如果用了dired+ 
(defadvice diredp-dired-files (before dired-single-buffer activate)
  "Replace current buffer if file is a directory."
  (joseph-kill-all-other-dired-buffers)
)
(defadvice dired (before dired-single-buffer activate)
  "Replace current buffer if file is a directory."
  (joseph-kill-all-other-dired-buffers)
)
;;打开另一个目录
(define-key dired-mode-map "c" 'diredp-dired-files)
(define-key dired-mode-map [mouse-2] 'diredp-mouse-find-file )

;; (defun dired-mouse-find-alternate-file (event)
;;   "In dired, visit the file or directory you click on instead of the dired buffer."
;;   (interactive "e")
;;   (let (file)
;;     (save-excursion
;;       (set-buffer (window-buffer (posn-window (event-end event))))
;;       (save-excursion
;; 	(goto-char (posn-point (event-end event)))
;; 	(setq file (dired-get-filename nil t))))
;;     (select-window (posn-window (event-end event)))
;;     (find-alternate-file (file-name-sans-versions file t))))
;; (define-key dired-mode-map [mouse-2] 'dired-mouse-find-alternate-file)

;;}}}

;;{{{  openwith ,外部程序

;;直接用正常的方式打开相应的文件,openwith会自动做处理
;;`C-xC-f'即可
(when (eq system-type 'windows-nt)
  (require'w32-shell-execute)
  )
(require 'openwith)
(openwith-mode t)
(when (eq system-type 'gnu/linux)
  (setq openwith-associations
        '(("\\.pdf$" "acroread" (file)) ("\\.mp3$" "mplayer" (file) )
          ("\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp4\\|\\.mkv$\\|\\.rmvb$" "mplayer" (file) ) 
;;          ("\\.jpe?g$\\|\\.png$\\|\\.bmp\\|\\.gif$" "gpicview" (file))
          ("\\.CHM$\\|\\.chm$" "chmsee"  (file) )
          )
        )
  )
(when (eq system-type 'windows-nt)
  ;;windows 上使用w32-shell-execute 调用系统的相应程序打开
  (setq openwith-associations
        '(("\\.pdf$" "open" (file)) ("\\.mp3$" "open" (file) )
          ("\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp4\\|\\.mkv$\\|\\.rmvb$" "open" (file) ) 
          ("\\.jpe?g$\\|\\.png$\\|\\.bmp\\|\\.gif$" "open" (file))
          ("\\.CHM$\\|\\.chm$" "open"  (file) )
          )
        )
  )
(defun open-with-C-RET-on-linux()
  "in dired mode ,`C-RET' open file with ..."
  (interactive)
  (let ((file-name (dired-get-filename))
        (openwith-associations
        '(("\\.pdf$" "acroread" (file)) ("\\.mp3$" "mplayer" (file) )
          ("\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp4\\|\\.mkv$\\|\\.rmvb$" "mplayer" (file) ) 
          ("\\.jpe?g$\\|\\.png$\\|\\.bmp\\|\\.gif$" "gpicview" (file))
          ("\\.CHM$\\|\\.chm$" "chmsee"  (file) ))))
    (if (string-match "\\.html?$" file-name)
          (if (> (string-to-number (shell-command-to-string "pgrep firefox | wc -l")) 0)
              (progn
                (start-process-shell-command "firefox" nil (format "echo ' show_matched_client({class=\"Firefox\" ,instance=\"Navigator\"},\"www\",\"/usr/bin/firefox %s  \" ,nil)' |awesome-client " file-name))
                (start-process "firefox-file" nil "firefox" file-name))
            (start-process-shell-command "firefox" nil (format "echo ' show_matched_client({class=\"Firefox\" ,instance=\"Navigator\"},\"www\",\"/usr/bin/firefox %s  \" ,nil)' |awesome-client " file-name))
            )
      (dired-find-file)  
      )
    )
  )
(when (equal system-type 'gnu/linux)
  (define-key dired-mode-map [(control return)] 'open-with-C-RET-on-linux))

;;}}} 
;;{{{ 使用外部 文件管理器 打开选中文件
(when (eq system-type 'windows-nt)
  ;;on windows 
  ;;  C-RET  用系统默认程序打开选中文件
  ;; M-RET  open Windows Explorer
  ;; ^ 我改成了u ,可以列出根盘符
  ;;
  (require 'w32-browser)
  (define-key diredp-w32-drives-mode-map "n" 'next-line)
  (define-key diredp-w32-drives-mode-map "p" 'previous-line)
  
  ;;M-<RET> 用资源管理器打开当前文件所处目录
  (global-set-key "\M-\C-m" '(lambda () (interactive ) (w32explore (expand-file-name default-directory))))
  )

;;`M-RET' 用pcmanfm文件管理器打开当前目录
(when (eq system-type 'gnu/linux)
  (defun open-directory-with-pcmanfm()
    (interactive)
    (start-process "pcmanfm"  nil "pcmanfm" (expand-file-name  default-directory)))
  (define-key dired-mode-map "\M-\C-m" 'open-directory-with-pcmanfm)
  (global-set-key "\M-\C-m" 'open-directory-with-pcmanfm) 
  )
;;}}}


(provide 'joseph_dired)

