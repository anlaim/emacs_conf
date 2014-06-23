(eval-when-compile (require 'evil))
(eval-when-compile (require 'magit))

(evil-set-initial-state 'magit-status-mode 'normal)
(defvar magit-status-mode-map)
(evil-make-overriding-map magit-status-mode-map 'normal t)
(evil-define-key 'normal magit-status-mode-map
  "j" 'evil-next-line
  "k" 'evil-previous-line
  "K" 'magit-discard-item
  "N" 'magit-key-mode-popup-svn
  (kbd "SPC") evil-leader--default-map)

(evil-set-initial-state 'magit-log-mode 'normal)
(defvar magit-log-mode-map)
(evil-make-overriding-map magit-log-mode-map 'normal t)
(evil-define-key 'normal magit-log-mode-map
  (kbd "SPC") evil-leader--default-map)

(evil-set-initial-state 'magit-mode 'normal)
(defvar magit-mode-map)
(evil-make-overriding-map magit-mode-map 'normal t)
(evil-define-key 'normal magit-mode-map
  (kbd "SPC") evil-leader--default-map
  "j" 'magit-goto-next-section
  "k" 'magit-goto-previous-section)

(evil-set-initial-state 'magit-commit-mode 'normal)
(defvar magit-commit-mode-map)
(evil-make-overriding-map magit-commit-mode-map 'normal t)

(evil-set-initial-state 'magit-branch-manager-mode 'normal)
(defvar magit-branch-manager-mode-map)
(evil-make-overriding-map magit-branch-manager-mode-map 'normal t)
(evil-define-key 'normal magit-branch-manager-mode-map
  (kbd "SPC") evil-leader--default-map
  "j" 'evil-next-line
  "k" 'evil-previous-line
  "K" 'magit-discard-item)

(evil-set-initial-state 'magit-reflog-mode 'normal)
(defvar magit-reflog-mode-map)
(evil-make-overriding-map magit-reflog-mode-map 'normal t)
(evil-define-key 'normal magit-reflog-mode-map
  (kbd "SPC") evil-leader--default-map
  "j" 'evil-next-line
  "k" 'evil-previous-line
  "K" 'magit-discard-item)
(provide 'joseph-evil-magit)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-evil-magit.el ends here
