(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("org"   . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu"   . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    (leaf hydra :ensure t)
    (leaf el-get :ensure t)
    (leaf blackout :ensure t)

    :config
    (leaf-keywords-init)))

(leaf leaf
  :config
  (leaf leaf-convert :ensure t)
  (leaf leaf-tree
    :ensure t
    :custom ((imenu-list-size . 30)
             (imenu-list-position . 'left))))

(leaf macrostep
  :ensure t
  :bind (("C-c e" . macrostep-expand)))

;; 自動補完
(leaf company
  :doc "Modular text completion framework"
  :req "emacs-24.3"
  :tag "matching" "convenience" "abbrev" "emacs>=24.3"
  :url "http://company-mode.github.io/"
  :emacs>= 24.3
  :ensure t
  :leaf-defer nil
  :bind ((company-active-map
          ("M-n" . nil)
          ("M-p" . nil)
          ("C-s" . company-filter-candidates)
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)
          ("C-f" . company-complete-selection))
         (company-search-map
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)))
  :custom ((company-idle-delay . 0)
           (company-minimum-prefix-length . 1)
           (company-transformers . '(company-sort-by-occurrence)))
  :global-minor-mode global-company-mode)

;; gitインターフェース
(leaf magit
  :ensure t
  :bind
  (("C-c C-f" . magit-status)))

;; git変更点の表示
(leaf git-gutter
  :ensure t
  :global-minor-mode global-git-gutter-mode
  :custom
  ((git-gutter:added-sign . "+")
   (git-gutter:deleted-sign . "-")
   (git-gutter:modified-sign . "=")))

;; タブを表示
(leaf tab-bar-mode
  :init
  (define-key global-map (kbd "C-<up>") 'tab-bar-switch-to-prev-tab)
  (define-key global-map (kbd "C-<down>") 'tab-bar-switch-to-next-tab)
  (define-key global-map (kbd "C-t") 'tab-bar-new-tab)
  (define-key global-map (kbd "C-w") 'tab-bar-close-tab)
  :custom
  ((tab-bar-new-tab-choice . "*scratch*"))
  :config
  (tab-bar-mode t)
  (face-spec-set 'tab-bar-tab '((((background light)) (:background "gold")) (((background dark)) (:background "#808080")))))

(leaf evil
  :ensure t
  :config
  (evil-mode t))

;; 自動再読み込み
(global-auto-revert-mode t)

;; 行番号の表示
(global-display-line-numbers-mode t)

;; org-mode
;; TODOのキーワード設定
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOIN(n)"
		  "|" "DONE(d)")))
(setq org-todo-keyword-faces
      '(
	("TODO" . (:foreground "LightGoldenrod3" :weight bold))
	))
(setq org-log-done nil) ;; DONEとなった時間を記録しない
(setq org-fontify-done-headline nil) ;; DONEステータス時の見出しの色を変えない

(setq org-directory "~/org/")
(setq org-agenda-files (list org-directory))

(define-key global-map "\C-ca" 'org-agenda)

(setq org-agenda-window-setup 'current-window)

(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))

(setq hl-line-face 'underline)

(setq calendar-holidays nil)

(global-set-key "\C-cc" 'org-capture)

(setq org-capture-templates
      '(
	("t" "Todo" entry (file+headline "~/org/9_REMIND.org" "[#C] REMIND")
	 "* REMD [#C] %? (wrote on %U)")
	))

(setq org-use-tag-inheritance "^@")

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
