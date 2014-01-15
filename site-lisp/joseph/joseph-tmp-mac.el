;;; Code:

(setq helm-gtags-tag-location-alist
      '(
        (c-mode  "/usr/include/")
        (c++-mode
         "/usr/include/"
         "/Users/jishuuhou/repos/squirrel/librime/thirdparty/include"
         "/Users/jishuuhou/repos/squirrel/librime/include"
         "/usr/local/Cellar/opencv/2.4.7.1/include/"
         ;; "/usr/include/c++/4.2.1/"
         )))
(setq-default ac-clang-flags
              (mapcar (lambda (item)(concat "-I" item))
                      (split-string
                       "
/usr/local/Cellar/opencv/2.4.7.1/include/
/Users/jishuuhou/repos/squirrel/librime/include
/Users/jishuuhou/repos/squirrel/librime/thirdparty/include
./
../
../include/
./include/
usr/include/c++/4.2.1/
usr/include/
usr/include/c++/4.2.1/backward
usr/include/c++/4.2.1/bits
usr/include/c++/4.2.1/debug
usr/include/c++/4.2.1/ext
usr/include/c++/4.2.1/tr1")))

(setq flymake-cc-additional-compilation-flags ;flymake for c++ c
      (mapcar (lambda (item)(concat "-I" item))
              (split-string

               "
/usr/local/Cellar/opencv/2.4.7.1/include/
/Users/jishuuhou/repos/squirrel/librime/thirdparty/include
/Users/jishuuhou/repos/squirrel/librime/include ./ ../ ../include/ ./include/")))

(provide 'joseph-tmp-mac)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-tmp-mac.el ends here
