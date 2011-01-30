;;;;Time-stamp: <jixiuf 2011-01-30 13:19:35>

;;{{{ byte compile

(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
  )

;;}}}
;; 一些与键绑定相关的配置
(require 'joseph_keybinding);
(require 'joseph_folder)
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

;; 模仿eclipse 中的一个小功能，用;alt+up alt+down 上下移动当前行
;;(require 'joseph_move_line)
;;不仅当前行,也可以是一个选中的区域
(require 'move-text)

;;引入关于vim快捷键相关的一些配置，在joseph_vim.el
(require 'joseph_vim)

;;所有关于自动补全的功能都在joseph_complete.el 文件中进行配置
(require 'joseph_complete)

;;{{{ 将选区或者当前buffer 生成html格式（带语法着色）
;; M-x htmtize-file 
(require 'htmlize)
;;}}}
;;{{{ 行号的设置

;显行号 引入linum+.el文件
(require 'linum+)
;(global-linum-mode t)

;;}}} 

;;{{{ ibuffer 与buffer 相关的一些设置
;;ibuffer 的管理 
;;n p 上下，m进行标记 D标记为删除（关闭buffer） x如关闭标记的buffer
;; = 进行diff操作（已保存的与buffer中的） 
;;O 过滤标记的buffer ，在搜索进行搜索，显示搜索结果
(autoload 'ibuffer "ibuffer" "List buffers." t)
(require 'ibuf-ext)
(setq ibuffer-elide-long-columns t);;用...省略过长的文件名
(setq ibuffer-modified-char ?m);; 用m 字符表示modified的buffer
(setq ibuffer-read-only-char ?r);;用r 表示只读buffer
(setq ibuffer-show-empty-filter-groups nil);;不显示没有任何buffer的空分组
(setq ibuffer-default-sorting-mode (quote major-mode)) ;;排序
;;设置buffer中每一列的显示格式
(setq ibuffer-formats 
      '((mark modified read-only " "
              (name 30 30 :left :elide) " " ;buffer-name 宽度24 靠左
              (size 9 -1 :right) " "
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " " (name 24 -1) " " filename)))

;;隐藏所有以*anything开头的buffer
;;(add-to-list 'ibuffer-never-show-predicates "^\\*anything")

(global-set-key ( kbd "C-x C-c")' ibuffer)
(global-set-key "\C-x\c" 'switch-to-buffer)
(global-set-key "\C-x\C-b" 'save-buffers-kill-terminal);; 原来 的C-x C-c


;;ibuffer分组
(setq ibuffer-saved-filter-groups
      '(("default"
         ("anything"  (name . "^\\*anything.*\\*$"))
         ("Custom"  (mode . Custom-mode))
         ("emacs"  (name . "^\\*.*\\*$"))
         ("dired"  (mode . dired-mode))
         )))
(add-hook 'ibuffer-mode-hook
          (lambda ()(ibuffer-switch-to-saved-filter-groups "default")))

;;默认的分组default分组放在最后一个,此advice 倒序之
(defadvice ibuffer-generate-filter-groups
  (after reverse-ibuffer-groups () activate)
  (setq ad-return-value (nreverse ad-return-value)))
;;M-n M-p 组间跳转

  ;; Switching to ibuffer puts the cursor on the most recent buffer
;;切换到ibuffer 时光标定位到最近一次访问的buffer 而不是上一次的buffer
;; (defadvice ibuffer (around ibuffer-point-to-most-recent activate) ()
;;   "Open ibuffer with cursor pointed to most recent buffer name"
;;   (let ((recent-buffer-name (buffer-name)))
;;     ad-do-it
;;     (ibuffer-jump-to-buffer recent-buffer-name)))

;;}}}

;;{{{ FileNameCache(Emacs 自带的功能,可接合anything使用)

;; C-x C-f 时寻找文件可以不用输入完整路径,不过要事先将目录加到它入它和管理当中
;;不必使用书签可以快速打开常用的文件,可以将一个项目的源码目录加进来,
;;几种加入方式
;;不过如果递归加入的目录很深,启动速度会减慢
;; (file-cache-add-directory )
;;(file-cache-add-directory-using-find )
;;(file-cache-add-directory-using-locate )
;;(file-cache-add-directory-list) <RET> VARIABLE <RET>' like:load-path
;;(file-cache-add-directory-recursively "~/emacsd/")
;;在minibuffer 中输入部分文件名,然后C-Tab 补全
;;但是用C-Tab补全还是有点别扭,又不好覆盖Tab的补全功能
;;不过可以结合anything 使用,anything提供的使用FileNameCache的source
;;anything-c-source-file-cache,在anything中已将其加到anything-sources
;;C-x C-f C-TAB C-g
(require 'filecache)
;;将 .git 目录排除在外
(add-to-list 'file-cache-filter-regexps "\\.git\\>")
;;官方提供的几个file-cache-add-directory-*的方法每次需要扫描目录
;;启动速度会很慢wiki 上提供的两个function
;;file-cache-save-cache-to-file
;;file-cache-read-cache-from-file
;;可以将扫描的结果记入一个cache文件,以后启动时只需加载这个文件,不必每次都扫描
;;以后要添加新目录的时候只需要用官方的方法add 后,然后
;;file-cache-save-cache-to-file 一下就可以了
(defun file-cache-save-cache-to-file (file)
  "Save contents of `file-cache-alist' to FILE.
For later retrieval using `file-cache-read-cache-from-file'"
  (interactive "FFile: ")
  (with-temp-file (expand-file-name file)
    (prin1 file-cache-alist (current-buffer))))

(defun file-cache-read-cache-from-file (file)
  "Clear `file-cache-alist' and read cache from FILE.
  The file cache can be saved to a file using
  `file-cache-save-cache-to-file'."
  (interactive "fFile: ")
  (file-cache-clear-cache)
  (save-excursion
    (with-current-buffer (find-file-noselect file)
      (goto-char (point-min))
      (setq file-cache-alist (read (current-buffer)))
      (kill-buffer)
      )))

(let ((file-name-cache-file-name (concat joseph_root_install_path "cache/file-name-cache")))
  (message "Loading file cache...")
  (if (file-exists-p file-name-cache-file-name)
      ;; 如果cache文件存在直接读取里面的内容,
      (file-cache-read-cache-from-file file-name-cache-file-name)
    ;;如果cache文件不存在则用官方提供的几人函数添加到file-cache-alist中,然后
    ;;save 到cache文件中,需要注意如果有新路径加入,需要手动
    ;;(file-cache-save-cache-to-file file-name-cache-file-name)
    (progn
           ;;   (file-cache-add-directory-using-find "~/project")
           ;;   (file-cache-add-directory-recursively "/")
           (file-cache-add-directory-list load-path)
           (file-cache-add-directory "~/")
;           (file-cache-add-directory-using-find "/java/java/Emacs/wiki/")

           ;;  (file-cache-add-file-list (list "~/foo/bar" "~/baz/bar"))
      (file-cache-save-cache-to-file file-name-cache-file-name)
      )))


  
;;当kill-buffer时自动当其加入到cache
(defun file-cache-add-this-file ()
  (and buffer-file-name
       (file-exists-p buffer-file-name)
       (file-cache-add-file buffer-file-name)))
(add-hook 'kill-buffer-hook 'file-cache-add-this-file)

;;}}}
;;{{{ anything
(eval-and-compile
  (add-to-list 'load-path (expand-file-name (concat joseph_site-lisp_install_path "anything-config/")))
  (add-to-list 'load-path (expand-file-name (concat joseph_site-lisp_install_path "anything-config/extensions/")))
  (add-to-list 'load-path (expand-file-name (concat joseph_site-lisp_install_path "anything-config/developer-tools/")))
  )
(require 'anything-startup)
(anything-dired-bindings 1);;
;;(define-prefix-command 'ctl-w-map)
;;(global-set-key (kbd "C-w") 'ctl-w-map)
(anything-set-anything-command-map-prefix-key 'anything-command-map-prefix-key "\C-w")
(define-key anything-command-map (kbd "<SPC>") 'anything-execute-anything-command)
(define-key anything-command-map (kbd "e") 'anything-etags-maybe-at-point)
(define-key anything-command-map (kbd "l") 'anything-locate)
(define-key anything-command-map (kbd "s") 'anything-surfraw)

;;do grep in selected file or dir 
(define-key anything-command-map (kbd "g") 'anything-do-grep)
;;list matched regexp in current buffer
(define-key anything-command-map (kbd "C-s") 'anything-occur)
;;do query-replace 
(define-key anything-command-map (kbd "r") 'anything-regexp)

(define-key anything-command-map (kbd "f") 'anything-find-files)
(define-key anything-command-map (kbd "C-f") 'anything-for-files)

(define-key anything-command-map (kbd "C-c") 'anything-buffers+)
(define-key ctl-x-map (kbd "c") 'anything-buffers+)
(define-key anything-command-map (kbd "M-y") 'anything-show-kill-ring)
(define-key global-map (kbd "M-y") 'anything-show-kill-ring)

(define-key anything-command-map (kbd "w") 'anything-w3m-bookmarks)
(define-key anything-command-map (kbd "b") 'anything-firefox-bookmarks)
(define-key anything-command-map (kbd "#") 'anything-emms)
(define-key anything-command-map (kbd "m") 'anything-man-woman)
(define-key anything-command-map (kbd "t") 'anything-top)
(define-key anything-command-map (kbd "i") 'anything-imenu)
(define-key anything-command-map (kbd "p") 'anything-list-emacs-process)
(define-key anything-command-map (kbd "C-x r b") 'anything-c-pp-bookmarks)
(define-key anything-command-map (kbd "C-m") 'anything-all-mark-rings)
(define-key anything-command-map (kbd "C-;") 'anything-eval-expression-with-eldoc)
(define-key anything-command-map (kbd "C-,") 'anything-calcul-expression)
(define-key anything-command-map (kbd "x") 'anything-M-x)
(define-key anything-command-map (kbd "C-w") 'anything-write-file)
(define-key anything-command-map (kbd "C-x i") 'anything-insert-file)
(define-key anything-command-map (kbd "c") 'anything-colors)
(define-key anything-command-map (kbd "F") 'anything-select-xfont)
(define-key anything-command-map (kbd "C-x f") 'anything-recentf)
(define-key anything-command-map (kbd "C-x g") 'anything-google-suggest)
(define-key anything-command-map (kbd "h i") 'anything-info-at-point)
(define-key anything-command-map (kbd "h r") 'anything-info-emacs)
(define-key anything-command-map (kbd "C-x b") 'anything-browse-code)
(define-key anything-command-map (kbd "C-x r i") 'anything-register)
(define-key anything-command-map (kbd "C-x C-x") 'anything-c-run-external-command)
 (setq  anything-su-or-sudo "sudo")
(add-to-list 'anything-for-files-prefered-list anything-c-source-create t)
(setq anything-c-adaptive-history-file
      (concat joseph_root_install_path
              "cache/anything-c-adaptive-history"))

              

;;}}} 
;;{{{ anything key map when anything window opened 

;; (defvar anything-map
;;   (let ((map (copy-keymap minibuffer-local-map)))
;;     (define-key map (kbd "<down>") 'anything-next-line)
;;     (define-key map (kbd "<up>") 'anything-previous-line)
;;     (define-key map (kbd "C-n")     'anything-next-line)
;;     (define-key map (kbd "C-p")     'anything-previous-line)
;;     (define-key map (kbd "<prior>") 'anything-previous-page)
;;     (define-key map (kbd "<next>") 'anything-next-page)
;;     (define-key map (kbd "M-v")     'anything-previous-page)
;;     (define-key map (kbd "C-v")     'anything-next-page)
;;     (define-key map (kbd "M-<")     'anything-beginning-of-buffer)
;;     (define-key map (kbd "M->")     'anything-end-of-buffer)
;;     (define-key map (kbd "<right>") 'anything-next-source)
;;     (define-key map (kbd "<left>") 'anything-previous-source)
;;     (define-key map (kbd "<RET>") 'anything-exit-minibuffer)
;;     (define-key map (kbd "C-1") 'anything-select-with-digit-shortcut)
;;     (define-key map (kbd "C-2") 'anything-select-with-digit-shortcut)
;;     (define-key map (kbd "C-3") 'anything-select-with-digit-shortcut)
;;     (define-key map (kbd "C-4") 'anything-select-with-digit-shortcut)
;;     (define-key map (kbd "C-5") 'anything-select-with-digit-shortcut)
;;     (define-key map (kbd "C-6") 'anything-select-with-digit-shortcut)
;;     (define-key map (kbd "C-7") 'anything-select-with-digit-shortcut)
;;     (define-key map (kbd "C-8") 'anything-select-with-digit-shortcut)
;;     (define-key map (kbd "C-9") 'anything-select-with-digit-shortcut)
;;     (loop for c from ?A to ?Z do
;;           (define-key map (make-string 1 c) 'anything-select-with-digit-shortcut))
;;     (define-key map (kbd "C-i") 'anything-select-action)
;;     (define-key map (kbd "C-z") 'anything-execute-persistent-action)
;;     (define-key map (kbd "C-e") 'anything-select-2nd-action-or-end-of-line)
;;     (define-key map (kbd "C-j") 'anything-select-3rd-action)
;;     (define-key map (kbd "C-o") 'anything-next-source)
;;     (define-key map (kbd "C-M-v") 'anything-scroll-other-window)
;;     (define-key map (kbd "M-<next>") 'anything-scroll-other-window)
;;     (define-key map (kbd "C-M-y") 'anything-scroll-other-window-down)
;;     (define-key map (kbd "C-M-S-v") 'anything-scroll-other-window-down)
;;     (define-key map (kbd "M-<prior>") 'anything-scroll-other-window-down)
;;     (define-key map (kbd "C-SPC") 'anything-toggle-visible-mark)
;;     (define-key map (kbd "M-[") 'anything-prev-visible-mark)
;;     (define-key map (kbd "M-]") 'anything-next-visible-mark)
;;     (define-key map (kbd "C-k") 'anything-delete-minibuffer-contents)

;;     (define-key map (kbd "C-s") 'anything-isearch)
;;     (define-key map (kbd "C-r") 'undefined)
;;     (define-key map (kbd "C-t") 'anything-toggle-resplit-window)
;;     (define-key map (kbd "C-x C-f") 'anything-quit-and-find-file)

;;     (define-key map (kbd "C-c C-d") 'anything-delete-current-selection)
;;     (define-key map (kbd "C-c C-y") 'anything-yank-selection)
;;     (define-key map (kbd "C-c C-k") 'anything-kill-selection-and-quit)
;;     (define-key map (kbd "C-c C-f") 'anything-follow-mode)
;;     (define-key map (kbd "C-c C-u") 'anything-force-update)

;;     ;; Debugging command
;;     (define-key map "\C-c\C-x\C-d" 'anything-debug-output)
;;     (define-key map "\C-c\C-x\C-m" 'anything-display-all-visible-marks)
;;     (define-key map "\C-c\C-x\C-b" 'anything-send-bug-report-from-anything)
;;     ;; Use `describe-mode' key in `global-map'
;;     (dolist (k (where-is-internal 'describe-mode global-map))
;;       (define-key map k 'anything-help))
;;     ;; the defalias is needed because commands are bound by name when
;;     ;; using iswitchb, so only commands having the prefix anything-
;;     ;; get rebound
;;     (defalias 'anything-previous-history-element 'previous-history-element)
;;     (defalias 'anything-next-history-element 'next-history-element)
;;     (define-key map (kbd "M-p") 'anything-previous-history-element)
;;     (define-key map (kbd "M-n") 'anything-next-history-element)
;;     map)
;;   "Keymap for anything.

;; If you execute `anything-iswitchb-setup', some keys are modified.
;; See `anything-iswitchb-setup-keys'.")

;;}}}

;;C-x C-f 时 输入 / 或者~ 会自动清除原来的东西,只留下/ 或者~
(require 'minibuf-electric-gnuemacs)

;;读取buffer name 时忽略大小写
(setq read-buffer-completion-ignore-case t)
;;读取file name 时忽略大小写
(setq read-file-name-completion-ignore-case t)
(setq save-completions-file-name "~/.emacs.d/cache/completions")
;;{{{ icicle
;;读取icicle的文档时可以跳转
(require 'linkd)
;; enable it by (linkd-mode) in a linkd-mode 
; icicles-doc1.el 文档用它进行超链接
(add-to-list 'load-path (concat joseph_site-lisp_install_path "icicles"))
(require 'icicles)
(setq icicle-region-background "blue");;face的设置,可以用custom-group进行设置
(setq icicle-Completions-window-max-height 16);;设置"*Completions*"窗口的最大行数

;;`pause' (icicle-switch-to/from-minibuffer) 在minibufer与正在编辑的buffer 间切换
;;`C-<insert>` 在minibuffer与*Completions*间切换

;;  minibuffer or use `C-l'`icicle-retrieve-previous-input'
;;当有minibuffer中输入一部分内容如cus ,几次<TAB>后minibuffer变成了custom
;;但是你又想在minibuffer中输入cusm ,这个时候C-l 会把custom 变成cus


;;一个命令操作多个candidate,如C-x C-f 打开多个文件
;;(@* "Perform Multiple Operations in One Command")
;;C-x C-f 在选中的candidate上不进行<return> 而是C-return,
;;然后到下一个candidate上继续C-return
;;`icicle-file'(`C-x C-f') is an Icicles multi-command所以可以进行这种"多"操作
;;所有这种命令在执行时会有一个"+"的前缀,而不是默认的"."
;;对于这类命令相应的快捷键
;;C-down    down
;;C-next    next
;;C-!       一次在所有的candidates上执行操作(每个candidate执行一次)
;;  In addition to using `down' (or `end' or `next') and choosing
;;  (acting on) candidates with `C-RET', you can combine these
;;  operations by using `C-down' (or `C-next'): act on candidates in
;;  succession.  And, as mentioned, you can use `C-!'  to act on all
;;  candidates at once.
;;就像icicles 中所有与帮助相应的key binding 都是以`C-M-`以前缀,
;;与multi-command 相关的则以`C-`
;;  There are many possible uses of multi-commands.  They all make use
;;  of the same key bindings, which begin with `C-'.  These keys are
;;  analogous to the `C-M-' keys that provide help on completion
;;  candidates.

;;另外关于C-! M-! C-| M-| 四个的区别
;;C-! :对每个candidate 执行一次操作 ,
;;M-! 把所有的candidates 作为一个整体执行一个操作(只执行一次)
;;C-|  M-| 与C-! M-! 的不同是
;;C-! M-! 执行candidates 的main action
;;而C-| M-| 则执行alternative action,
;;  * `icicle-candidate-action-fn' (`C-!') - normal single-candidate  action
;;  * `icicle-candidate-alt-action-fn' (`C-|') - alternative single-candidate action
;;  * `icicle-all-candidates-list-action-fn' (`M-!') - normal list-of-candidates action
;;  * `icicle-all-candidates-list-alt-action-fn' (`M-|') - alternative list-of-candidates action


;;一个candidate 选择性的执行某个操作
;;;;    C-S-RET之与RET on each candidate
;;(@* "Perform Alternative Operations on the Fly")
;;假如在选中的candidate 上<RET> 执行默认操作的话
;;那么<C-S-RET> 则是执行另外的可选操作
;;C-x C-f  TAB TAB 找到要找的文件后,C-S-RET ,
;;会列出选有针对选中文件可进行的操作如find-file-read-only
;; `icicle-search' (`C-c `')  S-TAB 列出所有
;;C-next 跳到下一个
;;可以M-p 搜索历史
;;"C--C-c`" 会让你选择在哪个文件中搜索 ,可以多选,

;;在选中的candidate上<delete> 则从candidates中删除之
;;C-S-a toggle case-sensitive 

;;M-. 将光标附近的文件插入到minibuffer
;;自动插入默认值,选中默认值,光标置于前
;;(setq icicle-default-value (quote preselect-start))
;;自动插入默认值,选中默认值,光标置于后
;;(setq icicle-default-value (quote preselect-end))
;;只将默认值显示在提示区,不插入minibuffer
(setq icicle-default-value t)
;;M-k 可以清除minibuffer

;;关于多次过滤 类似于linux 下的这种操作
;;    grep plant *.txt | grep food | grep mineral
;;M-*
;;例如过滤即含buffer又含ici的
;;M-x buffer S-TAB M-* ici S-Tab
;;S-SPC 是S-TAB M-*的简化
;;M-x buffer S-SPC ici S-TAB
;;假如说M-x是与操作的话,那么M-+ 就是或操作了,
;;`S-backspace'是S-TAB M-+的简化

;;TAB 可调用的补全方式,可以要通过 `C-(' 切换,默认是basic,调整顺序可修改之
;;fuzzy 需要fuzzy-match.el
(setq icicle-TAB-completion-methods '(vanilla basic fuzzy))
;;
;;假如有个`new-ideas.txt'的buffer ,切换buffer时,如果仅输入了`new-' 在`RET'的时候
;;会前缀补全为`new-ideas.txt',否则新建buffer:`new-' ,`S-RET' 则apropos补全
(setq icicle-buffer-require-match-flag 'partial-match-ok)

;;当`TAB' 后只有一个选项时,不用回车,自动执行相应操作,如打开文件
;;(setq icicle-top-level-when-sole-completion-flag t)
;;(setq icicle-top-level-when-sole-completion-delay 0.7)

;;ido的一些特点
;;如果不按TAB S-Tab 是否自动显示"*Completions*"
;;(setq icicle-show-Completions-initially-flag t)

;;当在minibuffer输入内容时,动态更新*Completions*
;;仅当已经显示"*Completions*" 时才动态更新
;;(setq icicle-incremental-completion-flag t)
;;即使当前并没有显示*Completions* window,也进行更新
(setq icicle-incremental-completion-flag (quote always))
(setq icicle-incremental-completion-delay 0.7)
;;
;;(icicle-ido-like-mode);,会让icicle 表现的更像ido

;;但如果仅想让在处理buffer file 时表现的像ido 可以
;;(setq icicle-buffers-ido-like-flag t)
;;(setq icicle-files-ido-like-flag t)

;;`C-,' 调整排序方式

;;快捷键,比如想查看所有以C-x开头的,
;;只须C-x S-TAB,若不按C-x 直接按S-TAB则显示所有
;;[(control ?g)]

;;定义 上一个下一个 选项所用的快捷键,我加入了C-n C-p
(setq icicle-modal-cycle-down-keys (quote ([down] [nil mouse-5] [mouse-5] [(control ?n)])))
(setq icicle-modal-cycle-up-keys (quote ([up] [nil mouse-4] [mouse-4] [(control ?p)])))

;;设置在没按下Tab 或S-TAB 时,按down up 默认使用prefix 还是apropos 进行匹配
(setq icicle-default-cycling-mode (quote apropos))
;;交换Tab 与S-TAB的绑定,我更喜欢用apropos 进行匹配还不是prefix进行匹配,
(setq icicle-apropos-complete-keys (quote ([tab])))
(setq icicle-prefix-complete-keys (quote ([S-tab] [(control 105)])))
;;(icicle-bind-completion-keys minibuffer-local-completion-map)
;;(define-key [(control ?n)] minibuffer-local-completion-map 'fu)

;;关于历史记录History
;;M-n M-p 上一个,下一个,
;;M-o 列出所有可用的历史`icicle-insert-history-element'
;;M-h 在众多选项中只显示历史的记录
;;  `icicle-clear-current-history' is bound to `M-i' 


;;在'anything.el' 中的匹配方式在用空格分开不同的正则表达式,进行多次匹配,
;;不太喜欢icicle 中用S-SPC进行多次匹配的方式
;;此advice 模仿了它, 仅仅是将minibuffer中的空格替换成'.*'
;;这样输入"buffer face" 被转换在"buffer.*face" 可以匹配"buffer-face-set"
;;不过prefix匹配时如果有空格,就会有bug了
(defadvice icicle-input-from-minibuffer (around replac-whitespace-with-dot* activate)
  "replace whitespace with '.*' so it can work like 'anything'"
  ad-do-it
  (when (string-match " " ad-return-value)
    (let* ((orig-buf-content ad-return-value)
           (new-buf-content (replace-regexp-in-string " " ".*" ad-return-value)))
      (goto-char (point-min))
      (when (search-forward orig-buf-content)
        (delete-region (match-beginning 0) (point))
        (insert new-buf-content)
        ))
    (setq ad-return-value (replace-regexp-in-string " " ".*" ad-return-value))
    )
  )

(icicle-mode 1)
;;}}}

;;(require 'minibuffer-complete-cycle)
;;(setq minibuffer-complete-cycle 'auto)

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
(autoload 'shell-toggle-cd "shell-toggle" "Toggles between the *shell* buffer and whatever buffer you are editing." t)
(global-set-key [M-f1] 'shell-toggle-cd)
;   (autoload 'shell-toggle-cd "shell-toggle" "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
;  (global-set-key [C-f1] 'shell-toggle-cd)

;;}}}
(require 'psvn)
;;{{{ javascript.el

(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

;;}}}

;(add-to-list 'load-path (concat joseph_site-lisp_install_path "color-theme-6.6.0/"))
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-hober)
;;{{{  注释掉的

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;这个的功能是输入两个逗号则相当于输入一个小于号
;;输入两个"." 相当于输入一个">" 输入一个",." 则相当于输入"<>"
;;但是只在C语言模式下有用,java不管用,不知为何
;; (defun my-editing-function (first last len)
;;   (interactive)
;;   (if (and (boundp 'major-mode)
;;            (member major-mode (list 'c-mode 'c++-mode 'gud-mode 'fundamental-mode 'ruby-mode))
;;            (= len 0)
;;            (> (point) 4)
;;            (= first (- (point) 1)))      
;;       (cond
;;        ((string-equal (buffer-substring (point) (- (point) 2)) ",,")
;;         (progn (delete-backward-char 2) (insert-char ?< 1) ))
;;        ( (string-equal (buffer-substring (point) (- (point) 2)) "..")
;;         (progn (delete-backward-char 2) (insert ">") ))
;;        ( (string-equal (buffer-substring (point) (- (point) 2)) ",.")
;;         (progn (delete-backward-char 2) (insert "<>")  (backward-char 1) ))
;;        ( (string-equal (buffer-substring (point) (- (point) 2)) "[[")
;;         (progn (delete-backward-char 2) (insert "{")   ))
;;        ( (string-equal (buffer-substring (point) (- (point) 2)) "]]")
;;         (progn (delete-backward-char 2) (insert "}")   )) 

       
;;        )      
;;     nil))
;; (add-hook 'after-change-functions 'my-editing-function)



;;}}}

;;}}} 
(provide 'joseph_init)

;;C-c return r ;重新加载当前文件
;;emacs -batch -f batch-byte-compile  filename
;; emacs  -batch    -l /home/jixiuf/emacsd/site-lisp/joseph/joseph_byte_compile_include.el  -f batch-byte-compile *.el

;;C-x C-e run current lisp
; ;; -*-no-byte-compile: t; -*-

