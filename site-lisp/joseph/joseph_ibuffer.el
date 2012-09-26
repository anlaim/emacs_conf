;;; -*- coding:utf-8 -*-
;;ibuffer 的管理
;;n p 上下，m进行标记 D标记为删除（关闭buffer） x关闭标记的buffer
;; = 进行diff操作（已保存的与buffer中的）
;;O 过滤标记的buffer ，在搜索进行搜索，显示搜索结果

(eval-when-compile
  (require 'ibuf-macs))

(require 'ibuf-ext)
(setq ibuffer-modified-char ?m);; 用m 字符表示modified的buffer
(setq ibuffer-read-only-char ?r);;用r 表示只读buffer
(setq ibuffer-show-empty-filter-groups nil);;不显示没有任何buffer的空分组
(setq ibuffer-default-sorting-mode (quote major-mode)) ;;排序

;;隐藏所有以*helm开头的buffer
;;(add-to-list 'ibuffer-never-show-predicates "^\\*helm")
;;ibuffer分组
(setq ibuffer-saved-filter-groups
      '(("Default"
         ("Hidden"  (name . "^ "))
         ("Helm"  (or (name . "^\\*helm\\|^\\*ac-mode-")))
         ("Woman"  (name . "^\\*WoMan.*\\*$"))
         ("Compile"  (name . "^*.*compil[ea].*$"))
         ("Gtalk"  (or (name . "^\\*.*jabber") (name . "*fsm-debug*")))
         ("ERC"  (mode . erc-mode))
         ("Custom"  (mode . Custom-mode))
         ("Shell"  (mode . shell-mode))
         ("Emacs"  (name . "^\\*.*$"))
         ("Mail" (or (mode . mew-summary-mode) (mode . mew-draft-mode)(mode . mew-message-mode)))
         ("VC"  (or (name . "*magit") (name . "^\\*vc")(mode . diff-mode) (mode . vc-dir-mode)))
         ("Dired"  (mode . dired-mode))
         )))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)       ;自动更新*Ibuffer* buffer
            (ibuffer-switch-to-saved-filter-groups "Default")))

(defun donot-show-helm-buf(buf)
  "不显示*helm* 的buffer"
  (and (string-match "^\\*helm\\|^\\*ac-mode-"
                     (buffer-name buf))
       (null buffer-file-name)))

(defun donot-show-distel-buf(buf)
  "不显示erlang distel相关buf"
  (and (string-match "\\*reg group-leader\\*\\|\\*trace emacs@jf\\\\\\.org\\*"
                     (buffer-name buf))
       (null buffer-file-name)))

(add-to-list 'ibuffer-maybe-show-predicates 'donot-show-distel-buf)

(add-to-list 'ibuffer-maybe-show-predicates 'donot-show-helm-buf)
;;设置默认不显示maybe-show-predicates的buffer (即隐藏上面Hidden分组里的内容)
(setq ibuffer-default-display-maybe-show-predicates nil)
;;toggle 显示上面的 Hidden分组里的内容
(defun ibuffer-toggle-maybe-show()
  (interactive)
  (setq ibuffer-default-display-maybe-show-predicates
        (not ibuffer-default-display-maybe-show-predicates))
  (kill-buffer "*Ibuffer*")
  (ibuffer)
  )
(define-key ibuffer-mode-map "r" 'ibuffer-toggle-maybe-show)
;; (define-key ibuffer-mode-map "g" 'ibuffer-toggle-maybe-show)



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
;;;; ibufer-vc
;; (require 'ibuffer-vc)
;; (defadvice ibuffer (around vc-root activate)
;;   "add vc-root filter group to `ibuffer-saved-filter-groups' dymanically"
;;   (let ((first-filter-group (car  ibuffer-saved-filter-groups))
;;         (tmp-filter-groups ibuffer-saved-filter-groups)
;;         (ibuffer-saved-filter-groups nil))
;;     (mapcar
;;      (lambda (filter)
;;        (add-to-list 'first-filter-group filter t))
;;      (ibuffer-vc-generate-filter-groups-by-vc-root))
;;     (setcar tmp-filter-groups first-filter-group)
;;     (setq ibuffer-saved-filter-groups tmp-filter-groups)
;;     ad-do-it  )
;;   )

;; (define-ibuffer-column vc-status
;;   (:name "VC-Status" :inline t)
;;   (ibuffer-vc--status-string))

;; ;; Use human readable Size column instead of original one
;; (define-ibuffer-column size-h
;;   (:name "Size" :inline t)
;;   (cond
;;    ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
;;    ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
;;    (t (format "%8d" (buffer-size)))))

;;;; other
(setq ibuffer-filter-group-name-face 'font-lock-doc-face)
;; 可读性好的size
(define-ibuffer-column size-h
  (:name "Size" :inline t)
  (cond
   ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
   ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
   (t (format "%8d" (buffer-size)))))
;;设置buffer中每一行的显示格式
(setq ibuffer-formats
      '((mark modified read-only  " "
              (name 30 30 :left :elide) " " ;buffer-name 宽度30 靠左
              (size-h 9 -1 :right) " " ;应用可读性好的 file size
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " " (name 24 -1) " " filename)))
;;; Ediff
(define-key ibuffer-mode-map "b" 'ibuffer-ediff-merge)
(define-key ibuffer-mode-map (kbd "C-=") 'ibuffer-ediff-merge)

;;;; tail.
(provide 'joseph_ibuffer)
