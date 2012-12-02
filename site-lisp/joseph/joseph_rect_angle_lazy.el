;;; Code:
(eval-when-compile
  (require 'cl)
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include))

(defun goto-longest-region-line (beg end)
  "Find the longest line in region and go to it."
  (let* ((real-end  (save-excursion (goto-char end) (end-of-line) (point)))
         (buf-str   (buffer-substring beg real-end))
         (line-list (split-string buf-str "\n"))
         (longest   0)
         (count     0)
         nth-longest-line)
    (loop for i in line-list
         do (progn
              (when (> (length i) longest)
                (setq longest (length i))
                (setq nth-longest-line count))
              (incf count)))
    (goto-char beg)
    (forward-line nth-longest-line)))

;以最长的line 为准， 跳到行末
;;;###autoload
(defun extend-rectangle-to-end (beg end)
  "Create a rectangle based on the longest line of region."
  (interactive "r")
  (let ((longest-len (save-excursion
                       (goto-longest-region-line beg end)
                       (length (buffer-substring (point-at-bol) (point-at-eol)))))
        column-beg column-end)
    (goto-char beg) (setq column-beg (current-column))
    (save-excursion (goto-char end) (setq column-end (current-column)))
    (if (not (eq column-beg column-end))
        (progn
          (while (< (point) end)
            (goto-char (point-at-eol))
            (let ((len-line (- (point-at-eol) (point-at-bol))))
              (when (< len-line longest-len)
                (let ((diff (- longest-len len-line)))
                  (insert (make-string diff ? ))
                  (setq end (+ diff end)))))
            (forward-line))
          ;; Go back to END and end-of-line to be sure END is there.
          (goto-char end) (end-of-line) (setq end (point))
          ;; Go back to BEG and push mark to new END.
          (goto-char beg)
          (push-mark end 'nomsg 'activate)
          (setq deactivate-mark  nil))
      (deactivate-mark 'force)
      (error "Error: not in a rectangular region."))))

(provide 'joseph_rect_angle_lazy)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph_rect_angle_lazy.el ends here
