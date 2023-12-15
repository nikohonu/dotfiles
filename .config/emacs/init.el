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

(setq org-roam-directory (file-truename "~/Documents/Org"))
(setq org-agenda-files '("~/Documents/Org"))
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
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.25))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.15))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(languagetool evil-org doom-modeline org-roam-ui lsp-ui evil)))

(use-package languagetool
  :ensure t
  :defer t
  :commands (languagetool-check
             languagetool-clear-suggestions
             languagetool-correct-at-point
             languagetool-correct-buffer
             languagetool-set-language
             languagetool-server-mode
             languagetool-server-start
             languagetool-server-stop)
  :config
  (setq languagetool-java-arguments '("-Dfile.encoding=UTF-8")
        languagetool-console-command "~/Apps/LanguageTool/languagetool-commandline.jar"
        languagetool-server-command "~/Apps/LanguageTool/languagetool-server.jar"))
