(eval-when-compile (require 'evil))
(eval-when-compile (require 'magit))

(define-key magit-file-section-map "K" 'magit-discard)
(define-key magit-file-section-map "k" nil)
(define-key magit-hunk-section-map "K" 'magit-discard)
(define-key magit-hunk-section-map "k" nil)
(define-key magit-unstaged-section-map "k" nil)
(define-key magit-unstaged-section-map "K" 'magit-discard)
(define-key magit-staged-section-map "K" 'magit-discard)
(define-key magit-staged-section-map "k" nil)
(define-key magit-stash-section-map "K" 'magit-stash-drop)
(define-key magit-stash-section-map "k" nil)
(define-key magit-stashes-section-map "K" 'magit-stash-clear)
(define-key magit-stashes-section-map "k" nil)

(define-key magit-untracked-section-map "K" 'magit-discard)
(define-key magit-untracked-section-map "k" nil)

(define-key magit-branch-section-map "K" 'magit-branch-delete)
(define-key magit-branch-section-map "k" nil)

(define-key magit-remote-section-map "K" 'magit-remote-remove)
(define-key magit-remote-section-map "k" nil)

(define-key magit-tag-section-map "k" nil)
(define-key magit-tag-section-map "K" 'magit-tag-delete)

(evil-define-key 'normal magit-mode-map
  (kbd "SPC") evil-leader--default-map
  "j" 'next-line
  "k" 'previous-line)





(evil-define-key 'normal magit-reflog-mode-map
  "j" 'next-line
  "k" 'previous-line
  "K" 'magit-discard)



(provide 'joseph-evil-magit)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-evil-magit.el ends here
