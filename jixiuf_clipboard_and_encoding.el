;;关于剪切板 X共享信息的有 clipboard primary secondary 三个区域
;;;;make the Emacs yank functions consult the clipboard before the primary selection, 
;;;;and to make the kill functions to store in the clipboard as well as the primary selection
(setq x-select-enable-clipborad t) ;选区使用clipboard 存放
;;;;These commands actually check the primary selection before referring to the kill ring; 
;;;;if no primary selection is available, the kill ring contents are used. 
;;;To prevent yank commands from accessing the primary selection
;;;因为设置了kill yank 均使用clipboard ，所以不使用primary
(setq x-select-enable-primary  nil)
;;;;the region is saved to the primary selection whenever you activate the mark. 
;;;;Each change to the region also updates the primary selection.
(setq select-active-regions  nil);
;;;each kill command first saves the existing selection onto the kill ring.
;;; This prevents you from losing the existing selection,
;;; at the risk of large memory consumption if other applications generate large selections
(setq  save-interprogram-paste-before-kill t)

;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(global-set-key (kbd "C-w") 'clipboard-kill-region) ;cut kills the region and saves it in the clipboard. 
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save);copy copies the region to the kill ring and saves it in the clipboard 
(global-set-key  (kbd "C-y") 'clipboard-yank)  ;;paste yanks the contents of the clipboard at point 
;默认情况下M-w复制一个区域，但是如果没有区域被选中，则复制当前行
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;默认情况下C-w剪切一个区域，但是如果没有区域被选中，则剪切当前行
(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(delete-selection-mode t) ;;当选中内容时，输入新内容则会替换掉


(set-clipboard-coding-system 'chinese-iso-8bit) ;; 如果不设，在emacs 剪切的中文没法在其他程序中粘贴
;(set-clipboard-coding-system 'ctext)
;; For my language code setting (UTF-8)设置编码
 (setq current-language-environment "UTF-8")
 (setq locale-coding-system 'utf-8)
 (set-terminal-coding-system 'utf-8)
 (set-keyboard-coding-system 'utf-8)
 (set-selection-coding-system 'utf-8)
 (prefer-coding-system 'utf-8)
;;;;copy 整个缓冲区到剪切板，与其他程序共享
(global-set-key [C-f5] 'my-copy-buffer)
(defun my-copy-buffer ()
  "copy whole buffer to clipboard."
  (interactive)
  (beginning-of-buffer)
  (setq start (point))
  (end-of-buffer)
  (setq end (point))
  (clipboard-kill-ring-save start end)
  )

(provide 'jixiuf_clipboard_and_encoding)