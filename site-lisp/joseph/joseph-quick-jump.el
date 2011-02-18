;;此段代码用于快速跳转,主要用于代码浏览或代码编写时在多个大跨度的位置间进行切换时使用
;;以我的键绑定为例
;;
;; (global-set-key (kbd "C-.") 'joseph-quick-jump-push-marker)
;;
;; (global-set-key (kbd "C-,") 'joseph-quick-jump-history-go-back)
;; (global-set-key (kbd "C-<") 'joseph-quick-jump-history-go-forward)
;;
;;最简单的使用方法
;;`C-.' 会记录当前光标的位置
;;`C-,' 跳回到`C-.' 所记录的位置
;;当然你可以在文件不同的位置多处按下`C-.' ,而`C-,'则会按照先后顺序遍历这些位置
;;
;;
;;但上面的使用方法有个弊端,必须先经`C-.' 保存位置后,才可以`C-,' 进行跳转,有时会忘掉`C-.',以
;; 致无法跳转到这个位置.
;;为了解觉这个问题 ,`C-,'不但可以进行跳转,也会根据当前的位置在特定的情况下自动将当前位置加入到
;;循环队列中.
;;(print joseph-quick-jump-marker-ring)

(defvar joseph-quick-jump-current-marker nil)
(defvar joseph-quick-jump-marker-ring (make-ring 5))
(defvar joseph-quick-jump-previous-action-flag nil)
(defvar joseph-quick-jump-line-count 10)

;;; util func
(defun joseph-quick-jump-is-marker-available(marker)
  "return nil if marker is nil or  in dead buffer ,
   return marker if it is live"
  (if (and marker
           (markerp marker)
           (marker-buffer marker))
      marker))

(defmacro if+ (test-form then-form &rest else-forms)
  "Anaphoric if. Temporary variable `it'
  is the result of test-form.(borrowed from anything.el)"
  `(let ((it ,test-form))
     (if it ,then-form ,@else-forms)))
;;; funcs
(defun joseph-quick-jump-history-init()
  "remove #<marker in no buffer> from `joseph-quick-jump-marker-ring'."
      (let ((tmp-marker-ring))
        (while (not (ring-empty-p joseph-quick-jump-marker-ring))
          (if+ (joseph-quick-jump-is-marker-available (ring-remove joseph-quick-jump-marker-ring 0))
              (setq tmp-marker-ring (append tmp-marker-ring (list it)));;new item first
              (while (not (ring-empty-p joseph-quick-jump-marker-ring));;remove all old marker
              (ring-remove joseph-quick-jump-marker-ring))))
        ;;reinsert all available marker to `joseph-quick-jump-marker-ring'
        (mapcar (lambda(marker) (ring-insert-at-beginning joseph-quick-jump-marker-ring marker)) tmp-marker-ring))
      ;;add (point-marker) to marker-ring, when ...
        (when (and (not (ring-empty-p joseph-quick-jump-marker-ring))
                   (not (ring-member joseph-quick-jump-marker-ring (point-marker)))
                    (or (not (equal (marker-buffer joseph-quick-jump-current-marker) (current-buffer)))
                       (>  (count-lines  (point) (marker-position joseph-quick-jump-current-marker)) joseph-quick-jump-line-count)))
          (ring-insert joseph-quick-jump-marker-ring (point-marker)))
        
        (when (ring-empty-p joseph-quick-jump-marker-ring)
          (message "please push marker before jumping. using `joseph-quick-jump-push-marker'")))



(defun joseph-quick-jump-history-action-go(marker)
  "Go to location."
  (let ((buf (marker-buffer marker))
        (pos (marker-position marker)))
    (when buf
      (switch-to-buffer buf)
      (set-buffer buf)
      (goto-char pos)))
  (setq joseph-quick-jump-current-marker marker))

(defun joseph-quick-jump-push-marker()
  (interactive)
  (when (not (ring-member joseph-quick-jump-marker-ring (point-marker)))
    (ring-insert joseph-quick-jump-marker-ring (point-marker)))
  (setq joseph-quick-jump-current-marker (point-marker))
  (message "a marker is pushed."))

(defun joseph-quick-jump-history-go-back()
  "Go Back. "
  (interactive)
  (joseph-quick-jump-history-init)
  (when (and
         (joseph-quick-jump-is-marker-available joseph-quick-jump-current-marker)
         (ring-member joseph-quick-jump-marker-ring joseph-quick-jump-current-marker))
    (when (and (not (equal joseph-quick-jump-previous-action-flag "back"))
               (equal (current-buffer) (marker-buffer joseph-quick-jump-current-marker))
               (<  (count-lines  (point) (marker-position joseph-quick-jump-current-marker)) joseph-quick-jump-line-count))
      (setq joseph-quick-jump-current-marker (ring-next joseph-quick-jump-marker-ring joseph-quick-jump-current-marker)))
    
    (message (concat  "jump to " (prin1-to-string joseph-quick-jump-current-marker)))
    (joseph-quick-jump-history-action-go joseph-quick-jump-current-marker)
    
    (setq joseph-quick-jump-current-marker (ring-next joseph-quick-jump-marker-ring joseph-quick-jump-current-marker))
    (setq joseph-quick-jump-previous-action-flag "back")))

(defun joseph-quick-jump-history-go-forward()
  "Go Back. "
  (interactive)
  (joseph-quick-jump-history-init)
  (when (and
         (joseph-quick-jump-is-marker-available joseph-quick-jump-current-marker)
         (ring-member joseph-quick-jump-marker-ring joseph-quick-jump-current-marker))
    (when (and (not (equal joseph-quick-jump-previous-action-flag "forward"))
               (equal (current-buffer) (marker-buffer joseph-quick-jump-current-marker))
               (<  (count-lines  (point) (marker-position joseph-quick-jump-current-marker)) joseph-quick-jump-line-count)) 
      (setq joseph-quick-jump-current-marker (ring-previous joseph-quick-jump-marker-ring joseph-quick-jump-current-marker)))
    
    (message (concat  "jump to " (prin1-to-string joseph-quick-jump-current-marker)))
    (joseph-quick-jump-history-action-go joseph-quick-jump-current-marker)
    
    (setq joseph-quick-jump-current-marker (ring-previous joseph-quick-jump-marker-ring joseph-quick-jump-current-marker))
    (setq joseph-quick-jump-previous-action-flag "forward")))


(defun joseph-quick-jump-clear-all-marker()
  "clear all marker."
  (interactive)
  (message "clear all marker for joseph-quick-jump.")
  (setq joseph-quick-jump-previous-action-flag nil)
  (setq joseph-quick-jump-current-marker nil)
  (while (not (ring-empty-p joseph-quick-jump-marker-ring))
    (ring-remove joseph-quick-jump-marker-ring)))


(global-set-key (kbd "C-,") 'joseph-quick-jump-history-go-back)
(global-set-key (kbd "C-.") 'joseph-quick-jump-push-marker)
(global-set-key (kbd "C-<") 'joseph-quick-jump-history-go-forward)
(global-set-key (kbd "C->") 'joseph-quick-jump-clear-all-marker)

(provide 'joseph-quick-jump)

;;;joseph-quick-jump.el ends here.

