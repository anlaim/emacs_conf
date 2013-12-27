; {%org-mode%}
; here are 20 hanzi and 40 english chars, see if they are the same width
; 你你你你你你你你你你你你你你你你你你你你
; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
; /aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/
; {%/org-mode%}
;; | map      |               |
;; | set      |               |
;; | multimap | key可多次出现 |
;; | multiset |               |


(setq-default my-defalut-english-fontsize 12.5)

(defun get-my-favorate-english-font()
  (my-make-font-string (cl-find-if
                        #'my-font-existsp
                        '( "Courier New" "DejaVu Sans Mono"
                           "Consolas" "Monaco"
                          "Monospace"))
                       my-defalut-english-fontsize))

(defun get-my-favorate-zh-font()
  (font-spec :family (cl-find-if
                      #'my-font-existsp
                      '("Microsoft Yahei" "新宋体" "宋体"
                        "微软雅黑"
                        "文泉驿等宽微米黑" "黑体"
                         ))))

(defun my-font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(defun my-make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s-%s" font-name font-size)))

(set-face-attribute 'default nil :font (get-my-favorate-english-font)) ;englisth font

(dolist (charset '(kana han cjk-misc bopomofo))
      (set-fontset-font t charset (get-my-favorate-zh-font)))




(defvar bhj-english-font-size-steps '(10.5 11 11.5 12 12.5 13 13.5 14 15 16 17 18 22))
(defvar bhj-english-font-size-steps-dec (reverse bhj-english-font-size-steps))

(defun bhj-step-frame-font-size (step)
  (let ((steps bhj-english-font-size-steps)
        next-size)
    (if (< step 0)
        (setq steps bhj-english-font-size-steps-dec))
    (setq next-size
          (cadr (member my-defalut-english-fontsize steps)))
    (when next-size
        ;; (message  "Your font size is set to %.1f" next-size)
        (setq my-defalut-english-fontsize next-size)
        (set-face-attribute 'default nil :font (get-my-favorate-english-font))
        next-size)))

(global-set-key [(control x) (meta -)]
                (lambda ()
                  (interactive)
                  (with-easy-repeat (bhj-step-frame-font-size -1))))

(global-set-key [(control x) (meta =)]
                (lambda () (interactive)
                  (with-easy-repeat (bhj-step-frame-font-size 1))))

(provide 'joseph-font)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-font.el ends here
