;;; -*- coding:utf-8 -*-
(run-with-idle-timer 6 nil '(lambda () (icy-mode 1) (message "Icicle is load ")))

(autoload 'icicle-file  "icicle" "find file use iciles "  t)
(defun list-enabled-minor-modes()
  "list enabled minor-modes "
  (let ((minor-modes))
    (dolist (mode minor-mode-list)
      ;; Document a minor mode if it is listed in minor-mode-alist,
      ;; non-nil, and has a function definition.
      (let ((fmode (or (get mode :minor-mode-function) mode)))
        (and (boundp mode) (symbol-value mode)
             (fboundp fmode)
             (add-to-list 'minor-modes fmode)
             )))
    minor-modes))
;;;###autoload
(defun icicle-file-after-icy-mode-enabled()
  "make sure icicle-mode is enabled when call `icicle-file'"
  (interactive)
  (unless (memq 'icicle-mode (list-enabled-minor-modes))
    (require 'icicles)
    (icicle-mode 1)
    )
  (call-interactively 'icicle-file)
  )
(global-set-key "\C-x\C-f" 'icicle-file-after-icy-mode-enabled)

(eval-after-load 'icicles
  '(progn
     (setq icicle-region-background "blue");;face的设置,可以用custom-group进行设置
     (setq icicle-Completions-window-max-height 16);;设置"*Completions*"窗口的最大行数
     (setq icicle-default-value nil)
     (setq icicle-TAB-completion-methods '(vanilla basic fuzzy))
     (setq icicle-buffer-require-match-flag 'partial-match-ok)
     (setq icicle-incremental-completion-flag (quote always))
     (setq icicle-incremental-completion-delay 0.7)
     (setq icicle-change-sort-order-completion-flag t)
     ;;定义 上一个下一个 选项所用的快捷键,我加入了C-n C-p
     (setq icicle-modal-cycle-down-keys (quote ([down] [nil mouse-5] [mouse-5] [(control ?n)])))
     (setq icicle-modal-cycle-up-keys (quote ([up] [nil mouse-4] [mouse-4] [(control ?p)])))
     (setq icicle-default-cycling-mode (quote prefix))
     ))

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
;;(setq icicle-default-value t)
;;(setq icicle-default-value nil)


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
;;(setq icicle-TAB-completion-methods '(vanilla basic fuzzy))
;;
;;假如有个`new-ideas.txt'的buffer ,切换buffer时,如果仅输入了`new-' 在`RET'的时候
;;会前缀补全为`new-ideas.txt',否则新建buffer:`new-' ,`S-RET' 则apropos补全
;;(setq icicle-buffer-require-match-flag 'partial-match-ok)

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
;;(setq icicle-incremental-completion-flag (quote always))
;;(setq icicle-incremental-completion-delay 0.7)
;;
;;(icicle-ido-like-mode);,会让icicle 表现的更像ido

;;但如果仅想让在处理buffer file 时表现的像ido 可以
;;(setq icicle-buffers-ido-like-flag t)
;;(setq icicle-files-ido-like-flag t)

;;`C-,' 调整排序方式

;;快捷键,比如想查看所有以C-x开头的,
;;只须C-x S-TAB,若不按C-x 直接按S-TAB则显示所有
;;[(control ?g)]

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
;; (defadvice icicle-input-from-minibuffer (around replac-whitespace-with-dot* activate)
;;   "replace whitespace with '.*' so it can work like 'anything'"
;;   ad-do-it
;;   (when (string-match " " ad-return-value)
;;     (let* ((orig-buf-content ad-return-value)
;;            (new-buf-content (replace-regexp-in-string " " ".*" ad-return-value)))
;;       (goto-char (point-min))
;;       (when (search-forward orig-buf-content)
;;         (delete-region (match-beginning 0) (point))
;;         (insert new-buf-content)
;;         ))
;;     (setq ad-return-value (replace-regexp-in-string " " ".*" ad-return-value))
;;     )
;;   )

;;; 排序
;;`C-,' 会依次按照预定的排序方式,给现有的candidates排序
;;设此值为t,则`C-,'时会列出所有的排序方式让你选择
;;(setq icicle-change-sort-order-completion-flag t)
;;定义一种排序方式,先按前缀排序,
(eval-after-load 'icicles
  '(progn
     (icicle-define-sort-command "prefix-first"
                                 prefix-first-p
                                 "Sort completion candidates alphabetically.")

     (defvar icicle-current-completion-mode nil
       "Symbol `prefix' or `apropos', specifying the current completion mode.")
     (defun prefix-first-p( c1 c2)
       (if (and
            ;;此种排序方式仅在apropos mode时起用
            (equal icicle-current-completion-mode 'apropos)
            (stringp c1 )
            (not (equal icicle-common-match-string ""))
            )
           (let ((c1-index (string-match icicle-common-match-string c1))
                 (c2-index (string-match icicle-common-match-string c2))
                 )
             (when (and (not c1-index) (not c2-index)))
             (< c1-index c2-index)
             )
         (icicle-case-string-less-p c1 c2)
         ))
     ;;设置默认使用这种排序方式
     ;;(setq  icicle-sort-comparer ' prefix-first-p)
     (setq icicle-sort-comparer (quote ((icicle-historical-alphabetic-p
                                         prefix-first-p ) nil)))
     ))

;;; 循环到末尾时不闪屏
(eval-after-load 'icicles
  '(progn
     (defadvice icicle-increment-cand-nb+signal-end (around no-ding activate)
       "Disable `ding' when wrapping candidates."
       (flet ((ding ()))
         ad-do-it))
     ))


;;定义 上一个下一个 选项所用的快捷键,我加入了C-n C-p
;;(setq icicle-modal-cycle-down-keys (quote ([down] [nil mouse-5] [mouse-5] [(control ?n)])))
;;(setq icicle-modal-cycle-up-keys (quote ([up] [nil mouse-4] [mouse-4] [(control ?p)])))

;;设置在没按下Tab 或S-TAB 时,按down up 默认使用prefix 还是apropos 进行匹配
;;(setq icicle-default-cycling-mode (quote apropos))
;;(setq icicle-default-cycling-mode (quote prefix))
;;交换Tab 与S-TAB的绑定,我更喜欢用apropos 进行匹配还不是prefix进行匹配,
;;(setq icicle-apropos-complete-keys (quote ([tab])))
;;(setq icicle-prefix-complete-keys (quote ([S-tab] [(control 105)])))

;;(icicle-bind-completion-keys minibuffer-local-completion-map)
;;(define-key [(control ?n)] minibuffer-local-completion-map 'fu)

(eval-after-load 'icicles
  '(progn
  (add-hook 'icicle-mode-hook 'bind-my-icicles-keys)
  (defun bind-my-icicles-keys ()
    "Replace some default Icicles bindings with others I prefer."
    (when icicle-mode
      (dolist (map (append (list minibuffer-local-completion-map
                                 minibuffer-local-must-match-map)
                           (and (boundp 'minibuffer-local-filename-completion-map)
                                (list minibuffer-local-filename-completion-map))))
        (bind-my-icicles-keys--for-completion-map map)
        (bind-my-icicles-keys--for-all-minibuffer-map map))
      (let ((map minibuffer-local-map))
        (bind-my-icicles-keys--for-all-minibuffer-map map))
      (bind-my-icicles-keys--for-icicle-mode-map icicle-mode-map)))
  (defun bind-my-icicles-keys--for-all-minibuffer-map (map)
    (define-key map "\C-e" 'icicle-guess-file-at-point-or-end-of-line)
    (define-key map "\C-k" 'icicle-erase-minibuffer-or-kill-line)  ; M-k or C-k ;;M-k 可以清除minibuffer
    (define-key map  "\C-a"  'icicle-beginning-of-line+)
    (define-key map  "\C-q"  'quoted-insert)
    (define-key map  (kbd  "C-,") 'icicle-up-directory)     ; C-Backspace
    (define-key map  (kbd  "C-o") 'icicle-change-sort-order)     ; C-,
    )
  ;; I think default icicles key bindings are hard to type.
  (defun bind-my-icicles-keys--for-completion-map (map)
    ;; (to "icicle-remap-example")
    ;; C-o is next to C-i.
    (define-key map (kbd "TAB") 'icicle-apropos-complete); TAB
    (define-key map  [?\H-i] 'icicle-apropos-complete)      ; S-Tab C-i
    ;; Narrowing is isearch in a sense. C-s in minibuffer is rarely used.
    (define-key map "\C-s" 'icicle-apropos-complete-and-narrow)     ; S-SPC
    ;; History search is isearch-backward chronologically:-)
    (define-key map "\C-r" 'icicle-history)               ; M-h

    (define-key map "\M-{" 'icicle-previous-prefix-candidate-action) ; C-up
    (define-key map "\M-}" 'icicle-next-prefix-candidate-action) ; C-down
    (define-key map "\C-z" 'icicle-help-on-candidate)            ; C-M-Ret
    (define-key map  "\C-f"  'icicle-candidate-action) ; `C-RET'

    ;; I do not use icicles' C-v M-C-v anymore.
    (define-key map "\C-v" 'scroll-other-window) ; M-C-v
    (define-key map "\M-v" 'scroll-other-window-down)
    )
  (defun bind-my-icicles-keys--for-icicle-mode-map (map)
    ;; These are already bound in global-map. I'll remap them.
    (define-key map [f5] nil)             ; icicle-kmacro
    ;;  (define-key map [pause] nil)          ;
    )
  ;; I had used `ffap' for years, and used ffap's guessing feature.
  (defun icicle-guess-file-at-point ()
    "Guess filename at point by the context and insert it."
    (interactive)
    (require 'ffap-)
    (let ((guessed (with-current-buffer icicle-pre-minibuffer-buffer
                     (ffap-guesser))))
      (when guessed
        (icicle-erase-minibuffer)
        (insert guessed))))
  (defun icicle-guess-file-at-point-or-end-of-line ()
    "This command inserts default filename if point is at the EOL, Because C-e at the EOL is meaningless,"
    (interactive)
    (if (eolp) (icicle-guess-file-at-point))
    (end-of-line))
  (defun icicle-erase-minibuffer-or-kill-line ()
    "C-k at the EOL erases whole minibuffer, if selected region ,kill-region ,or otherwise do the default."
    (interactive)
    (if (eolp)
        (icicle-erase-minibuffer)
      (if mark-active
          (if (= (region-beginning) (region-end) ) (kill-line )
            (kill-region (region-beginning) (region-end) ))
        (kill-line))))

  (defadvice icicle-abort-minibuffer-input (before ding activate)
    "Notify when C-g is pressed."
    (ding))
  )
)
(eval-after-load 'nxml-mode
  '(progn (require 'icicles) (icicle-mode 1))
  )
;;(icicle-mode 1)
 (provide 'joseph-icicle)
