;; (setq helm-gtags-tag-location-alist
;;       '(
;;         ;; (c-mode  "/usr/include/" "/usr/kernel/")
;;         (c++-mode  "/Volumes/data/repos/opencd/opencv-2.4.6.1/")))

;; (setq-default ac-clang-flags
;;               (mapcar (lambda (item)(concat "-I" item))
;;                       (split-string
;;                        "usr/include/c++/4.2.1/
;;                             usr/include/c++/4.2.1/backward
;;                             usr/include/c++/4.2.1/bits
;;                             usr/include/c++/4.2.1/debug
;;                             usr/include/c++/4.2.1/ext
;;                             usr/include/c++/4.2.1/tr1")))

(when (equal system-type 'windows-nt)
  ;; do sth
  nil)

(when (equal system-type 'darwin)
  ;; do sth
  nil)

(when (equal system-type 'gnu/linux)
  ;; do sth
  nil)

(provide 'joseph-tmp)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-tmp.el ends here
