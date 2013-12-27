(when (equal system-type 'windows-nt)
  (setq helm-gtags-tag-location-alist
        '(
          ;; (c-mode  "/usr/include/" "/usr/kernel/")
          (c++-mode
           "d:/usr/mingw/include/")))
  (setq-default ac-clang-flags
                (mapcar (lambda (item)(concat "-I" item))
                        (split-string
                         ;; 或者如果没装mingw的g++
                         ;;也可以用vs下的include
                         ;; D:/usr/vs2010/VC/include
                         ;; 似乎w32上的clang 必须装vs2010才能运行
                         "
                 d:/usr/mingw/include/
                 d:/usr/mingw/lib/gcc/mingw32/4.8.1/include/c++/
                 d:/usr/mingw/lib/gcc/mingw32/4.8.1/include/c++/backward
                 d:/usr/mingw/lib/gcc/mingw32/4.8.1/include/c++/bits
                 d:/usr/mingw/lib/gcc/mingw32/4.8.1/include/c++/debug
                 d:/usr/mingw/lib/gcc/mingw32/4.8.1/include/c++/decimal
                 d:/usr/mingw/lib/gcc/mingw32/4.8.1/include/c++/ext
                 d:/usr/mingw/lib/gcc/mingw32/4.8.1/include/c++/mingw32
                 d:/usr/mingw/lib/gcc/mingw32/4.8.1/include/c++/parallel
                 d:/usr/mingw/lib/gcc/mingw32/4.8.1/include/c++/profile
                 d:/usr/mingw/lib/gcc/mingw32/4.8.1/include/c++/tr1
                 d:/usr/mingw/lib/gcc/mingw32/4.8.1/include/c++/tr2
                 d:/usr/mingw/lib/gcc/mingw32/4.8.1/include-fixed/
                 d:/usr/mingw/lib/gcc/mingw32/4.8.1/include/")))



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
