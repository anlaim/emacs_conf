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


(define-key magit-untracked-section-map "K" 'magit-discard)
(define-key magit-untracked-section-map "k" nil)

(define-key magit-branch-section-map "K" 'magit-branch-delete)
(define-key magit-branch-section-map "k" nil)

(define-key magit-remote-section-map "K" 'magit-remote-remove)
(define-key magit-remote-section-map "k" nil)
(define-key magit-mode-map (kbd "C-w") nil)

(evil-set-initial-state 'magit-mode 'normal)
(defvar magit-mode-map)
(evil-make-overriding-map magit-mode-map 'normal t)
(evil-define-key 'normal magit-mode-map
  (kbd "SPC") evil-leader--default-map
  "j" 'magit-section-forward
  "k" 'magit-section-backward)



(evil-set-initial-state 'magit-popup-mode 'insert)
(evil-set-initial-state 'magit-status-mode 'normal)

(defvar magit-status-mode-map)
(evil-make-overriding-map magit-status-mode-map 'normal t)
(evil-define-key 'normal magit-status-mode-map "N" 'magit-svn-popup)

(evil-set-initial-state 'magit-log-mode 'normal)


(evil-set-initial-state 'magit-reflog-mode 'normal)
(defvar magit-reflog-mode-map)
(evil-make-overriding-map magit-reflog-mode-map 'normal t)
(evil-define-key 'normal magit-reflog-mode-map
  "j" 'evil-next-line
  "k" 'evil-previous-line
  "K" 'magit-discard)



(provide 'joseph-evil-magit)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-evil-magit.el ends here
