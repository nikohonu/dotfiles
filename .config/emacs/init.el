;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;; (package-refresh-contents)

;; Download packages
(setq package-list '(evil org-roam org-roam-ui lsp-mode lsp-ui))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(setq evil-want-C-i-jump nil)

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
(evil-define-key 'normal 'global (kbd "<leader>.") 'find-file)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (eshell . t)))

(setq org-confirm-babel-evaluate  nil)
org-confirm-babel-evaluate
(global-visual-line-mode t)

(use-package lsp-mode
  :config
  (lsp-register-custom-settings
   '(("pyls.plugins.pyls_mypy.enabled" t t)
     ("pyls.plugins.pyls_mypy.live_mode" nil t)
     ("pyls.plugins.pyls_black.enabled" t t)
     ("pyls.plugins.pyls_isort.enabled" t t)))
  :hook
  ((python-mode . lsp) (rust-mode . lsp)))

(use-package lsp-ui)

(setq inhibit-startup-message t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 120)

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.25))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.15))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1)))))
