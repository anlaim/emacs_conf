;; -*- coding:utf-8 -*-
(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_jad_decompile_lazy))

;; a hook to be able to automatically decompile-find-file .class files
(defun jad-find-file-hook()
  (when (string-match "\\.class$" (buffer-file-name))
    (jdc-buffer)))

;;;###autoload(add-hook 'find-file-hooks 'jad-find-file-hook)
(add-hook 'find-file-hooks 'jad-find-file-hook)


;;;###autoload(add-hook 'archive-extract-hooks 'jar-archive-extract-hooks)
(add-hook 'archive-extract-hooks 'jar-archive-extract-hooks)

(provide 'joseph_jad_decompile)
