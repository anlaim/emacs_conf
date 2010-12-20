;;{{{ 时间戳
;;;;Time-stamp: <jixiuf 2010-12-19 22:25:28>
;;}}}

;;{{{ 关于剪切板
;;关于剪切板: X共享信息的有 clipboard primary secondary 三个区域
;;其中clipboard 就是我们常说的剪切板,而primary 就是常说的selection ,也就是说只要你选中一段内容,
;;那么这段内容就被存到primary 中了,而secondary 目前好像已经不推荐使用了,所以不用考虑
;;而emacs 默认存在内容的区域不是上面任何一个,它叫kill-ring叫剪切环,它能存储不只一份内容,
;;C-y 会取出kill-ring 中最近的一份内容,然后paste(专业点叫yank)到buffer 中,可以通过M-y
;;取得以前的版本
(when (and (eq system-type 'gnu/linux)(eq window-system 'x))
  ;;在向kill-ring 加入内容的同时会执行interprogram-cut-function 变量指定的函数
  (setq interprogram-cut-function 'x-select-text);; default
  ;;在执行yank 操作时,会检查interprogram-paste-function 变量 所指向的函数
  ;;是否有返回值,如果有的话就将其yank在buffer 中,否则的话才会从kill-ring中取值
  ;;而x-cut-buffer-or-selection-value  和x-select-text函数一样,
  ;;也会根据x-select-enable-clipboard 和x-select-enable-primary 的值
  ;;决定是否从clipboard 和primary 中取得内容
  (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
  (custom-set-variables
   ;;有关于往kill-ring加入内容时 是否往clipboard ,及primary 放入的判断
   '(x-select-enable-clipboard t) ;每一次往kill-ring 里加入东西时,同时往clipboard中放一份,
   '(x-select-enable-primary  nil) ;每一次往kill-ring 里加入东西时,是否也往primary 中放入
   '(select-active-regions  t);这个忘了什么意思
   ;;在轮询kill-ring 的时候是否也同步改变系统的clipboard primary
   ;;(要根据x-select-enable-clipboard ,及x-select-enable-primary的值决定哪个会被改变)
   '(yank-pop-change-selection t)  ; 
   )
  ;; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.
  ;;鼠标中键粘贴,只考虑X11中的selection ,不考虑clipboard 和emacs 中的kill-ring
  (global-set-key [mouse-2] 'mouse-yank-primary)
  ;;其实有了以上几个配置 下面这三个键完全没有必要,但为防万一,
  ;;将与剪切板相关的三个操作绑到这三个不常用的键上.
  (global-set-key [(shift delete)] 'clipboard-kill-region)
  (global-set-key [(control insert)] 'clipboard-kill-ring-save)
  (global-set-key [(shift insert)] 'clipboard-yank)
  )
;;}}}

;;{{{ 关于没有选中区域,则默认为选中整行的advice

;;默认情况下M-w复制一个区域，但是如果没有区域被选中，则复制当前行
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;;默认情况下C-w剪切一个区域，但是如果没有区域被选中，则剪切当前行
(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;;此函数实现的功能，当未选中任何区域时M-w 操作则复制当前行(使用clipboard时)
(defadvice clipboard-kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;;默认情况下C-w剪切一个区域，但是如果没有区域被选中，则剪切当前行
(defadvice clipboard-kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;;}}}

;;{{{ 零星几个变量
(custom-set-variables
 ;;不要在鼠标点击的那个地方插入剪贴板内容。我不喜欢那样，经常把我的文档搞的一团糟。
 ;;我觉得先用光标定位，然后鼠标中键点击要好的多。不管你的光标在文档的那个位置，或是在 minibuffer，
 ;;鼠标中键一点击，X selection 的内容就被插入到那个位置。
 '(mouse-yank-at-point t)
 '(kill-ring-max 200) ;;用一个很大的 kill ring. 这样防止我不小心删掉重要的东西,默认是60个
 '(delete-selection-mode t) ;;当选中内容时，输入新内容则会替换掉
 '(kill-whole-line t) ;; 在行首 C-k 时，同时删除末尾换行符
 )
;;}}}

;;{{{ joseph-kill-region-or-line
;;我写的一个函数,如果有选中区域,则kill选区,否则删除当前行
;;注意当前行并不代表整行,它只删除光标到行尾的内容,也就是默认情况下
;;C-k 所具有的功能
(defun joseph-kill-region-or-line  (  &optional arg)
  "this function is a wrapper of (kill-line).
   When called interactively with no active region, this function
  will call (kill-line) ,or kill the region."
  (interactive "P")
  (if mark-active
      (if (= (region-beginning) (region-end) ) (kill-line arg) 
          (kill-region (region-beginning) (region-end) )
        )
    (kill-line arg)
    )
  )
(global-set-key "\C-k" 'joseph-kill-region-or-line )
(global-unset-key "\C-w")  ;C-k 现在完全具有C-w的功能, 所以取消C-w的键定义
;;}}}

;;{{{ 智能选中区域
;;根据光标所在位置的字符，智能标记区域。如果光标在一个单词上，
;;那就标记这个单词。如果光标在一个括号上，那么就标记括号对之间的内容。调用快捷键是 C-3
(defun wcy-mark-some-thing-at-point()
  (interactive)
  (let* ((from (point))
         (a (mouse-start-end from from 1))
         (start (car a))
         (end (cadr a))
         (goto-point (if (= from start )
                       end
                       start)))
    (if (eq last-command 'wcy-mark-some-thing-at-point)
      (progn
        ;; exchange mark and point
        (goto-char (mark-marker))
        (set-marker (mark-marker) from))
      (push-mark (if (= goto-point start) end start) nil t)
      (when (and (interactive-p) (null transient-mark-mode))
        (goto-char (mark-marker))
        (sit-for 0 500 nil))
      (goto-char goto-point))))
(define-key global-map (kbd "C-3") 'wcy-mark-some-thing-at-point)
(define-key global-map (kbd "M-C-SPC") 'wcy-mark-some-thing-at-point)

;;}}}

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
(add-to-list 'default-frame-alist  '(cursor-color . "white") )
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11"))
;(set-default-font "Bitstream Vera Sans Mono-12")
(set-default-font "DejaVu Sans Mono-11")

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

(provide 'joseph_clipboard_and_encoding)
