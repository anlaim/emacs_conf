(provide 'joseph-tmp)

;; (require 'helm-config)
;; (require 'helm-gtags)

;; (add-hook 'helm-gtags-mode-hook
;;           '(lambda ()
;;              (setq helm-gtags-tag-location-list '("/Users/jishuuhou/repos/opencd/opencv-2.4.6.1/modules/") )
;;              (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
;;              (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
;;              (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
;;              (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)
;;              (local-set-key (kbd "C-c C-f") 'helm-gtags-find-files)))

(add-hook 'c++-mode-hook '(lambda()
                          ;;'helm-gtags-tag-location-list is a buffer local var
                            (eval-after-load "helm-gtags" '(add-to-list 'helm-gtags-tag-location-list "/Users/jishuuhou/repos/opencd/opencv-2.4.6.1/modules/"))
                            (eval-after-load "helm-gtags" '(add-to-list 'helm-gtags-tag-location-list "/usr/"))
                          ))


;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-tmp.el ends here
