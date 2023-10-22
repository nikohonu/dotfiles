;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;; (package-refresh-contents)

;; Download packages
(setq package-list '(evil org-roam))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
;; (unless (package-installed-p 'evil)
;;   (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(setq evil-want-C-i-jump nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq org-roam-directory (file-truename "~/documents/org-roam"))
(setq org-agenda-files '("~/documents/org-roam"))
(org-roam-db-autosync-mode)

(setq org-roam-mode-sections
      (list #'org-roam-backlinks-section
            #'org-roam-reflinks-section
            ;; #'org-roam-unlinked-references-section
            ))
;; Niko Honu
(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader>o") 'org-roam-node-find)
(evil-define-key 'normal 'global (kbd "<leader>i") 'org-roam-node-insert)
(evil-define-key 'normal 'global (kbd "<leader>a") 'org-agenda)
(evil-define-key 'normal 'global (kbd "<leader>b") 'org-roam-buffer-toggle)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(setq org-confirm-babel-evaluate  nil)
org-confirm-babel-evaluate
