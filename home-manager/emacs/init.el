;; 行番号を表示
(global-display-line-numbers-mode 1)

;; バックアップファイルを作成しない
(setq make-backup-files nil)

;; 自動保存ファイルを作成しない
(setq auto-save-default nil)

;; 自動保存リストファイルを作成しない
(setq auto-save-list-file-prefix nil)

;; ロックファイルを作成しない
(setq create-lockfiles nil)

;; 指定行の余白を残してスクロール
(setq scroll-margin 3)

;; インデントをタブにしない
(setq-default indent-tabs-mode nil)

;; デフォルトタブ幅の設定
(setq tab-width 2)

;; 文字コード
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

(leaf eglot
  :hook ((go-mode-hook . eglot-ensure)
	 (nix-mode-hook . eglot-ensure))
  :custom ((eldoc-echo-area-use-multiline-p . nil)
	   (eglot-connect-timeout . 600)))

(leaf eglot-booster
  :when (executable-find "emacs-lsp-booster")
  :global-minor-mode t)

(leaf corfu-terminal
  :unless (display-graphic-p)
  :global-minor-mode t)

(leaf corfu
  :global-minor-mode global-corfu-mode corfu-popupinfo-mode
  :custom ((corfu-auto . t)
           (corfu-auto-delay . 0)
           (corfu-auto-prefix . 1)
           (corfu-popupinfo-delay . nil))
  :bind ((corfu-map
          ("C-s" . corfu-insert-separator))))

(leaf cape
  :config
  (add-to-list 'completion-at-point-functions #'cape-file))

(leaf puni
  :global-minor-mode puni-global-mode
  :bind (puni-mode-map
         ("C-)" . puni-slurp-forward)
         ("C-}" . puni-barf-forward)
         ("M-(" . puni-wrap-round)
         ("M-s" . puni-splice)
         ("M-r" . puni-raise)
         ("M-U" . puni-splice-killing-backward)
         ("M-z" . puni-squeeze))
  :config
  (leaf elec-pair
    :global-minor-mode electric-pair-mode))

(leaf flymake
  ;; ターミナルでは診断インジケータが左マージンに出て行が右にずれるため無効化
  :custom ((flymake-indicator-type . nil))
  :bind ((prog-mode-map
          ("M-n" . flymake-goto-next-error)
          ("M-p" . flymake-goto-prev-error))))

(leaf which-key
  :global-minor-mode t)

(leaf vertico
  :global-minor-mode t)

(leaf marginalia
  :global-minor-mode t)

(leaf consult
  :hook (completion-list-mode-hook . consult-preview-at-point-mode)
  :defun consult-line
  :preface
  (defun c/consult-line (&optional at-point)
    "Consult-line uses things-at-point if set C-u prefix."
    (interactive "P")
    (if at-point
        (consult-line (thing-at-point 'symbol))
      (consult-line)))
  :custom ((xref-show-xrefs-function . #'consult-xref)
           (xref-show-definitions-function . #'consult-xref)
           (consult-line-start-from-top . t))
  :bind (;; C-c bindings (mode-specific-map)
         ([remap switch-to-buffer] . consult-buffer) ; C-x b
         ([remap project-switch-to-buffer] . consult-project-buffer) ; C-x p b

         ;; M-g bindings (goto-map)
         ([remap goto-line] . consult-goto-line)    ; M-g g
         ([remap imenu] . consult-imenu)            ; M-g i
         ("M-g f" . consult-flymake)

         ;; C-M-s bindings
         ("C-s" . c/consult-line)       ; isearch-forward
         ("C-M-s" . nil)                ; isearch-forward-regexp
         ("C-M-s s" . isearch-forward)
         ("C-M-s C-s" . isearch-forward-regexp)
         ("C-M-s r" . consult-ripgrep)

         (minibuffer-local-map
          :package emacs
          ("C-r" . consult-history))))

(leaf affe
  :custom ((affe-highlight-function . 'orderless-highlight-matches)
           (affe-regexp-function . 'orderless-pattern-compiler))
  :bind (("C-M-s r" . affe-grep)
         ("C-M-s f" . affe-find)))

(leaf orderless
  :custom ((completion-styles . '(orderless))
           (completion-category-defaults . nil)
           (completion-category-overrides . '((file (styles partial-completion))))))

(leaf embark-consult
  :bind ((minibuffer-mode-map
          :package emacs
          ("M-." . embark-dwim)
          ("C-." . embark-act))))

(leaf magit
  :ensure t
  :bind
  (("C-c C-f" . magit-status)))

(leaf git-gutter
  :ensure t
  :global-minor-mode global-git-gutter-mode
  :custom
  ((git-gutter:added-sign . "+")
   (git-gutter:deleted-sign . "-")
   (git-gutter:modified-sign . "=")))

(leaf doom-themes
  :config
  (load-theme 'doom-dracula t))

(leaf doom-modeline
  :global-minor-mode t)

(leaf treemacs
  :bind (("C-c e" . treemacs)))

(leaf treemacs-nerd-icons
  :config
  (treemacs-nerd-icons-config))
