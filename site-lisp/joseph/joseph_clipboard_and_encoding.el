;;;;Time-stamp: <jixiuf 2011-03-13 14:29:30>
;;{{{ 关于没有选中区域,则默认为选中整行的advice

;;;;默认情况下M-w复制一个区域，但是如果没有区域被选中，则复制当前行
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;;;;默认情况下C-w剪切一个区域，但是如果没有区域被选中，则剪切当前行
(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;;;;此函数实现的功能，当未选中任何区域时M-w 操作则复制当前行(使用clipboard时)
(defadvice clipboard-kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;;;;默认情况下C-w剪切一个区域，但是如果没有区域被选中，则剪切当前行
(defadvice clipboard-kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;;}}}
;;以下的设置对于X TTY linux windows,
;;甚至根据是否做为deamon进程启动的不同进行不同的配置
;;{{{ 关于utf-8编码 ,字符集的选用

(when (eq system-type 'gnu/linux)
  ;; For my language code setting (UTF-8)设置编码
  ;;(set-clipboard-coding-system 'chinese-iso-8bit) ;; 如果不设，在emacs 剪切的中文没法在其他程序中粘贴
  (setq current-language-environment "UTF-8")
  (setq locale-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (set-clipboard-coding-system 'utf-8)
  (set-buffer-file-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (modify-coding-system-alist 'process "*" 'utf-8)
  (setq default-process-coding-system '(utf-8 . utf-8))
  (setq-default pathname-coding-system 'utf-8)
  (set-file-name-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  
  (setq font-encoding-alist
        (append '(("MuleTibetan-0" (tibetan . 0))
                  ("GB2312" (chinese-gb2312 . 0))
                  ("JISX0208" (japanese-jisx0208 . 0))
                  ("JISX0212" (japanese-jisx0212 . 0))
                  ("VISCII" (vietnamese-viscii-lower . 0))
                  ("KSC5601" (korean-ksc5601 . 0))
                  ("MuleArabic-0" (arabic-digit . 0))
                  ("MuleArabic-1" (arabic-1-column . 0))
                  ("MuleArabic-2" (arabic-2-column . 0)))
                font-encoding-alist))
  )

;;}}}
;;{{{ 外观的设置，包括字体 背景等

;;前景背景色
;; (add-to-list 'default-frame-alist '(background-color . "#2e2d28") )
;; (add-to-list 'default-frame-alist  '(foreground-color . "#f7f8c6"))
;; (add-to-list 'default-frame-alist  '(cursor-color . "white") )
;; ;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11"))
;; ;(set-default-font "Bitstream Vera Sans Mono-12")
;; ;(set-default-font "DejaVu Sans Mono-11")

;;;;字体设置
;;(set-fontset-font "fontset-default" 'gb18030 '("WenQuanYi Bitmap Song" . "unicode-bmp")) ;; 设置中文字体  
;; (set-default-font "Courier New-13")  
;; (set-fontset-font "fontset-default" 'unicode '("WenQuanYi Bitmap Song" . "unicode-bmp"))
;; (create-fontset-from-fontset-spec
;;  "-misc-dejavu sans mono-bold-r-normal--0-0-0-0-m-0-fontset-mymono,
;;  chinese-gb2312:-*-wenquanyi bitmap song-medium-*-normal--14-*-*-*-*-*-iso10646-1,
;;  chinese-gbk:-*-wenquanyi bitmap song-medium-*-normal--14-*-*-*-*-*-iso10646-1,
;;  chinese-gb18030:-*-wenquanyi bitmap song-medium-*-normal--14-*-*-*-*-*-iso10646-1"
;; )

;; (setq default-frame-alist (append '((font . "fontset-mymono")) default-frame-alist))
;; (set-default-font "fontset-mymono")
;(set-fontset-font x"fontset-default" 'ascii '("WenQuanYi Bitmap Song" . "unicode-bmp")) ;; 设置中文字体  
;; (set-fontset-font "fontset-default" 'cjk-misc '("STHeiti" . "unicode-bmp"))
;; (set-fontset-font "fontset-default" 'han '("STHeiti" . "unicode-bmp"))
;; (set-fontset-font "fontset-default" 'bopomofo '("STHeiti" . "unicode-bmp"))
;; (set-fontset-font "fontset-default" 'symbol '("YaHei Consolas Hybrid" . "unicode-bmp"))

;;}}} 

;;{{{ 关于X下剪切板 的设置,及daemon导致X有关设置失效的解决办法

;;关于剪切板: X共享信息的有 clipboard primary secondary 三个区域
;;其中clipboard 就是我们常说的剪切板,而primary 就是常说的selection ,也就是说只要你选中一段内容,
;;那么这段内容就被存到primary 中了,而secondary 目前好像已经不推荐使用了,所以不用考虑
;;而emacs 默认存在内容的区域不是上面任何一个,它叫kill-ring叫剪切环,它能存储不只一份内容,
;;C-y 会取出kill-ring 中最近的一份内容,然后paste(专业点叫yank)到buffer 中,可以通过M-y
;;取得以前的版本

(defun setting-for-linux-x-clipboard ()
  (when (and (eq system-type 'gnu/linux)(eq window-system 'x))
    ;;在向kill-ring 加入内容的同时会执行interprogram-cut-function 变量指定的函数
    (setq interprogram-cut-function 'x-select-text);; default
    ;;在执行yank 操作时,会检查interprogram-paste-function 变量 所指向的函数
    ;;是否有返回值,如果有的话就将其yank在buffer 中,否则的话才会从kill-ring中取值
    ;;而x-cut-buffer-or-selection-value  和x-select-text函数一样,
    ;;也会根据x-select-enable-clipboard 和x-select-enable-primary 的值
    ;;决定是否从clipboard 和primary 中取得内容
    (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
    ;;有关于往kill-ring加入内容时 是否往clipboard ,及primary 放入的判断
    (setq x-select-enable-clipboard t) ;每一次往kill-ring 里加入东西时,同时往clipboard中放一份,
    (setq x-select-enable-primary  nil) ;每一次往kill-ring 里加入东西时,是否也往primary 中放入
    (setq select-active-regions  t);这个忘了什么意思
    ;;在轮询kill-ring 的时候是否也同步改变系统的clipboard primary
    ;;(要根据x-select-enable-clipboard ,及x-select-enable-primary的值决定哪个会被改变)
    (setq yank-pop-change-selection t)  ;
    ;;Save clipboard strings into kill ring before replacing them
    (setq save-interprogram-paste-before-kill t)
    
    ;; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.
    ;;鼠标中键粘贴,只考虑X11中的selection ,不考虑clipboard 和emacs 中的kill-ring
    (global-set-key [mouse-2] 'mouse-yank-primary)
    ;;其实有了以上几个配置 下面这三个键完全没有必要,但为防万一,
    ;;将与剪切板相关的三个操作绑到这三个不常用的键上.
    (global-set-key [(shift delete)] 'clipboard-kill-region)
    (global-set-key [(control insert)] 'clipboard-kill-ring-save)
    (global-set-key [(shift insert)] 'clipboard-yank)
    )
  )


(defun setting-faces-dep-systems()
  (cond
   ((eq window-system 'x) ;;针对linux下X的设置
    (menu-bar-mode -1);;关闭菜单栏
    (tool-bar-mode -1);;关闭工具栏
    )
   ((eq window-system 'w32);;windows 下的设置
    (tool-bar-mode -1);;关闭工具栏
    ;;windows 下没有daemon模式,将这个函数
    ;;绑定到C-x C-c 上到实际上是隐藏窗口,并没真正关闭窗口
    ;;然后可以用emacsclient 连上server
    (defun w32-hide-frame-as-kill()
      (interactive)                                                                                    
      (make-frame-invisible nil t))
    
    (global-set-key (kbd "C-x C-b") 'w32-hide-frame-as-kill)
    (global-set-key (kbd "C-x C-z") 'w32-hide-frame-as-kill)
    (create-fontset-from-fontset-spec
     (concat   "-outline-Courier New-normal-normal-normal-mono-15-*-*-*-c-*-fontset-gbk,"
               "chinese-gb2312:-outline-新宋体-normal-normal-normal-mono-15-*-*-*-c-*-gb2312.1980-0") t)
    (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; The next line is only needed for the MS-Windows clipboard
    (set-clipboard-coding-system 'utf-16le-dos)
    (set-frame-font "-outline-SimSun-normal-normal-normal-*-16-*-*-*-p-*-iso8859-1")
    )
   ((eq window-system nil);;linux文本模式下的设置
    (menu-bar-mode -1)
    (tool-bar-mode -1)
    )
  ))

;;}}}
;;{{{ demonp server
;; 如果在.emacs里对X相关的选项（字体什么的）直接进行设置，那么会发现用emacsclient启动时，这些设置都失效了。
;;这是因为这些设置是在X下的frame创建时才有效的，而启动服务器的时候是没有创建frame的。
;; 解决方法有两种，一种是使用after-make-frame-functions这个hook，在创建一个frame之后才进行设置。代码如下
(require 'server)
(add-hook 'after-make-frame-functions
                (lambda (frame)
                  (setting-for-linux-x-clipboard)
                  (setting-faces-dep-systems)
                  ;;(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function) 
                  ))
(setting-for-linux-x-clipboard)
(setting-faces-dep-systems)

(defun hide-emacs-on-linux()
  (when (eq system-type  'gnu/linux)
    (shell-command "echo 'hide_emacs()' | awesome-client")))

;;}}}

;;{{{ kill-server-buffer-without-asking

;;重新定义menu-bar-non-minibuffer-window-p,
;;原本的函数在Ediff中打开多个frame后又关闭其中之一后,后导致bug,以致无法(kill-this-buffer)
(defun menu-bar-non-minibuffer-window-p ()
  "Return non-nil if selected window of the menu frame is not a minibuf window.
See the documentation of `menu-bar-menu-frame-live-and-visible-p'
for the definition of the menu frame."
  (let ((menu-frame (selected-frame)))
    (not (window-minibuffer-p (frame-selected-window menu-frame)))))

(global-set-key (kbd "C-x k") 'kill-server-buffer-without-asking)
(global-set-key (kbd "C-x C-k") 'kill-server-buffer-without-asking)

(defun kill-server-buffer-without-asking()
  (interactive)
  (if server-buffer-clients
      (server-edit)
    (kill-this-buffer)
    )
  )
;;}}}
;;(set-background-color "#201e1b")
;;(set-foreground-color "#a1aca7")
;;(set-default-font "DejaVu Sans Mono:pixelsize=16")

;;{{{  针对X w32 tty 3 种不同模式下的一些外观设置
(setq window-system-default-frame-alist
      '(
        ;; if frame created on x display
        (x
         (foreground-color . "#f7f8c6")
         (background-color . "#2e2d28")
         (cursor-color . "white")
;;         (font . "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")
         (font . "DejaVu Sans Mono:pixelsize=16")
         )
        (w32
         (foreground-color . "#f7f8c6")
         (background-color . "#2e2d28")
         (cursor-color . "white")
          (height . 35)
          (width . 95)
          (font . "fontset-gbk")
         )
        ;; if on term
        (nil
         (background-color . "black")
         (foreground-color . "white")
         )
        )
      )
;;}}}

(provide 'joseph_clipboard_and_encoding)
