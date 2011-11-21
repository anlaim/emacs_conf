(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include)
  (require 'joseph-util)
  );;; winner-mode 窗口状态的保存
;;----------------------------------------------------------------------------
;; Navigate window layouts with "C-c <left>" and "C-c <right>"
;;----------------------------------------------------------------------------
(winner-mode 1)
(setq winner-boring-buffers '("*Completions*" "*anything*"
                              "*anything buffers*"
                              "*anything for files*"
                              "*anything kill-ring*"
                              "*Anything Completions*"
                              "*Help*"))
;; C-z ppppppp 多次p 前几次的window
(define-key winner-mode-map [(control z) ?p] '(lambda()(interactive) (with-easy-repeat (winner-undo))(setq this-command 'winner-undo)))
(define-key winner-mode-map [(control z) (control p)] '(lambda()(interactive) (with-easy-repeat (winner-undo)) (setq this-command 'winner-undo)))

;; C-z nnnnn 多次n 后几次的window
(define-key  winner-mode-map [(control z) ?n] '(lambda()(interactive) (with-easy-repeat (winner-redo)) (setq this-command 'winner-redo)))
(define-key  winner-mode-map [(control z) (control n)] '(lambda()(interactive) (with-easy-repeat (winner-redo)) (setq this-command 'winner-redo)))


;;; C-x2 ,C-x3 更好的分隔窗口
;;----------------------------------------------------------------------------
;; When splitting window, show (other-buffer) in the new window
;;----------------------------------------------------------------------------
(defvar split-window-status nil)
(defun split-window-func-with-other-buffer-horizontally()
  (interactive)
  (split-window-horizontally)
  (setq split-window-status 'horizontally)
  (set-window-buffer (next-window) (other-buffer))
  )
(defun split-window-func-with-other-buffer-vertically()
  (interactive)
  (split-window-vertically)
  (setq split-window-status 'vertically)
  (set-window-buffer (next-window) (other-buffer))
  )

(global-set-key "\C-x2" 'split-window-func-with-other-buffer-vertically )
(global-set-key "\C-x3"  'split-window-func-with-other-buffer-horizontally)


;;----------------------------------------------------------------------------
;; Rearrange split windows
;;----------------------------------------------------------------------------
(defun toggle-split-window-horizontally-vertically()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (if (equal split-window-status 'horizontally)
        (split-window-func-with-other-buffer-vertically)
      (split-window-func-with-other-buffer-horizontally)
      )
    ))

(global-set-key "\C-w3" 'toggle-split-window-horizontally-vertically)

;shift + 上下左右键，在各窗口间跳转。
(windmove-default-keybindings 'shift)


;;; windresize 调整窗口大小。
;; o:  other-window
;; 1 2 3 分隔窗口
;; s:  save window configuration保存当前窗口config,可用 r 恢复之
;; = 合理均分各窗口大小
;; + -调整步幅
;; / alt+/ 扩大或缩小当前窗口
;; q 退出。
;; return 设定完毕退出
;; (require 'windresize)
(global-set-key [f4] 'windresize)
(eval-after-load 'windresize
  '(progn
     (setq windresize-default-increment 2) ;;每一次的调整步幅
     ;; 默认是使用上下左右键在窗口间跳转，及调整窗口大小等，我把所有这些操作也转到hjkl 四个键上。
     ;;hlkj 调整大小。
     (define-key  windresize-map  [(?h)] 'windresize-left)
     (define-key  windresize-map  [(?l)] 'windresize-right)
     (define-key  windresize-map  [(?k)] 'windresize-up)
     (define-key  windresize-map  [?j] 'windresize-down)

     ;; Alt+shift + hjkl 选中不同的窗口
     ;;这个其实也可以通过 n ,p 选中上一个，下一个来代劳
     (let ((mod (nth 0 windresize-modifiers)))
       (if (symbolp mod) (setq mod (list mod)))
       (define-key windresize-map (vector (append mod '(?h))) 'windresize-select-left)
       (define-key windresize-map (vector (append mod '(?l))) 'windresize-select-right)
       (define-key windresize-map (vector (append mod '(?k))) 'windresize-select-up)
       (define-key windresize-map (vector (append mod '(?j))) 'windresize-select-down))

     ;; 这一组不太常用，一般不会开那么多窗口
     ;;Alt+ hjkl Alt+ 上面左右
     ;; 当一个窗口上下或左右两边界都可高时，Alt + hjkl 调整另外一边，
     ;; 这个其实可以先按下空格后，上下左右，hjkl 键的操作就是针对另一边了
     ;; Move the up/left border instead of bottom/right when there are
     ;; two movable borders
     (let ((mod (nth 1 windresize-modifiers)))
       (if (symbolp mod) (setq mod (list mod)))
       (define-key windresize-map (vector (append mod '(?h))) 'windresize-left-force-left)
       (define-key windresize-map (vector (append mod '(?l))) 'windresize-right-force-left)
       (define-key windresize-map (vector (append mod '(?k))) 'windresize-up-force-up)
       (define-key windresize-map (vector (append mod '(?j))) 'windresize-down-force-up))
     ;; arrows:  move border or resize windows         =:  balance windows
     ;; M-S-arrows:  select adjacent window
     ;; C-M-arrows:  move window with fixed width/height   0:  delete current window
     ;; C-arrows:  temporarilly negate INCREMENT         ~:  negate INCREMENT
     ;; M-arrows:  move with priority to left/up         1:  delete other windows
     ;; i:  set INCREMENT (to numeric prefix)     2:  split window vertically
     ;; +/-:  increase/decrease INCREMENT           3:  split window horizontally
     ;; q:  cancel and quit
     ;; r:  restore window configuration          ?:  show this help window
     ;; SPC:  toggle method: move border, resize  RET:  set and exit

     ;; /:  move right-bottom edge outwards or left-upper edge inwards
     ;; M-/:  move left-upper edge outwards or right-bottom edge inwards
     ;; \\:  move right-upper edge outwards or left-bottom edge inwards
     ;; M-\\:  move left-bottom edge outwards or right-upper edge inwards
     ))


(provide 'joseph-windows)
