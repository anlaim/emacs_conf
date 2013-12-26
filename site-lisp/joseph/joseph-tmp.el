(when (equal system-type 'windows-nt)
  (setq helm-gtags-tag-location-alist
        '(
          ;; (c-mode  "/usr/include/" "/usr/kernel/")
          (c++-mode
           "d:/usr/mingw/include/")))


  ;; do sth
  nil)

(when (equal system-type 'darwin)
  (setq helm-gtags-tag-location-alist
        '(
          (c-mode  "/usr/include/")
          (c++-mode
           "/usr/include/"
           ;; "/usr/include/c++/4.2.1/"
           )))
  (setq-default ac-clang-flags
                (mapcar (lambda (item)(concat "-I" item))
                        (split-string
                         "usr/include/c++/4.2.1/
                            usr/include/
                            usr/include/c++/4.2.1/backward
                            usr/include/c++/4.2.1/bits
                            usr/include/c++/4.2.1/debug
                            usr/include/c++/4.2.1/ext
                            usr/include/c++/4.2.1/tr1")))


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
