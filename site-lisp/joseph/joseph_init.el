 ;; -*-no-byte-compile: t; -*-
 ;;;;Time-stamp: <jixiuf 2011-03-06 14:25:39>
;;{{{ byte compile
(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
  )
;;}}}
;; 一些与键绑定相关的配置
(require 'joseph_folder)
(require 'joseph_keybinding);
;;其他零碎的配置都放到joseph_common.el文件
(require 'joseph_common)
;;{{{ joseph_sudo 通过sudo 以root 用户身份打开当前文件(一键切换)

(when (eq system-type 'gnu/linux)
     ;;emacs 自带一个功能实现编辑只读文件C-x C-q  toggle-read-only
     ;; now you can use "C-c o" to toggle between root and common user to edit current file
      (require 'joseph_sudo)
      (global-set-key (kbd "C-c o") 'toggle-read-only-file-with-sudo)
      ;;(global-set-key (kbd "C-c C-r") 'wl-sudo-find-file) ;;
      )

;;}}}
;;与dired 文件管理相关的配置
(require 'joseph_dired)
;; 与 剪切板,编码,X window-nt相关的东西
(require 'joseph_clipboard_and_encoding)

;; 所有关于矩形操作的配置都在joseph_rect_angle.el文件中
(require 'joseph_rect_angle)

;;jad decompile ,when you open a Java.class File ,it will use jad
;;decomplie the class ,and load the java file to buffer
;; need support of jde
(require 'joseph_jad_decompile)
(require 'joseph-file-name-cache)
;;所有关于自动补全的功能都在joseph_complete.el 文件中进行配置
(require 'joseph_complete)
(require 'joseph_ibuffer)
;;{{{ joseph scroll screen up and down

(autoload 'joseph-scroll-half-screen-down "joseph-scroll-screen" "scroll half screen down" t)
(autoload 'joseph-scroll-half-screen-up "joseph-scroll-screen" "scroll half screen up" t)
(global-set-key "\C-v" 'joseph-scroll-half-screen-down)
(global-set-key "\C-r" 'joseph-scroll-half-screen-up)

;;}}}
;;{{{ quick-jump.el 我写的quick-jump

;; (require 'quick-jump)
;; (quick-jump-default-keybinding)
  (autoload 'quick-jump-push-marker "quick-jump"
    " push current marker in ring. you can jump back" t)
  (autoload 'quick-jump-go-back "quick-jump"
    "Go back in `qj-marker-ring'")
  (autoload 'quick-jump-go-forward "quick-jump"
    "Go forward in `qj-marker-ring'")
  (autoload 'quick-jump-clear-all-marker "quick-jump"
    "clear all marker in `qj-marker-ring'.")
  (autoload 'quick-jump-default-keybinding "quick-jump"
    "default keybindings for quick-jump" nil)
  (quick-jump-default-keybinding)

;;}}}

;;{{{ goto-last change

;;快速跳转到当前buffer最后一次修改的位置 利用了undo定位最后一次在何处做了修改
(autoload 'goto-last-change "goto-last-change"
  "Set point to the position of the last change." t)
(global-set-key (kbd "C-x C-/") 'goto-last-change)

;;}}}
;;{{{ 上下移动当前行, (Eclipse style) `M-up' and `M-down' 

;; 模仿eclipse 中的一个小功能，用;alt+up alt+down 上下移动当前行
;;不仅当前行,也可以是一个选中的区域

;;(require 'move-text)
;;default keybinding is `M-up' and `M-down'
(autoload 'move-text-up "move-text" "move current line or selected regioned up" t)
(autoload 'move-text-down "move-text" "move current line or selected regioned down" t)
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

;;}}}
;;{{{ 将选区或者当前buffer 生成html格式（带语法着色）

;; M-x htmtize-file 
;;(require 'htmlize)
(autoload 'htmlize-file "htmlize" "将选区或者当前buffer 生成html格式（带语法着色）" t)

;;}}}
;;C-x C-f 时 输入 / 或者~ 会自动清除原来的东西,只留下/ 或者~
(require 'minibuf-electric-gnuemacs)
(require 'joseph_tags);;需要在anything load之后

(require 'joseph-anything)
;;{{{ Version Control Merge Diff Ediff

(require 'psvn)
;;{{{ version control :VC

;;在进行`C-xvv' `C-xvi'等操作时不必进行确认,
;;自动保存当前buffer后进行操作 除非进行一个危险的操作,如回滚
(setq vc-suppress-confirm t)
;;VC 的很多操作是调用外部命令,它选项会提示命令的相应信息,如运行了哪个命令
(setq vc-command-messages t ) 
;;,默认`C-cC-c'是此操作,但总手误,编辑完提交日志的内容,进行提交操作
(define-key vc-log-mode-map "\C-x\C-s" 'log-edit-done)

;; C-x v v     vc-next-action -- perform the next logical control operation on file 会根据当前文件状态决定该做什么
;; 1.如果当前的文件(work file)不在任何一个version control 管理下,则询问你创建什么样的仓库,如svn git等.
;; 2.如果在管理下,则register the file. 即git add filename.
;; 3.如果work file 与库中的文件一样,do nothing.
;; 4.若不一样,则进行merge (checkout 或update) 操作. 即更新(好像并不更新,更新需要`C-xvu')
;; 5.如果你对work file 进行的修改则进行checkin(即commit)操作,它会打开一个*VC-LOG*buffer让你输入日志,关于*VC-LOG* 见下面的注释
;; 6.如果有冲突则先merge 最新的文件到work file,此时work file 处于冲突状态,需要解决冲突,继续`C-xvv'后说明冲突已解决此后再`c-xvv'则提交
;;`C-uC-xvv' 可以选择进入哪个分支,reversion,

;; C-x v i     vc-register -- add a new file to version control  ;;相当于git add .将文件加入到版本管理当中

;; C-x v ~     vc-version-other-window -- look at other revisions
;;             查看此文件以前的版本对应的内容,需要输入版本号,git 操作不太方便,因为版本号不是递增的数字,而是SHA1值
;; C-x v =     vc-diff -- diff with other revisions
;;             对未提交的文件与最新的版本对应的文件进行diff操作,C-u可以选择用哪两个版本,不仅可以单文件diff,
;;             可以是fileset,如何对多文件进行操作看vc-dir mode `C-xvd' 类似于dired, ibuffer.
;; C-x v D     同`C-xv=' ,不过是对所有的文件进行与最新的版本进行diff操作(`C-xv='需要选择操作哪些文件),即显示最近进行了哪些未提交的修改
;; C-x v u     vc-revert-buffer -- undo checkout  放弃对文件的修改,即重新update 一下.
;;{{{ 查看日志 `*vc-change-log*' buffer
;; C-x v l     vc-print-log -- show log (not in ChangeLog format) 显示日志,只显示当前文件有关的日志
;; C-x v L     `vc-print-root-log' 显示日志,显示所有日志
;; 在*vc-change-log*buffer 中可以进行以下操作
;; `p' 跳转到前一个日志条目
;; `n' 跳转到下一个日志条目
;; `P'
;;      Move to the log of the previous file, when the logs of multiple
;;      files are in the log buffer (*note VC Directory Mode::).
;;      Otherwise, just move to the beginning of the log.  A numeric
;;      prefix argument is a repeat count, so `C-u 10 P' would move
;;      backward 10 files.
;; `N'
;;      Move to the log of the next file, when the logs of multiple files
;;      are in the log buffer (*note VC Directory Mode::).  It also takes a
;;      numeric prefix argument as a repeat count.

;;`a'  对当前对应的版本进行annotate 操作,详见`C-xvg' ,下面有注释
;; e   重新编辑当前的日志内容,并不是所有的管理工具都支持
;; f   查看引版本的文件对应的内容,相当于`C-xv~' 然后输入版本号的操作,对git 来说比`C-xv~'方便
;; d   diff 对此版本与前一个版本的当前文件diff操作
;; D   diff ,同d ,不过是所有的文件,
;;}}}
;;{{{ ChangeLog 文件
;;`C-x4a' 在ChangeLog文件中添加一个条目,关于当前文件的修改的,当前日期的.
;;`C-xva' 根据version control 日志自动生成ChangeLog,不过svn git 目录还不支持.
;;在编辑ChangeLog时
;;`C-j' 自动缩进
;;C-x`  打开此条目对应的文件
;;}}}
;;{{{ `C-xvd' vc-dir  多文件操作
;; C-x v d     vc-directory -- show all files which are not up to date
;;             操作有点类似dired ,它是VC 支持多文件操作的方式,在*vc-dir* buffer 中会显示处于version control管理下的文件
;;             不过默认up-to-date 的文件及相应的子目录会被隐藏,例外是这个up-to-date 的文件是刚刚被你提交导致的,则不隐藏.
;;            其格式如下
;;           ./
;;           modified           file1.c
;;           needs-update       file2.c
;;           needs-merge        file3.c
;;           unregistered        g.c

;;           其中很多命令类似于dired
;;           n p TAB SPC 上下箭头进行导航
;;           `RET' 和f 打开相应文件 ,o 在另外一个窗口打开
;;           q 退出
;;           x 隐藏所有up-to-date的文件
;;           m 对文件进行标记,然后可以对标记的文件进行操作,如commit提交
;;          `M' 标记所有与当前文件状态相同的文件
;;           u 与U则是m M相反的操作
;;           对标记的文件或者当前文件的内容进行搜索替换
;;           `S' searches the marked files.
;;           `Q' does a query replace on the marked files.
;;           `M-s a C-s' does an incremental search on the marked files.
;;           `M-s a C-M-s' does an incremental search on the marked files.
;;
;;           另外以`C-xv'为前缀的命令在vc-dir buffer中都有对应的短的键绑定
;;           如l 对应 `C-xvl' 查看日志
;;            `=', `+'`l', `i',`v'
;;           对多文件进行操作时,文件必须处于相同的状态,或者兼容态
;;            (added, modified and removed states 为兼容态
;;}}}
;;{{{ `C-xvg' vc-annotate 查看某个特定文件自始至终的变化
;;位于info 的Emacs>>Maintaining>>Version Control>>Old Revisions
;; C-x v g     vc-annotate -- show when each line in a tracked file was added and by whom
;;`C-uC-xvg' 则不是对默认的当前buffer进行操作,让你选择?
;;某一个特定版本文件的内容在不同的版本都有增减,而vc-annotate 用不同的颜色表示文件中不同
;;代码的历史, 红色的部分是最近才添加的,蓝色的则是最初就加入的内容,中间过程添加的代码也会用不同的颜色进行标记

;;*Annotate* buffer 的格式是:右边是代码,左边则是右边每一行代码所对应的版本,也就是代表了这一行代码是在哪个版本
;;的时候添加进来的.
;;进入Annotate mode 后还可以进行其他操作

;;p  对此文件的上一个版本进行vc-annotate操作
;;n  ........下........................
;;j 对`当前行' 所对应的版本的当前文件进行vc-annotate操作,比如当前行的代码是在版本号为3的时候添加进来的,
;;  则此操作会对此文件版本为3时的内容进行vc-annotate操作
;;w  通过p n j 操作后有可能你忘记了当前buffer中的内容到底是哪个版本的,可以用w 回到最初运行`C-xvg' 时的版本
;;   w 表示working revision 其实就是最新的一个版本

;;a `当前行' 则相当于先进行j操作,然后进行p操作,其作用是查看还没有加入当前行的内容时的前一个版本对应的文件是什么样子的
;;f `当前行' file跟j类似,不过不进行vc-annotate操作,仅显示当前行对应版本的文件内容
;;d `当前行' diff操作,当前行对应一个版本,用此版本与它的前一个版本进行diff操作,即查看到底这一次的版本变化有哪些变化
;;D `当前行' diff操作,与d类似,不过此次显示的不仅是当前文件的diff,而是此次提交所有文件的变化.
;;l `当前行' log 显示日志 ,显示当前行所对应的版本 相应的日志
;;v 默认右边代码左边版本号,v 则toggle 是否显示版本号,用处不大.
;;}}}

;; (C-x C-q    by default, C-x C-q is no longer bound, so it's better to use the above binding)
;; C-x v c     vc-cancel-version -- delete the latest revision (often it makes more sense to look at an old revision
;;             and check that in again!) 回滚操作
;;             git svn 现在还不支持,

;; C-x v s     vc-create-snapshot -- tag all the files with a symbolic name ,
;;             创建标签tag ,git 相当于git tag newTAGname
;; C-x v r     vc-retrieve-snapshot -- undo checkouts and return to a snapshot with a symbolic name
;;             git 相当于git checkout newTAGname ,会处于一个无名的branch 此时work dir中的文件都是tagName时的版本

;; C-x v a     vc-update-change-log -- update ChangeLog

;; C-x v m     vc-merge
;; C-x v h     vc-insert-headers

;;{{{ VC-LOG

;;关于*VC-LOG*  进入这个buffer 后
;; `C-cC-c' 完成日志的填写,commit.
;; `C-cC-f' 显示这次提交有哪些文件作了修改,不过如果是在直接编辑某个work file时执行`C-xvv' 则显示的仅是当前work file
;;          用处不大,如果是在`C-xvd'进入vc-dir模式进行多文件操作后,执行`C-xvv'进入vc-log则`C-cC-f'显示的才是操作的多文件
;; `C-cC-d' 显示diff.
;;  在minibuffer中我们可以用`M-p'前一个 `M-n'下一个 `M-r'向后搜索 `M-s'向前搜索 等查看以往的历史,
;;  同样在*VC-LOG*中也可以查看以往的提交历史.操作相同.
;;}}}

;;}}}
;;{{{ merge 文件的合并
;; `M-x emerge-files'  ;;比较两个文件,
;; `M-x emerge-files-with-ancestor';;比较两个文件,它们都是从某一个祖先文件变化来的.
;; `M-x emerge-buffers'
;; `M-x emerge-buffers-with-ancestor'
;;运行以上命令会打开三个buffer:A,B and *merge*, merge后可以`C-xC-w'保存merge后的文件
;;*merge* buffer中默认的内容是A的,可以用n ,p 依次列出与B文件的不同之处,不同之处会用
;;     vvvvvvvvvvvvvvvvvvvv
;;     TEXT THAT DIFFERS
;;     ^^^^^^^^^^^^^^^^^^^^
;;a,b            字母v或^夹在中间,此时可以用a 或者b按键 ,决定merge后的文件是选用A中的内容还是B中的内容
;;n,p         选中之后v^ 字样就会消失,然后可以继续用n ,p显示下一处或上一处的不同(diff),直至显示完所有的不同
;;            merge 就算完毕`C-xC-w'保存后即可.`C-]'则放弃合并.
;;`C-uNj'     除了n p命令外`C-uNj' 可以跳转到第N个diff处,N是数字
;;'.'         则是显示光标当前位置的diff(用vvv^^^字样括起来,)没有不同之处则不显示`C-u.'同"."不过
;;            当前位置如无diff则显示第近处的diff.
;; q          退出
;;`C-]'       退出abort
;; e          过入"Edit mode" ,此时可以手动输入内容,进入"Edit mode"后上面的命令依然有效不过要加`C-cC-c'前缀
;;`C-cC-cf'   回到"Fast mode" 与e命令相反,
;; l          recenter 同`C-l' 重新调整三个buffer中的内容,
;; `da'       选择A文件的内容作容默认"*merge*"buffer中的内容
;; `db'       同`da'
;;  `ca' `cb' copy A或B中的内容是kill ring
;; `ia' `ib'   插入A(B)中的当前diff到光标处
;; m           选中diff中的内容,put the 'marker' and 'point' around diff.
;; 四个滚动窗口的命令
;; `^'         Scroll all three windows down (like `M-v').
;; `v'         Scroll all three windows up (like `C-v').
;; `<'         Scroll all three windows left (like `C-x <').
;; `>'         Scroll all three windows right (like `C-x >').
;;
;; `|'         Reset horizontal scroll on all three windows.

;; `x1'       收缩"merge" 窗口只显示一行,(`C-ul'恢复)

;;`xc'        combine合并两处的diff内容
;;`xf'       显示正存比较的两个文件的名字,(`C-ul'恢复)

;;`xj'       合并当前diff与下一个diff ,`C-uxj'则是与前一个进行合并

;;`xs'         分解当前diff为两个diff.

;;`xt'        Trim identical lines off the top and bottom of the difference.
;;            Such lines occur when the A and B versions are identical but
;;            differ from the ancestor version.




;;}}}
;;{{{ diff
   ;;{{{ 关于diff ,patch 补丁的使用

;;有一个旧的文件a , 你编辑了a将这个编辑后的文件命令为b
;;现在想生成一个补丁文件,将这个补丁文件应用到a 上,就会变成b
;;生成这个补丁文件的命令是diff
;; diff -ubB a b>a.patch  (-u指定生成的格式,-b忽略空格-B忽略空格引起的差异)
;;这样在当前目录下会生成a.patch的文件,
;;这样你可以将你的补丁文件发布到网上,别人拿到你的补丁及a文件 放在同一个目录
;;patch -p0 <a.patch a  这样打上补丁后,a中的内容就与b中的内容无异
;;可是你后悔了,不起打这个补丁,想就a恢复原样
;;patch -R <a.patch a  这样a文件就变成了最初的模样了.
;;diff mode 像Compilation mode 一样,可以用C-x` `C-cC-c' 在各个条目间跳转

;;}}}
(setq diff-switches "-ubB")
;;注意linux下的diff a b ,其中a 是旧文件,b是新文件
;;在Emacs中`M-x' diff  先就你选择的是b然后才是a
;; 一个hunk 就是一处: @@ -130,7 +130,7 @@  

;; `M-n' 跳到下一个差异处(hunk)
;; `M-p' 跳到上一个差异处(hunk)
;; `M-}' 跳到下一个文件 (在多文件补丁中)
;; `M-{'
;; `M-k' 删除这个(hunk)
;; `M-K' 删除关于这个文件的(hunk)
;;`C-cC-a' 将当前的hunk打到旧文件中 `diff-apply-hunk'
;;          `C-u' 则进行相反的操作,注意如果这个hunk已经打过
;;          再运行`C-cC-a'会问你是否reverse反向操作

;;`C-cC-b' 高亮显示到时底有哪些删减`diff-refine-hunk'

;;`C-cC-c' 查看旧的文件`diff-goto-source'
;;`C-cC-e' 起一个Ediff会话`diff-ediff-patch'
;;`C-cC-n' `diff-restrict-view' 就是Narrowing ,只显示当前hunk的内容`C-xnw' 相反操作widen之
;;         `C-u',则对文件而非hunk
;;`C-cC-r'  `diff-reverse-direction' 交换新老文件(diff a b 变成diff b a)
;;     

;; `C-c C-s'
;;      Split the hunk at point (`diff-split-hunk').  This is for manually
;;      editing patches, and only works with the "unified diff format"
;;      produced by the `-u' or `--unified' options to the `diff' program.
;;      If you need to split a hunk in the "context diff format" produced
;;      by the `-c' or `--context' options to `diff', first convert the
;;      buffer to the unified diff format with `C-c C-u'.

;; `C-c C-d'
;;      Convert the entire buffer to the "context diff format"
;;      (`diff-unified->context').  With a prefix argument, convert only
;;      the text within the region.
;; `C-c C-u'
;;      Convert the entire buffer to unified diff format
;;      (`diff-context->unified').  With a prefix argument, convert
;;      unified format to context format.  When the mark is active, convert
;;      only the text within the region.

;; `C-c C-w' 重新生成diff文件,此次忽略空格
;;      Refine the current hunk so that it disregards changes in whitespace
;;      (`diff-refine-hunk').

;; `C-x 4 A'
;;      Generate a ChangeLog entry, like `C-x 4 a' does (*note Change
;;      Log::), for each one of the hunks
;;      (`diff-add-change-log-entries-other-window').  This creates a
;;      skeleton of the log of changes that you can later fill with the
;;      actual descriptions of the changes.  `C-x 4 a' itself in Diff mode
;;      operates on behalf of the current hunk's file, but gets the
;;      function name from the patch itself.  This is useful for making
;;      log entries for functions that are deleted by the patch.
;; `M-x diff-show-trailing-whitespaces RET'
;;      Highlight trailing whitespace characters, except for those used by
;;      the patch syntax (*note Useless Whitespace::).
;;}}}
;;{{{ Ediff
;;Ediff常用的命令
;; `ediff-files' `ediff-current-file' `ediff-directories'
;; `edir-revisions' `edir-merge-revisions' `ediff-show-registry'
;; `edir-merge-revisions-with-ancestor'
;; `ediff-revision' `ediff-patch-file'
;; `ediff-merge-files' `ediff-merge-files-with-ancestor'
;; `ediff-merge-directories' `ediff-merge-revisions'

;; `v'            scroll A and B
;; `V'            scroll the buffers down
;; `wd'           write diff to a file
;; `wb' `wc'`wa'  Saves buffer A, if it was modified.
;; `a'  `b' `c'   把A中相前的的difference region copy到B中相应相应位置,`rb' 可以恢复B到原状
;; `ab'           同`a'不过是在3个文件对比的时候
;; `p' `n'         选中上一个(下一个)difference region
;; `j' `-j' `Nj';; `n' 与'p'是相对跳转,此为绝对跳转,N是数字,表示跳到第N个difference region,
;; -j表示跳到跳后
;; `ga'              将A中跳(point)最近的difference region选中
;; `!'               Recomputes the difference regions ,防止因为修改导致高亮出错
;;  `m'             调整窗口在大小尽量大(toggle
;;   `|'            toggle 是水平还是垂直摆放两个window
;;   'r'            重置merge中的内容到未修改前(只在merge会话中有用)
;;   `ra' `rb' `rc' ::: `a' `b' `c' undo操作 (只在compare会话中有用)
;;   `##'          跳过只因 空格TAB不同引起的difference
;;   `#c'          跳过只因 大小写不同引起的difference
;;`#h' `#f'       处理因为大量相同的变量替换引起的difference
;;`A' `B' `C'    toggle Read-Only in A(B,C)
;; ~             交换A B窗口
;; i            显示当前进行的Ediff Session的信息,如在对哪两个文件进行对比等
;; D             显示diff命令的输出结果,生成diff文件
;; R             显示所有可用的Ediff Session,基本就是历史浏览`ediff-show-registry'
;; z            暂时挂起,(关闭相关窗口,) 可以`R' 进行恢复会话
;; q               quit.
;;`/' Displays the ancestor file during merges.
;; s            收缩merge窗口(toggle) ,`4s' 则增大4行
;; +            合并A B 的当前 difference region
;; =           启用一个新的子会话对当前difference region进行对比














;;}}}

;;}}}
;;{{{ 将 speedbar  在同一个frame 内显示

(setq-default sr-speedbar-width-x 36)
(setq-default sr-speedbar-width-console 36)
(require 'sr-speedbar)
;(setq-default sr-speedbar-width-x 45)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(setq sr-speedbar-auto-refresh t) ;;default is t
(setq sr-speedbar-right-side nil)
;
;sr-speedbar-refresh-toggle
 ;; `sr-speedbar-width-x'
;; `sr-speedbar-width-console'
;; `sr-speedbar-max-width'
;; `sr-speedbar-delete-windows'
;;      Whether delete other window before showing up.
;; `sr-speedbar-skip-other-window-p'
;;      Whether skip `sr-speedbar' window when use
;;      command `other-window' select window in cyclic ordering of windows.
;;      Control status of refresh speedbar content.
;;      Puts the speedbar on the right side if non-nil (else left).
;;
;; All above setup can customize by:
;;      M-x customize-group RET sr-speedbar RET
;;

;;}}}
;;{{{ shell emacs 之间快速切换
;(autoload 'term-toggle-cd "term-toggle" "Toggles between the *shell* buffer and whatever buffer you are editing." t)
;(global-set-key [M-f1] 'term-toggle-cd)
;;(autoload 'shell-toggle-cd "shell-toggle" "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
;;(global-set-key [C-f1] 'shell-toggle-cd)
;;(autoload 'shell-toggle-cd "shell-toggle" "Toggles between the *shell* buffer and whatever buffer you are editing." t)
;;(global-set-key [M-f1] 'shell-toggle-cd)
  (autoload 'term-toggle "term-toggle" 
   "Toggles between the *terminal* buffer and whatever buffer you are editing."
   t)
  (autoload 'term-toggle-cd "term-toggle" 
   "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
  (global-set-key [M-f1] 'term-toggle)
  (global-set-key [C-f1] 'term-toggle-cd)


;;}}}
;;{{{ js2-mode javascript-IDE

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;}}}
;;{{{ smooth-scroll 平滑滚动

(autoload 'scroll-up-1 "smooth-scroll" "" t)
(autoload 'scroll-down-1 "smooth-scroll" "" t)
(autoload 'scroll-right-1 "smooth-scroll" "" t)
(autoload 'scroll-left-1 "smooth-scroll" "" t)
(autoload 'smooth-scroll-mode "smooth-scroll" "" nil )
(smooth-scroll-mode)
(setq smooth-scroll/vscroll-step-size 1)

(global-set-key [(control  down)]  'scroll-up-1)
(global-set-key [(control  up)]    'scroll-down-1)
(global-set-key [(control  left)]  'scroll-right-1)
(global-set-key [(control  right)] 'scroll-left-1)
;;}}}
;;{{{ compile 自动编辑
  ;;{{{ 关于Compilation mode
(setq compilation-ask-about-save nil) ;;编译之前自动保存buffer
(setq compilation-auto-jump-to-first-error t);;编译完成后自动跳到第一个error处
(setq compilation-read-command nil);;不必提示用户输入编译命令

;;"C-x`"  跳到下一个error处(可以在源码及compilation窗口中使用)
;; "C-uC-x`" 从头开始查找error
  ;;}}}
  ;;{{{ joseph_compile_current_el

(defun joseph_compile_current_el()
   (when (and (member major-mode '(emacs-lisp-mode lisp-interaction-mode)))
    (shell-command (format
           (concat " emacs  -batch    -l "
                   joseph_joseph_install_path
                   "joseph_byte_compile_include.el  -f batch-byte-compile %s ")
           (buffer-file-name))))
  ;; (when (and (member major-mode '(emacs-lisp-mode lisp-interaction-mode))
  ;;            (buffer-file-name))
  ;;   (when folding-mode
  ;;     (folding-open-buffer))
  ;;       (byte-compile-file (buffer-file-name))
;;    )
)
(add-hook 'after-save-hook 'joseph_compile_current_el)

(defun joseph_compile_current_el_outside()
  (let ((command))
    (setq command
          (format
           (concat " emacs  -batch    -l " joseph_joseph_install_path "joseph_byte_compile_include.el  -f batch-byte-compile %s ")
           (buffer-file-name)))
    (with-current-buffer (get-buffer-create "*joseph_compile_current_el*")
      (insert (shell-command-to-string command)))
    (switch-to-buffer (get-buffer-create "*joseph_compile_current_el*"))))

;;}}}
  ;;{{{ compile-dwim
;;(require 'compile-dwim)
(autoload 'compile-dwim-run "compile-dwim" "doc" t)
(autoload 'compile-dwim-compile "compile-dwim" "doc" t)

(global-set-key "\C-zs" 'compile-dwim-compile)
(global-set-key "\C-zr" 'compile-dwim-run)

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

;;}}}
;;}}}
;;{{{ hide-region.el hide-lines.el
;;(require 'hide-region)
(autoload 'hide-region-hide "hide-region" "hide region" t)
(autoload 'hide-region-unhide "hide-region" "unhide region" t)
(global-set-key (kbd "C-z h ") (quote hide-region-hide));;隐藏选区
(global-set-key (kbd "C-z H ") (quote hide-region-unhide));;重现选区

(autoload 'hide-lines "hide-lines" "Hide lines based on a regexp" t)
;;隐藏符合正则表达式的行，或只现示符合的行
;; (defun hide-lines (&optional arg)
;;   "Hide lines matching the specified regexp.
;; With prefix arg: Hide lines that do not match the specified regexp"
;;   (interactive "p")
;;   (if (> arg 1)
;;       (call-interactively 'hide-matching-lines)
;;       (call-interactively 'hide-non-matching-lines)
;;       ))

(global-set-key (kbd  "C-z l") 'hide-lines);;;All lines matching this regexp will be ;; hidden in the buffer
;;(define-key dired-mode-map "z" 'hide-lines)
;;加一个前缀参数C-u C-z l  则 只显示符合表达式的行
(global-set-key (kbd "C-z L" ) 'show-all-invisible);; 显示隐藏的行

;;}}}
;;{{{ auto-document 为el文件自动生成doc
(autoload 'auto-document "auto-document" "generate doc for el files" t)
(autoload 'auto-document-maybe "auto-document" "generate doc for el files" )

;;前提是 文档中必须有";;; Commentary:" 然后它会在其后自动插入相应的内容
;;如 ";;; Customizable Options:"
;;使用方法,在el文件中运行`auto-document'命令
;;(require 'auto-document)
;; If you want to update auto document before save, add the following.
;;如果想要在文件保存的时候自动插入及更新相应的文档内容,可以加入这个hook
 (add-to-list 'before-save-hook 'auto-document-maybe)

;;}}}
;;{{{ auto-install

(require 'auto-install)
(setq auto-install-save-confirm nil)
(setq auto-install-directory "~/.emacs.d/site-lisp/auto-install/")

;;{{{ anything-auto-install

(require 'anything-auto-install)
;;  `anything-auto-install-from-emacswiki'
;;    Launch anything with auto-install separately.
;;  `anything-auto-install-from-library'
;;    Update library with `anything'.
;;  `anything-auto-install-batch'
;;    Batch install elisp libraries.
;;  `anything-auto-install'
;;    All-in-one command for elisp installation.

;;}}}

;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/anything-auto-install.el")
;; (auto-install-batch "icicles")
;;;;icicles中有文件依赖ring+.el,手动下载之
;; (auto-install-from-url "http://www.emacswiki.org/emacs/download/ring+.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/doremi-frm.el")
;;;;调色板palette
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/hexrgb.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/palette.el")
(require 'palette)

;;}}}
;;{{{关于 关闭讨厌的 buffer window 
  ;;{{{ bury some boring buffers,把讨厌的buffer移动到其他buffer之后 

(defun  bury-boring-buffer()
  (let ((cur-buf-name (buffer-name (current-buffer)))
        (boring-buffers '("*Completions*" "*SPEEDBAR*")))
    (mapc '(lambda(boring-buf)
             (unless (equal cur-buf-name boring-buf)
               (when (buffer-live-p (get-buffer boring-buf))
               (bury-buffer boring-buf))))
          boring-buffers)
    ))
;;尤其是使用icicle时,经常关闭一个buffer后,默认显示的buffer是*Completions*
;;所以在kill-buffer时,把这些buffer放到最后
(add-hook 'kill-buffer-hook 'bury-boring-buffer)

;;}}}
  ;;{{{ 自动清除长久不访问的buffer
(require 'midnight)
;;kill buffers if they were last disabled more than this seconds ago
;;如果一个buffer有30min没被访问了那么它会被自动关闭
(setq clean-buffer-list-delay-special (* 60  30));;30*60s
;;有一个定时器会每隔一分钟检查一次,哪些buffer需要被关闭
(defvar clean-buffer-list-timer nil
  "Stores clean-buffer-list timer if there is one.
 You can disable clean-buffer-list by
 (cancel-timer clean-buffer-list-timer).")

;; run clean-buffer-list every 120s
(setq clean-buffer-list-timer (run-at-time t 3000 'clean-buffer-list))

;; kill everything, clean-buffer-list is very intelligent at not killing
;; unsaved buffer.
;;这里设成匹配任何buffer,任何buffer都在auto kill之列,
(setq clean-buffer-list-kill-regexps '("^.*$"))

;;下面的buffer是例外,它们不会被auto kill
;;这样的buffer不会被清除
;; * currently displayed buffers
;; * buffers attached to processes, and
;; * internal buffers that were never displayed
;; * buffers with files that are modified

(setq clean-buffer-list-kill-never-buffer-names
      '("*scratch*" "*Messages*" "*server*"))


(setq clean-buffer-list-kill-never-regexps
      '("^ \\*Minibuf-.*\\*$")
      )
;;自动清除某些buffer时,会输出一此很长的信息,我认为没用,暂时重新定义了`message'
(defadvice clean-buffer-list (around no-message-output activate)
  "Disable `message' when wrapping candidates."
  (flet ((message (&rest args)))
    ad-do-it)
  )

;;}}}
  ;;{{{popwin.el 把 *Help* *Completions* 等window 可以用`C-g' 关闭掉
;;popup window  相当于临时弹出窗口
;; (require 'popwin)
;; (setq display-buffer-function 'popwin:display-buffer)
;; (setq popwin:special-display-config
;;   '(("*Help*")
;;     ("*Completions*" :noselect t)
;;     ("*compilation*" :noselect t)
;;     ("*Occur*" :noselect t)
;;     ("^\\*Anything" :regexp t :noselect t)
;;     ("^\\*Customise" :regexp t :noselect t)
;;     ))
;;}}}
  ;;{{{ close-boring-windows with `C-g'
(defvar boring-window-modes
  '(help-mode compilation-mode log-view-mode log-edit-mode ibuffer-mode)
  )

(defvar boring-window-bof-name-regexp
  (rx (or
    "\*Anything"
    "\*vc-diff\*"
    "\*vc-change-log\*"
    "\*VC-log\*"
    "\*sdcv\*"
    )))

(defun close-boring-windows()
  "close boring *Help* windows with `C-g'"
  (let ((opened-windows (window-list)))
    (dolist (win opened-windows)
      (set-buffer (window-buffer win))
      (when (or
          (memq  major-mode boring-window-modes)
          (string-match boring-window-bof-name-regexp (buffer-name))
          )
        (if (>  (length (window-list)) 1)
            (kill-buffer-and-window)
          (kill-buffer)
          )))))

(defadvice keyboard-quit (before close-boring-windows activate)
  (close-boring-windows)
  (when (active-minibuffer-window)
  (anything-keyboard-quit)
  (abort-recursive-edit)
  ))

;;}}}
;;}}}
;;{{{ highlight-parentheses 高亮显示括号

(require 'highlight-parentheses)
;; (add-hook 'highlight-parentheses-mode-hook
;;           '(lambda ()
;;              (setq autopair-handle-action-fns
;;                    (append
;; 					(if autopair-handle-action-fns
;; 						autopair-handle-action-fns
;; 					  '(autopair-default-handle-action))
;; 					'((lambda (action pair pos-before)
;; 						(hl-paren-color-update)))))))


(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(setq hl-paren-background-colors (quote ("LightCoral" "LightBlue" "LemonChiffon" "purple")))
(setq hl-paren-colors (quote ("Goldenrod" "cyan" "green" "orange")))

(global-highlight-parentheses-mode t)

;;}}}
;;{{{ 自动补全括号等
(require 'joseph-autopair)
(joseph-autopair-toggle-autopair)
;;}}}
;;{{{ linkd-mode 文档用的超链接

;;读取icicle的文档时可以跳转
(autoload 'linkd-mode "linkd" "doc" t)
;; enable it by (linkd-mode) in a linkd-mode 
; icicles-doc1.el 文档用它进行超链接

;;}}}
(require 'joseph-icicle)
;;{{{  注释掉的

   ;;{{{  Java中的一个小扩展，在行尾补全大括号

;;输入左大括号，会在行尾添加{，而不是当前位置,并且另起一行补上}
;; (defun java_append_bracket(&optional arg)
;;   (interactive "*p")
;;   (let ( (begin nil) (end nil) (line_str) )
;;       (beginning-of-line) (setq begin (point)) ;;记录行首位置
;;       (end-of-line) (setq end (point)  )  ;;记录行尾位置
;;       (setq line_str (buffer-substring begin end)) ;; 截取整行内容
;;       (if (or (string-match "//" line_str) (string-match "/\\*" line_str )  ) ;;;如果所在行是注释，则行为正常，（判断并不严格）
;;           (insert "{")
;;            (progn 
;;             (end-of-line)
;;             (insert "{")
;;             (newline-and-indent)
;;             (newline)
;;             (insert "}")
;;             (setq end (point))
;;             (forward-line -1)
;;             (indent-according-to-mode)
;;             (indent-region begin end )
;;             )
;;     )
;;     )
;;   )

;;}}}
   ;;{{{ 关于autopair skeleton

;; (require 'skeleton)
;; (setq skeleton-pair t)
;; (setq skeleton-pair-alist
;;       '((?\( _ ?\))
;;         (?[  _ ?])
;;         (?{ \n > _ \n ?} >)
;;         (?\' _ ?\')
;;         (?\" _ ?\")))

;; (defun autopair-insert (arg)
;;   (interactive "P")
;;   (let (pair)
;;     (cond
;;      ((assq last-command-char skeleton-pair-alist)
;;       (autopair-open arg))
;;      (t
;;       (autopair-close arg)))))

;; (defun autopair-open (arg)
;;   (interactive "P")
;;   (let ((pair (assq last-command-char
;;                     skeleton-pair-alist)))
;;     (cond
;;      ((and (not mark-active)
;;            (eq (car pair) (car (last pair)))
;;            (eq (car pair) (char-after)))
;;       (autopair-close arg))
;;      (t
;;       (skeleton-pair-insert-maybe arg)))))

;; (defun autopair-close (arg)
;;   (interactive "P")
;;   (cond
;;    (mark-active
;;     (let (pair open)
;;       (dolist (pair skeleton-pair-alist)
;;         (when (eq last-command-char (car (last pair)))
;;           (setq open (car pair))))
;;       (setq last-command-char open)
;;       (skeleton-pair-insert-maybe arg)))
;;    ((looking-at
;;      (concat "[ \t\n]*"
;;              (regexp-quote (string last-command-char))))
;;     (replace-match (string last-command-char))
;;     (indent-according-to-mode))
;;    (t
;;     (self-insert-command (prefix-numeric-value arg))
;;     (indent-according-to-mode))))

;; (defadvice delete-backward-char (before autopair activate)
;;   (when (and (char-after)
;;              (char-before)
;;              (or  (eq this-command 'delete-backward-char)
;;                   (eq this-command 'backward-delete-char-untabify))
;;              (eq (char-after)
;;                  (car (last (assq (char-before) skeleton-pair-alist)))))
;;     (delete-char 1))
;;   (when (and (char-before (- (point) 1))
;;              (or  (eq this-command 'delete-backward-char)
;;                   (eq this-command 'backward-delete-char-untabify))
;;              (eq (char-before)
;;                  (car (last (assq (char-before (- (point) 1)) skeleton-pair-alist)))))
;;     (backward-char 1) (delete-char 1))
;;   )
;; (defadvice delete-char (before autopair activate)
;;   (when (and (char-before)
;;              (char-after)
;;              (eq this-command 'delete-char)
;;              (eq (char-after)
;;                  (car (last (assq (char-before) skeleton-pair-alist)))))
;;     (backward-delete-char-untabify 1))
;;   (when (and (char-after (+ 1 (point)))
;;              (eq this-command 'delete-char)
;;              (eq (char-after (+ 1 (point)))
;;                  (car (last (assq (char-after) skeleton-pair-alist)))))
;;     (forward-char ) (delete-backward-char 1)))

;; (defun joseph-set-autopair-4-cc ()
;;   (local-set-key "("  'autopair-insert)
;;   (local-set-key ")"  'autopair-insert)
;;   (local-set-key "["  'autopair-insert)
;;   (local-set-key "]"  'autopair-insert)
;;   (local-set-key "{"  'autopair-insert)
;;   (local-set-key "}"  'autopair-insert)
;;   (local-set-key "\"" 'autopair-insert)
;;   (local-set-key "\'" 'autopair-insert)
;;   )
;; (add-hook 'c-mode-hook 'joseph-set-autopair-4-cc)
;; (add-hook 'java-mode-hook 'joseph-set-autopair-4-cc)


;; (defun joseph-set-autopair-4-lisp ()
;;   (local-set-key "("  'autopair-insert)
;; ;  (local-set-key ")"  'autopair-insert)
;;   (local-set-key "["  'autopair-insert)
;;   (local-set-key "]"  'autopair-insert)
;;   (local-set-key "\"" 'autopair-insert)
;;   )

;; (add-hook 'emacs-lisp-mode-hook 'joseph-set-autopair-4-lisp)
;; (add-hook 'lisp-mode-hook 'joseph-set-autopair-4-lisp)
;; (add-hook 'lisp-interaction-mode-hook 'joseph-set-autopair-4-lisp)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;java c c++里自动补全() {} []
;;  (defun my-java-mode-auto-pair ()
;;   (interactive)
;;   (make-local-variable 'skeleton-pair-alist)
;;   (setq skeleton-pair-alist  '(
;;                    (?\(  _ ")")
;;                    (?\[  _ "]")
;; ;                   (?{ \n > _ \n ?} >)
;; ))
;;  (setq skeleton-pair t)
;; (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;; (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
;; ;(add-hook 'java-mode-hook 'my-java-mode-auto-pair)
;; ;(add-hook 'jde-mode-hook 'my-java-mode-auto-pair)
;; (add-hook 'emacs-lisp-mode-hook 'my-java-mode-auto-pair)

;;}}}
   ;;{{{ 快速输入括号
;;(require 'autopair)
;;(autopair-global-mode)
;;(define-key ac-mode-map "\r" 'ac-complete)
 ;; (defun electric-pair ()
 ;;      "If at end of line, insert character pair without surrounding spaces.
 ;;    Otherwise, just insert the typed character."
 ;;      (interactive)
 ;;      (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))
 ;;    (add-hook 'java-mode-hook
 ;;              (lambda ()
 ;;                (define-key java-mode-map "\"" 'electric-pair)
 ;;                (define-key java-mode-map "\'" 'electric-pair)
 ;;                (define-key java-mode-map "(" 'electric-pair)
 ;;                (define-key java-mode-map "[" 'electric-pair)
 ;;                (define-key java-mode-map "{" 'electric-pair)))

;;(require 'electric-dot-and-dash)
;; (global-set-key "," 'electric-dot-and-dash-dot)
;; (global-set-key "." 'electric-dot-and-dash-dash)
;;}}}
   ;;{{{ javascript.el
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
;; (autoload 'javascript-mode "javascript" nil t)
;;}}}
   ;;{{{ smart-compile

;; ;; 这两个命令特别好用，可以根据文件的后缀或者 mode 判断调用的 compile
;; ;; 命令。当目录下有 makefile 自动使用 make 命令。
;; (require 'smart-compile+)
;; (global-set-key (kbd "C-z r") 'smart-run)
;; (global-set-key (kbd "C-z s") 'smart-compile)
;; ;; smart compile 是一个非常好用的 elisp。它的设置也相当简单。只要对相应的后缀
;; ;; 定义 compile 和 run 的命令就行了。格式也列在下面。
;; ;; smart-executable-alist 是用来在调用 smart-run 时是否需要 compile。所以
;; ;; 脚本一般都要加入到这个列表中。除非你只用 smart-compile 运行。

;; ;(require 'smart-compile nil t)
;; ;;   %F  absolute pathname            ( /usr/local/bin/netscape.bin )
;; ;;   %f  file name without directory  ( netscape.bin )
;; ;;   %n  file name without extention  ( netscape )
;; ;;   %e  extention of file name       ( bin )
;; (setq smart-compile-alist
;;       '(("\\.c$"          . "g++ -o %n %f")
;;         ("\\.[Cc]+[Pp]*$" . "g++ -o %n %f")
;;         ("\\.java$"       . "javac %f")
;;         ("\\.f90$"        . "f90 %f -o %n")
;;         ("\\.[Ff]$"       . "f77 %f -o %n")
;;         ("\\.mp$"         . "runmpost.pl %f -o ps")
;;         ("\\.php$"        . "php %f")
;;         ("\\.tex$"        . "latex %f")
;;         ("\\.l$"          . "lex -o %n.yy.c %f")
;;         ("\\.y$"          . "yacc -o %n.tab.c %f")
;;         ("\\.py$"         . "python %f")
;;         ("\\.sql$"        . "mysql < %f")
;;         ("\\.ahk$"        . "start d:\\Programs\\AutoHotkey\\AutoHotkey %f")
;;         ("\\.sh$"         . "./%f")
;;         (emacs-lisp-mode  . (joseph_compile_current_el))))
;; (setq smart-run-alist
;;       '(("\\.c$"          . "./%n")
;;         ("\\.[Cc]+[Pp]*$" . "./%n")
;;         ("\\.java$"       . "java %n")
;;         ("\\.php$"        . "php %f")
;;         ("\\.m$"          . "%f")
;;         ("\\.scm"         . "%f")
;;         ("\\.tex$"        . "dvisvga %n.dvi")
;;         ("\\.py$"         . "python %f")
;;         ("\\.pl$"         . "perl \"%f\"")
;;         ("\\.pm$"         . "perl \"%f\"")
;;         ("\\.bat$"        . "%f")
;;         ("\\.mp$"         . "mpost %f")
;;         ("\\.ahk$"        . "start d:\\Programs\\AutoHotkey\\AutoHotkey %f")
;;         ("\\.sh$"         . "./%f")))
;; (setq smart-executable-alist
;;       '("%n.class"
;;         "%n.exe"
;;         "%n"
;;         "%n.mp"
;;         "%n.m"
;;         "%n.php"
;;         "%n.scm"
;;         "%n.dvi"
;;         "%n.py"
;;         "%n.pl"
;;         "%n.ahk"
;;         "%n.pm"
;;         "%n.bat"
;;         "%n.sh"))

;;}}}
   ;;{{{ ca2+的配置
;; (eval-and-compile
;;   (add-to-list 'load-path
;;                (expand-file-name (concat joseph_site-lisp_install_path "ca2/"))) )
; (load "ca2+init" )

;;}}}
   ;;{{{ company   complete anything 相关配置

;;company is a complete tools 
;Enable company-moxde with M-x company-mode.  Completion will start automatically after you type a few letters.  
;;Use M-n, M-p, <tab> and <tab> to complete.  Search through the completions with C-s, C-r and C-o.
;; (add-to-list 'load-path
;;              (expand-file-name (concat joseph_site-lisp_install_path "elpa/company-0.5/")))
;; (autoload 'company-mode "company" nil t)
;; (add-hook 'java-mode-hook '(lambda () (company-mode)))
;; (add-hook 'emacs-lisp-mode-hook  '(lambda ()   (company-mode)))
;; (setq company-idle-delay 0)


;; (defvar company-active-map
;;   (let ((keymap (make-sparse-keymap)))
;;     (define-key keymap "\e\e\e" 'company-abort)
;;     (define-key keymap "\C-g" 'company-abort)
;;     (define-key keymap (kbd "M-n") 'company-select-next)
;;     (define-key keymap (kbd "M-p") 'company-select-previous)
;;     (define-key keymap (kbd "<down>") 'company-select-next)
;;     (define-key keymap (kbd "<up>") 'company-select-previous)
;;     (define-key keymap [down-mouse-1] 'ignore)
;;     (define-key keymap [down-mouse-3] 'ignore)
;;     (define-key keymap [mouse-1] 'company-complete-mouse)
;;     (define-key keymap [mouse-3] 'company-select-mouse)
;;     (define-key keymap [up-mouse-1] 'ignore)
;;     (define-key keymap [up-mouse-3] 'ignore)
;;     (define-key keymap "\C-m" 'company-complete-selection)
;;     (define-key keymap "\t" 'company-complete-common)
;;     (define-key keymap (kbd "<f1>") 'company-show-doc-buffer)
;;     (define-key keymap "\C-w" 'company-show-location)
;;     (define-key keymap "\C-s" 'company-search-candidates)
;;     (define-key keymap "\C-\M-s" 'company-filter-candidates)
;;     (dotimes (i 10)
;;       (define-key keymap (vector (+ (aref (kbd "M-0") 0) i))
;;         `(lambda () (interactive) (company-complete-number ,i))))

;;     keymap)
;;   "Keymap that is enabled during an active completion.")


;; (defun company-my-backend (command &optional arg &rest ignored)
;;   (case command
;;     ('prefix (when (looking-back "foo\\>")
;;                (match-string 0)))
;;     ('candidates (list "foobar" "foobaz" "foobarbaz"))
;;     ('meta (format "This value is named %s" arg))))

;;}}}
   ;;{{{ cedet
;;cvs -d:pserver:anonymous@cedet.cvs.sourceforge.net:/cvsroot/cedet login
;;cvs -z3 -d:pserver:anonymous@cedet.cvs.sourceforge.net:/cvsroot/cedet co -P cedet
;;http://cedet.sourceforge.net/
;(when (featurep 'cedet) (unload-feature 'cedet t))
;(add-to-list 'load-path (concat joseph_site-lisp_install_path "cedet-cvs/"))
;(load (concat joseph_site-lisp_install_path "cedet-cvs/common/cedet.elc"))
;;(require 'cedet)
;;(require 'semantic-ia)
;;;; Enable EDE (Project Management) features
;(global-ede-mode 1)
;(semantic-load-enable-excessive-code-helpers)
;;;;;(semantic-load-enable-semantic-debugging-helpers)
;;;; Enable SRecode (Template management) minor-mode.
;;(global-srecode-minor-mode 1)
;; (defun my-cedet-hook ()
;;   (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;   (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;;   (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;;   (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
;; (add-hook 'c-mode-common-hook 'my-cedet-hook)
;; (add-hook 'java-mode-hook 'my-cedet-hook)


;;}}}
   
   ;;{{{ debug ,显示某个message 是在何处被执行的

;; (defadvice message (before who-said-that activate)
;;     "Find out who said that thing. and say so."
;;     (let ((trace nil) (n 1) (frame nil))
;;       (while (setq frame (backtrace-frame n))
;;         (setq n     (1+ n) 
;;               trace (cons (cadr frame) trace)) )
;;       (ad-set-arg 0 (concat "<<%S>>:\n" (ad-get-arg 0)))
;;       (ad-set-args 1 (cons trace (ad-get-args 1))) ))

;;   (ad-disable-advice 'message 'before 'who-said-that)
;;    (ad-update 'message)

;;}}}
   
   ;;{{{ 相当于vi 中的o命令，在下面插入一新行，并移动光标到新行(作废)

;;熟悉了emacs 后,不再使用 C-e C-j就可以实现
;; (global-set-key (kbd "C-j") 'open-and-move-to-next-line);
;; (defun open-and-move-to-next-line(&optional arg)
;;   (interactive "p")
;;     (end-of-line)
;;     (open-line arg)
;;     (next-line)
;;     (indent-according-to-mode)
;;     )    

;;}}}
   ;;{{{ ;相当于vi 中的O命令，在前面插入一新行，并移动光标到新行(作废)

;; (defun open-and-move-to-pre-line(&optional arg)
;;   (interactive "p")
;;   (beginning-of-line)
;;   (insert "\n")
;;   (forward-line -1)
;;   (indent-relative-maybe)
;;   )
;;(global-set-key (kbd "C-o") 'open-and-move-to-pre-line)
;;(global-unset-key "\C-o")
;;"C-a C-j" "C-e C-j" 可以看出这个函数的作用

;;}}}
   ;;{{{ copy当前行 (作废)
;;joseph_clipboard_and_encoding.el中有关于copy当前行的更好的配置
;; (global-set-key (kbd "C-c C-k") 'copy-lines);
;; (defun copy-lines(&optional arg)
;;     (interactive "p")
;;   (save-excursion
;;         (beginning-of-line)
;;     (set-mark (point))
;;     (next-line  arg)
;;     (beginning-of-line)
;;     (kill-ring-save (mark) (point))
;;     )
;;   )
;;}}}
   
   ;;{{{ joseph-goto-line
;; (defun joseph-goto-line()
;;   "when read a num then (goto-line num ) when read a string+num then goto line by percent "
;;   (interactive)
;;   (let ((readed-string (read-from-minibuffer "Goto line(char+num by percent): "))(percent) )
;;     (if (string-match "^[%a-zA-Z ]+\\([0-9]+\\)$" readed-string )
;;         (let* ((total (count-lines (point-min) (point-max))) (num ))
;;           (setq percent  (string-to-number (match-string-no-properties 1 readed-string)))
;;           (setq num (round (* (/ total 100.0) percent)))
;;           (line-number-at-pos)
;;           (goto-char (point-min))
;;           (forward-line (1- num))
;;            )
;;       (when (string-match "^[0-9]+$" readed-string )
;;           (goto-char (point-min))
;;           (forward-line  (1- (string-to-number readed-string) ))
;;             )
;;     ))
;;   )
(defun joseph-goto-line-by-percent ()
  (interactive)
(let ((readed-string (read-from-minibuffer "Goto line( by percent): "))(percent) )
     (if (string-match "^[ \t]*\\([0-9]+\\)[ \t]*$" readed-string )
        (let* ((total (count-lines (point-min) (point-max))) (num ))
          (setq percent  (string-to-number (match-string-no-properties 1 readed-string)))
          (setq num (round (* (/ total 100.0) percent)))
          (goto-char (point-min) )
          (forward-line (1- num)) )
    ))
  )
(global-set-key "\M-gf"      'joseph-goto-line-by-percent)
(global-set-key [(meta g) (meta f)] 'joseph-goto-line-by-percent)
;(global-set-key [(meta g) (meta f)] 'joseph-goto-line)
(global-set-key [(meta g) (meta g)] 'goto-line)
;;}}}
   ;;{{{ Ctrl+, Ctrl+. 在设定我两个光标间跳转(被joseph-quick-jump取代)
;; (global-set-key [(control ?\.)] 'ska-point-to-register);;;"Ctrl+."  记住当前光标位置，可用"C+," 跳转回去
;; (global-set-key [(control ?\,)] 'ska-jump-to-register)  ;;结合ska-point-to-register使用 "C+," 来加跳转
;; (defun ska-point-to-register()
;;   "Store cursorposition _fast_ in a register.
;;    Use ska-jump-to-register to jump back to the stored position."
;;   (interactive) (let (( zmacs-region-stays t)) (point-to-register 8)) )
;; (defun ska-jump-to-register()
;;   "Switches between current cursorposition and position
;;    that was stored with ska-point-to-register."
;;   (interactive) (let ((tmp (point-marker))( zmacs-region-stays t) ) (jump-to-register 8) (set-register 8 tmp)))
;;}}}
   
   ;;{{{ 显行号 引入linum+.el文件
;;(require 'linum+)
;;(global-linum-mode nil)
;;}}}
   ;;{{{ anything etag 的接合 anything-etag.el

;; ;;此文件并不在anything-config.git 库中
;; (require 'anything-etags)
;; ;;/java/tags/linux-src.tag 默认是当前目录的TAGS文件
;; (setq anything-etags-enable-tag-file-dir-cache t)
;; (setq anything-etags-cache-tag-file-dir "/java/tags/")
;; (setq anything-etags-tag-file-name "linux.tag")
;; (define-key anything-command-map (kbd "e") 'anything-etags-select-from-here);;C-w e
;; (define-key anything-command-map (kbd "C-e") 'anything-etags-select);;C-w C-e
;; changes
;;1. when in-persistent-action , it would open  too much buffers
;;   after users active the persistent action several times ,now this bug is fixed.
;;2 

;;}}}
   ;;{{{ etags-select 
;; (require 'etags-select)
;; (global-set-key "\M-?" 'etags-select-find-tag)
;; (global-set-key "\M-." 'etags-select-find-tag)
;;}}}
   ;;{{{ etags-stack  后退(显示etag的历史)

;; (require 'etags-stack)
;; ;; ;;显示最近etags浏览的历史,可以后退,如果没有浏览历史,则只有一个
;; ;; ;;<<current buffer>>的标签
;; ;;(global-set-key "\M-*" 'etags-stack-show)
;; ;; ;;
;; (define-key etags-stack-mode-map "\C-g" 'etags-stack-quit)

;; ;; (define-key map [(return)] 'etags-stack-go)
;; ;; (define-key map "q" 'etags-stack-quit)

;; ;; ;;An alternative (similar functionality, but with support for multiple tags types such as gtags,
;; ;; ;;and additional operations such as deleting spurious tags) is
;; ;; ;;http://github.org/markhepburn/tags-view

;;}}}
   
   ;;{{{ color 
;(add-to-list 'load-path (concat joseph_site-lisp_install_path "color-theme-6.6.0/"))
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-hober)
;;}}}
   ;;{{{ elpa  a package install

;; (eval-and-compile
;;   (add-to-list 'load-path
;;                (expand-file-name (concat joseph_site-lisp_install_path "elpa/"))) )
;; ;(when (load "package")  (package-initialize)) ;; a tools to downlaod el files
;; (require 'package)(package-initialize)

;;}}}
   ;;{{{ browse-kill-ring+ 的设置 ,关于列出剪切环中的内容以供选择
;;不在使用,因为anything 中提供了基本相同的功能
;;when M-y ,will show a window to select stuff in kill-ring
;;      q      quit
;;  	RET 	插入当前 kill-ring 的内容并关闭 browse-kill-ring 的窗口
;;      tab  切换到下一个 (跟n 相同)
;;  	U 	在原来那个窗口里面执行 Undo 命令
;;  	e 	编辑当前 kill-ring 项，编辑完之后按 C-c C-c 提交修改
;;  	d 	输出当前 kill-ring 项
;;  	n 	往前移动
;;  	p 	往后移动
;;  	s 	往前搜索
;;  	r 	往后搜索
;;  	i 	插入当前 kill-ring 项
;;  	y 	插入当前 kill-ring 项
;;  	a 	在末尾添加当前 kill-ring 项
;;  	b 	在开头插入当前 kill-ring 项
;;  	o 	插入当前 kill-ring 项，并把它提升到 kill-ring 的首部
;;  	u 	同上，但是插入之后关闭 browse-kill-ring 窗口
;;  	x 	插入当前 kill-ring 项，并把它从 kill-ring 中删除
;;  	<mouse-2>  	插入鼠标选中的内容

;(require 'second-sel) ;;second-selection support ,i don't use it now 
;;浏览剪切环的工具，使用方法M-y
;; (when (eq system-type 'gnu/linux)
;;       (add-to-list 'load-path  (concat joseph_site-lisp_install_path "browse-kill-ring/" ))
;;       (require 'browse-kill-ring+)
;;       )


;;}}}
   ;;{{{ tabbar 的设置，注释掉了

;; tabbar
;; (require 'tabbar)
;; (tabbar-mode t)
;; (global-set-key (kbd "M--") 'tabbar-backward-group)
;; (global-set-key (kbd "M-=") 'tabbar-forward-group)
;; (global-set-key (kbd "M-1") 'tabbar-backward)
;; (global-set-key (kbd "M-2") 'tabbar-forward)    
;; (require 'tabbar)
;; (setq tabbar-speedkey-use t)
;; (setq tabbar-speedkey-prefix (kbd "C-z d"))
;; (tabbar-mode 1)

;;}}}
   ;;{{{mmm-mode 多个主major-mode共存

;; ;(add-to-list 'load-path (concat  joseph_root_install_path "mmm-mode-0.4.8"))
;; (require 'mmm-mode)
;; (require 'mmm-auto)
;; (require 'mmm-vars)
;; (require 'mmm-class)
;; (require 'mmm-cmds)
;; (require 'mmm-rpm)
;; (require 'mmm-cweb)
;; (setq mmm-submode-decoration-level 1)
;; ;(setq mmm-global-mode 'maybe)
;; (setq mmm-global-mode t)
;; (mmm-add-mode-ext-class 'html-mode "\\.jsp\\'" 'jsp)
;; ;; (mmm-add-group 'jsp
;; ;;                `((jsp-code
;; ;;                   :submode java
;; ;;                   :match-face (("<%!" . mmm-declaration-submode-face)
;; ;;                                ("<%=" . mmm-output-submode-face)
;; ;;                                ("<%"  . mmm-code-submode-face))
;; ;;                   :front "<%[!=]?"
;; ;;                   :back "%>"
;; ;;                   :insert ((?% jsp-code nil @ "<%" @ " " _ " " @ "%>" @)
;; ;;                            (?! jsp-declaration nil @ "<%!" @ " " _ " " @ "%>" @)
;; ;;                            (?= jsp-expression nil @ "<%=" @ " " _ " " @ "%>" @))
;; ;;                   )
;; ;;                  (jsp-directive
;; ;;                   :submode text-mode
;; ;;                   :face mmm-special-submode-face
;; ;;                   :front "<%@"
;; ;;                   :back "%>"
;; ;;                   :insert ((?@ jsp-directive nil @ "<%@" @ " " _ " " @ "%>" @))
;; ;;                   )))

;; ;; (mmm-add-group
;; ;;      'fancy-html
;; ;;      '(
;; ;;        (html-php-tagged
;; ;;         :submode php-mode
;; ;;         :face mmm-code-submode-face
;; ;;         :front "<[?]php"
;; ;;         :back "[?]>")
;; ;;        (html-css-attribute
;; ;;         :submode css-mode
;; ;;         :face mmm-declaration-submode-face
;; ;;         :front "styleNO=\""
;; ;;         :back "\"")
;; ;;        (jsp-code
;; ;;         :submode java
;; ;;         :match-face (("<%!" . mmm-declaration-submode-face)
;; ;;     		 ("<%=" . mmm-output-submode-face)
;; ;;     		 ("<%"  . mmm-code-submode-face))
;; ;;         :front "<%[!=]?"
;; ;;         :back "%>"
;; ;;         :insert ((?% jsp-code nil @ "<%" @ " " _ " " @ "%>" @)
;; ;;     	     (?! jsp-declaration nil @ "<%!" @ " " _ " " @ "%>" @)
;; ;;     	     (?= jsp-expression nil @ "<%=" @ " " _ " " @ "%>" @))
;; ;;         )
;; ;;        (jsp-directive
;; ;;         :submode text-mode
;; ;;         :face mmm-special-submode-face
;; ;;         :front "<%@"
;; ;;         :back "%>"
;; ;;         :insert ((?@ jsp-directive nil @ "<%@" @ " " _ " " @ "%>" @))
;; ;;         )
;; ;;        ))

;;}}}
   ;;{{{ multi-mode
;(require 'multi-mode)
;; (autoload 'multi-mode "multi-mode" "Allowing multiple major modes in a buffer." t)

;; (defun jsp-mode () (interactive)
;;       (multi-mode 1
;;                   'html-mode
;;                   '("<%--" indented-text-mode)
;;                   '("<%@" indented-text-mode)
;;                   '("<%=" html-mode)
;;                   '("<%" java-mode)
;;                   '("%>" html-mode)
;;                   '("<script" java-mode)
;;                   '("</script" html-mode)
;;                   ))
;;}}}
   ;;{{{ config about ecb ,一个浏览文件的工具
;(Add-to-list 'load-path  (concat joseph_root_install_path "ecb-2.40"))
;;         (require 'ecb)
;;         (require 'ecb-autoloads)
;; (setq ecb-auto-activate t ecb-tip-of-the-day nil);;自动启用ecb
;; ;;;; 各窗口间切换
;; (global-set-key [M-left] 'windmove-left)
;; (global-set-key [M-right] 'windmove-right)
;; (global-set-key [M-up] 'windmove-up)
;; (global-set-key [M-down] 'windmove-down)

;; ;;;; 隐藏和显示ECB窗口
;; (define-key global-map [(control f1)] 'ecb-hide-ecb-windows)
;; (define-key global-map [(control f2)] 'ecb-show-ecb-windows)
;;  ;;;; 使某一ecb窗口最大化
;; (define-key global-map "\C-c1" 'ecb-maximize-window-directories)
;; (define-key global-map "\C-c2" 'ecb-maximize-window-sources)
;; (define-key global-map "\C-c3" 'ecb-maximize-window-methods)
;; (define-key global-map "\C-c4" 'ecb-maximize-window-history)
;; ;;;; 恢复原始窗口布局
;; (define-key global-map "\C-c`" 'ecb-restore-default-window-sizes)
;;}}}
   ;;{{{ sunrise File Manager 基于dired 

;; (eval-and-compile
;;   (add-to-list 'load-path
;;                (expand-file-name (concat joseph_site-lisp_install_path "sunrise/"))) )
;; (require 'sunrise-commander)
;; ;(require 'sunrise-x-buttons) ;;add button for new users, can't use together with x-popviewer
;; (require 'sunrise-x-mirror) ;full read/write access to compressed archives
;; ;;In order to perform your copy or rename operation in the background,
;; ;;the only thing you have to do is add an empty prefix to the usual keystroke
;; ;;C will perform a regular copy in the foreground and C-u C will do it in the background
;; (require 'sunrise-x-loop) ;copying and renaming files in the background
;; ;;;;(require 'sunrise-x-popviewer);making the viewer window float, it show in new frame , i don't like it 

;; (require 'sunrise-x-modeline); show current path on modeline
;; (require 'sunrise-x-tabs) ;;tab brower ,C-j(new) C-k(kill) C-n (next) C-p (prev),
;; (require 'sunrise-x-tree) ;;tree
;; ;;当C-x C-f 打开一个目录时,优先使用sr-dired打开目录
;; (setq find-directory-functions (quote (sr-dired cvs-dired-noselect dired-noselect)))

;; (setq sr-modeline-use-utf8-marks t)
;; (global-set-key "\C-cx" (quote sunrise))
;; (global-set-key "\C-c\C-x" (quote sunrise-cd))
;; ;;sunrise mode  press h for help
;; (setq sr-modeline-use-utf8-marks t)
;; ;;;; * C-t + Space (alternatively C-t + Return) - switch between tree and normal
;; (setq tree-widget-image-enable t) 
;; (setq sr-virtual-listing-switches " --time-style=locale --group-directories-first -alDphgG")
;; (setq sr-listing-switches " --time-style=locale --group-directories-first -alDphgG")
;; (setq sr-show-hidden-files nil);;C-o toggle
;; (setq sr-window-split-style (quote top)); C-c C-s toggle style 
;; ;;C-c t  open terminal cuurent dir
;; (define-key sr-mode-map "z"       'sr-fuzzy-narrow)

;;}}}
   ;;{{{ ido模式，C-x C-f 查找文件时的一种模式

;; (add-hook 'ido-define-mode-map-hook 'ido-my-keys)

;; (defun ido-my-keys ()
;;   "Set up the keymap for `ido'."

;;   ;; common keys
;;   (define-key ido-mode-map "\C-e" 'ido-edit-input)   
;;   (define-key ido-mode-map "\t" 'ido-complete) ;; complete partial
;;   (define-key ido-mode-map "\C-j" 'ido-select-text)
;;   (define-key ido-mode-map "\C-m" 'ido-exit-minibuffer)
;;   (define-key ido-mode-map "?" 'ido-completion-help) ;; list completions
;;   (define-key ido-mode-map [(control ? )] 'ido-restrict-to-matches)
;;   (define-key ido-mode-map [(control ?@)] 'ido-restrict-to-matches)

;;   ;; cycle through matches
;;   (define-key ido-mode-map "\C-r" 'ido-prev-match)
;;   (define-key ido-mode-map "\C-s" 'ido-next-match)
;;   (define-key ido-mode-map [right] 'ido-next-match)
;;   (define-key ido-mode-map [left] 'ido-prev-match)

;;   ;; toggles
;;   (define-key ido-mode-map "\C-t" 'ido-toggle-regexp) ;; same as in isearch
;;   (define-key ido-mode-map "\C-p" 'ido-toggle-prefix)
;;   (define-key ido-mode-map "\C-c" 'ido-toggle-case)
;;   (define-key ido-mode-map "\C-a" 'ido-toggle-ignore)

;;   ;; keys used in file and dir environment
;;   (when (memq ido-cur-item '(file dir))
;;     (define-key ido-mode-map "\C-b" 'ido-enter-switch-buffer)
;;     (define-key ido-mode-map "\C-d" 'ido-enter-dired)
;;     (define-key ido-mode-map "\C-f" 'ido-fallback-command)

;;     ;; cycle among directories
;;     ;; use [left] and [right] for matching files
;;     (define-key ido-mode-map [down] 'ido-next-match-dir)
;;     (define-key ido-mode-map [up]   'ido-prev-match-dir)

;;     ;; backspace functions
;;     (define-key ido-mode-map [backspace] 'ido-delete-backward-updir)
;;     (define-key ido-mode-map "\d"        'ido-delete-backward-updir)
;;     (define-key ido-mode-map [(meta backspace)] 'ido-delete-backward-word-updir)
;;     (define-key ido-mode-map [(control backspace)] 'ido-up-directory)

;;     ;; I can't understand this
;;     (define-key ido-mode-map [(meta ?d)] 'ido-wide-find-dir)
;;     (define-key ido-mode-map [(meta ?f)] 'ido-wide-find-file)
;;     (define-key ido-mode-map [(meta ?k)] 'ido-forget-work-directory)
;;     (define-key ido-mode-map [(meta ?m)] 'ido-make-directory)

;;     (define-key ido-mode-map [(meta down)] 'ido-next-work-directory)
;;     (define-key ido-mode-map [(meta up)] 'ido-prev-work-directory)
;;     (define-key ido-mode-map [(meta left)] 'ido-prev-work-file)
;;     (define-key ido-mode-map [(meta right)] 'ido-next-work-file)

;;     ;; search in the directories
;;     ;; use C-_ to undo this
;;     (define-key ido-mode-map [(meta ?s)] 'ido-merge-work-directories)
;;     (define-key ido-mode-map [(control ?\_)] 'ido-undo-merge-work-directory)
;;     )

;;   (when (eq ido-cur-item 'file)
;;     (define-key ido-mode-map "\C-k" 'ido-delete-file-at-head)
;;     (define-key ido-mode-map "\C-l" 'ido-toggle-literal)
;;     (define-key ido-mode-map "\C-o" 'ido-copy-current-word)
;;     (define-key ido-mode-map "\C-v" 'ido-toggle-vc)
;;     (define-key ido-mode-map "\C-w" 'ido-copy-current-file-name)
;;     )

;;   (when (eq ido-cur-item 'buffer)
;;     (define-key ido-mode-map "\C-b" 'ido-fallback-command)
;;     (define-key ido-mode-map "\C-f" 'ido-enter-find-file)
;;     (define-key ido-mode-map "\C-k" 'ido-kill-buffer-at-head)
;;     ))

; (ido-mode t)

;;}}}
   ;;{{{ smart-tab

;(eval-and-compile
;  (add-to-list 'load-path  (expand-file-name (concat joseph_site-lisp_install_path "smart-tab/")))
;  )
;(require 'smart-tab)
;(global-smart-tab-mode 1)
;(setq smart-tab-using-hippie-expand t)

 ;;}}}
   ;;{{{ 交换数字键与 特殊符号键(如8 与 *)
;;,写程序的时候有时候这些特殊符号会比数字键更常用
;; (defvar num-and-special-symbol-is-normal nil)
;; (defvar my-key-pairs
;;       '((?! ?1) (?@ ?2) (?# ?3) (?$ ?4) (?% ?5)
;;         (?^ ?6) (?& ?7) (?* ?8) (?( ?9) (?) ?0)
;;         (?- ?_) (?\" ?') (?{ ?[) (?} ?])         ; (?| ?\\)
;;         ))

;; (defun toggle-num-and-special-symbol-key-pairs()
;;   (interactive)
;;   (if num-and-special-symbol-is-normal
;;       (my-key-swap my-key-pairs)
;;     (my-key-restore my-key-pairs)
;;     )
;;   (setq num-and-special-symbol-is-normal
;;         (not num-and-special-symbol-is-normal ))
;;   )
        
;; (defun my-key-swap (key-pairs)
;;   (if (eq key-pairs nil)
;;       (message "Keyboard zapped!! F() to restore!")
;;       (progn
;;         (keyboard-translate (caar key-pairs)  (cadar key-pairs)) 
;;         (keyboard-translate (cadar key-pairs) (caar key-pairs))
;;         (my-key-swap (cdr key-pairs))
;;         )
;;     ))
;; (defun my-key-restore (key-pairs)
;;   (if (eq key-pairs nil)
;;       (message "Keyboard restored!! F9 to Zap!")
;;       (progn
;;         (keyboard-translate (caar key-pairs)  (caar key-pairs))
;;         (keyboard-translate (cadar key-pairs) (cadar key-pairs))
;;         (my-key-restore (cdr key-pairs))
;;         )
;;     ))
;; (my-key-swap my-key-pairs)
;; (global-set-key [(f9)]  'toggle-num-and-special-symbol-key-pairs )

;;}}}

;;}}}
(provide 'joseph_init)  
;;C-c return r ;重新加载当前文件
;;emacs -batch -f batch-byte-compile  filename
;; emacs  -batch    -l /home/jixiuf/emacsd/site-lisp/joseph/joseph_byte_compile_include.el  -f batch-byte-compile *.el

;;C-x C-e run current lisp
; ;; -*-no-byte-compile: t; -*-
