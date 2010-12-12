;;{{{ 关于剪切板
;;关于剪切板 X共享信息的有 clipboard primary secondary 三个区域
;;;;make the Emacs yank functions consult the clipboard before the primary selection, 
;;;;and to make the kill functions to store in the clipboard as well as the primary selection
(setq x-select-enable-clipborad t) ;选区使用clipboard 存放
;;;;These commands actually check the primary selection before referring to the kill ring; 
;;;;if no primary selection is available, the kill ring contents are used. 
;;;To prevent yank commands from accessing the primary selection
;;;因为设置了kill yank 均使用clipboard ，所以不使用primary
(setq x-select-enable-primary  t)
;;;;the region is saved to the primary selection whenever you activate the mark. 
;;;;Each change to the region also updates the primary selection.
(setq select-active-regions  t);
;;;each kill command first saves the existing selection onto the kill ring.
;;; This prevents you from losing the existing selection,
;;; at the risk of large memory consumption if other applications generate large selections
(setq  save-interprogram-paste-before-kill t)

;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(global-set-key (kbd "C-w") 'clipboard-kill-region) ;cut kills the region and saves it in the clipboard. 
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save);copy copies the region to the kill ring and saves it in the clipboard 
(global-set-key  (kbd "C-y") 'clipboard-yank)  ;;paste yanks the contents of the clipboard at point 
;默认情况下M-w复制一个区域，但是如果没有区域被选中，则复制当前行
;; (defadvice kill-ring-save (before slickcopy activate compile)
;;   "When called interactively with no active region, copy a single line instead."
;;   (interactive
;;    (if mark-active (list (region-beginning) (region-end))
;;      (list (line-beginning-position)
;;            (line-beginning-position 2)))))
;; ;默认情况下C-w剪切一个区域，但是如果没有区域被选中，则剪切当前行
;; (defadvice kill-region (before slickcut activate compile)
;;   "When called interactively with no active region, kill a single line instead."
;;   (interactive
;;    (if mark-active (list (region-beginning) (region-end))
;;      (list (line-beginning-position)
;;            (line-beginning-position 2)))))
;;此函数实现的功能，当未选中任何区域时M-w 操作则复制当前行(使用clipboard时)
(defadvice clipboard-kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;默认情况下C-w剪切一个区域，但是如果没有区域被选中，则剪切当前行
(defadvice clipboard-kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(delete-selection-mode t) ;;当选中内容时，输入新内容则会替换掉
;;}}}


;;{{{ 关于utf-8编码 ,字符集的选用
;; For my language code setting (UTF-8)设置编码
;(set-clipboard-coding-system 'chinese-iso-8bit) ;; 如果不设，在emacs 剪切的中文没法在其他程序中粘贴
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
("MuleArabic-2" (arabic-2-column . 0))) font-encoding-alist))
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
