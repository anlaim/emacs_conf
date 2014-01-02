(eval-when-compile (require 'evil))
;; http://vimcdoc.sourceforge.net/doc/motion.html
;; vim 里的 w 对单词进行操作，  此处定义一个o 对 symbol 进行操作
;; w  dw yw yaw daw
;; o  do yo yao dao
;; o光标移到下一个symbol的开头
;; O光标移到上一个symbol的开头
(defun evil-forward-symbol1 (count)
  "与系统自带的`forward-symbol' 不同是，向后的时候search不到，报错"
  (if (natnump count)
      (re-search-forward  "\\(\\sw\\|\\s_\\)+" nil 'move count)
    (prog1 (re-search-backward "\\(\\sw\\|\\s_\\)+" nil 'move)
      (skip-syntax-backward "w_"))))

(defun evil-forward-symbol (&optional count)
  (setq count (or count 1))
  (let* ((dir (if (>= count 0) +1 -1))
         (count (abs count)))
    (while (and (> count 0)
                (evil-forward-symbol1 dir))
      (setq count (1- count)))
    count))

(evil-define-union-move evil-move-symbol (count)
  "Move by symbols."
  (evil-forward-symbol count)
  (evil-move-empty-lines count))

(evil-define-motion evil-forward-symbol-begin (count)
  "Move the cursor to the beginning of the COUNT-th next symbol."
  :type exclusive
  (evil-move-beginning count #'evil-move-symbol))
(evil-define-motion evil-backward-symbol-begin (count)
  "Move the cursor to the beginning of the COUNT-th previous symbol."
  :type exclusive
  (evil-move-beginning (- (or count 1)) #'evil-move-symbol))

(evil-define-motion evil-forward-symbol-end (count)
  "Move the cursor to the end of the COUNT-th next symbol."
  :type inclusive
  (evil-move-end count #'evil-move-symbol nil t))

(evil-define-motion evil-backward-symbol-end (count)
  "Move the cursor to the end of the COUNT-th previous symbol."
  :type inclusive
  (evil-move-end (- (or count 1)) #'evil-move-symbol nil t))

(evil-define-text-object evil-my-a-symbol (count &optional beg end type)
  "Select a symbol."
  (evil-an-object-range count beg end type #'evil-move-symbol))

(evil-define-text-object evil-my-inner-symbol (count &optional beg end type)
  "Select inner symbol."
  (evil-inner-object-range count beg end type #'evil-move-symbol))

;; 而 dio yio dao yao 等操作,根据text object来完成
(define-key evil-outer-text-objects-map (kbd "e") #'evil-my-a-symbol) ;dao 删除一个symbol(包括前后的空格)
(define-key evil-inner-text-objects-map (kbd "e") #'evil-my-inner-symbol) ;dio 删除一个symbol
;; 我想要的结果是  按下 o O 移到到symbol的开头
;; 但是 d y c 对其进行操作的时候，针对symbol 的end 来判断边界，
;; 移动到开头的时候， 是移动到下一个symbol的开头， 所以正常do 是删除从光标到下一个symbol的开头
;; 如此一业， 删除的就不是当前symbol了
(define-key evil-motion-state-map (kbd "e") #'evil-forward-symbol-end) ;do 删除光标到symbol end
(define-key evil-motion-state-map (kbd "E") #'evil-backward-symbol-begin) ;dO 删除光标到symbol begin
(define-key evil-motion-state-map (kbd "r") #'evil-forward-symbol-end) ;
(define-key evil-motion-state-map (kbd "R") #'evil-backward-symbol-end) ;dO 删除光标到symbol begin
(define-key evil-motion-state-map (kbd "C-r") #'evil-forward-symbol-end) ;dO 删除光标到symbol begin
;; normal state 的keybinding 比evil-motion-state-map的高，所以移动的时候，
;; evil-normal-state-map的绑定有有效
;; 而 do yo co dO yO cO  的操作 依然根据evil-motion-state-map定义的行为来界定
(define-key evil-normal-state-map (kbd "e") #'evil-forward-symbol-begin)
(define-key evil-normal-state-map (kbd "E") #'evil-backward-symbol-begin)

(define-key evil-visual-state-map (kbd "e") #'evil-forward-symbol-begin)
(define-key evil-visual-state-map (kbd "E") #'evil-backward-symbol-begin)

(define-key evil-visual-state-map (kbd "C-r") #'evil-forward-symbol-end) ;dO 删除光标到symbol begin
(define-key evil-visual-state-map (kbd "R") #'evil-backward-symbol-end) ;dO 删除光标到symbol begin
(define-key evil-visual-state-map (kbd "r") #'evil-forward-symbol-end) ;

(provide 'joseph-evil-symbol)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-evil-symbol.el ends here

