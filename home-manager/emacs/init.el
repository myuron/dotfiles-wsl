;; バックアップファイルを作成しない
(setq make-backup-files nil)

;; 自動保存ファイルを作成しない
(setq auto-save-default nil)

;; 自動保存リストファイルを作成しない
(setq auto-save-list-file-prefix nil)

;; ロックファイルを作成しない
(setq create-lockfiles nil)

;; shut up, emacs!
(setq display-warning-minimum-level :error)

;; remap set mark command
(leaf emacs
  :bind (("C-M-SPC" . set-mark-command)))

(leaf leaf-convert)

;; color scheme
(leaf doom-themes
  :config
  (load-theme 'doom-dracula t))

;; modeline
(leaf doom-modeline
  :global-minor-mode t)

;; 垂直補完UI
(leaf vertico
  :global-minor-mode t)

;; fuzzy find
(leaf orderless
  :custom ((completion-styles . '(orderless))
	   (completion-category-defaults . nil)
	   (completion-category-overrides . '((file (styles partial-completion))))))

;; skk
(leaf nskk
  :custom
  (nskk-dict-system-dictionary-files . "~/.nix-profile/share/skk/SKK-JISYO.L")
  :config
  (nskk-global-mode 1))

;; which-key
(leaf which-key
  :global-minor-mode t)

;; org-mode
(leaf org
  :custom
  (org-directory . "~/org"))

;; ナレッジ管理
(leaf org-roam
  :custom
  (org-roam-directory . "~/src/github.com/myuron/org-roam")
  :config
  (org-roam-db-autosync-mode)
  :bind (("C-c r f" . org-roam-node-find)
	 ("C-c r i" . org-roam-node-insert)
	 ("C-c r t" . org-roam-buffer-toggle)))

;; タスク管理
(leaf org-agenda
  :custom
  (org-agenda-files . `(,org-directory))
  (org-agenda-window-setup . current-window)
  :bind (("C-c a" . org-agenda)))

(leaf org-capture
  :custom
  (org-capture-templates . '(("t" "Todo" entry (file+headline "~/org/0_todo.org" "Unorganized")
			      "** TODO %?\n")))
  :bind (("C-c c" . org-capture)))

;; タイム管理
(leaf org-pomodoro
  :bind (("C-c p" . org-pomodoro)))
