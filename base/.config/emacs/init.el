(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(straight-use-package 'use-package)
(use-package org-roam
  :init
  (setq org-roam-directory (file-truename "~/documents/org/"))
  (setq org-roam-mode-sections
	(list #'org-roam-backlinks-section
	      #'org-roam-reflinks-section
	      #'org-roam-unlinked-references-section
            ))
  :config
  (org-roam-db-autosync-mode)
  :straight t)

(setq org-agenda-files '("~/documents/org"))

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  :straight t)

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)
  :straight t)

(use-package org-download 
  :straight t)

(use-package org-roam-ui
  :straight t)

(global-set-key (kbd "<f5>") 'redraw-display)

(evil-set-leader nil (kbd "C-SPC"))
(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader>pv") 'dired)
(evil-define-key 'normal 'global (kbd "<leader>rf") 'org-roam-node-find)
(evil-define-key 'normal 'global (kbd "<leader>dd") 'org-roam-dailies-find-date)
(evil-define-key 'normal 'global (kbd "<leader>ri") 'org-roam-node-insert)
(evil-define-key 'normal 'global (kbd "<leader>oa") 'org-agenda)

(global-visual-line-mode t)
