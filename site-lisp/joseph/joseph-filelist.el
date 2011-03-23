(defvar joseph-anything-find-in-filelist-file-name "~/.emacs.d/cache/filelist")
(setq joseph-anything-find-in-filelist-buffer
      (with-current-buffer (find-file-noselect joseph-anything-find-in-filelist-file-name)
        (rename-buffer  " *anything filelist 4 windows*")  
          )
  )
(defun joseph-anything-find-in-filelist-init()
    (with-current-buffer (anything-candidate-buffer 'global)
      (insert-buffer joseph-anything-find-in-filelist-buffer)
      ))

(setq anything-c-source-joseph-filelist
  '((name . "Find file in filelist")
    (init . joseph-anything-find-in-filelist-init)
    (candidates-in-buffer)
    (type . file)
    ))
