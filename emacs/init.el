(global-set-key (kbd "C-x C-m") 'set-mark-command)

(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  (use-package leaf :ensure t)

  (leaf leaf-keywords
    :ensure t
    :init
    (leaf blackout :ensure t)
    :config
    (leaf-keywords-init)))

;; skk
(leaf nskk
  :custom ((nskk-dict-system-dictionary-files quote
					      ("/usr/share/skk/SKK-JISYO.L")))
  :init
  (use-package-vc-install
   '(nskk
     (:url "https://github.com/takeokunn/nskk.el" :lisp-dir "src")
     nil)
   nil)
  :require t
  :config
  (nskk-global-mode 1))

;; leaf変換
(leaf leaf-convert
  :doc "Convert many format to leaf format"
  :ensure t)

;; 垂直補完UI
(leaf vertico
  :doc "Vertical interactive completion"
  :ensure t
  :global-minor-mode t)

;; git client
(leaf magit
  :ensure t
  :bind (("C-c g" . magit-status)))

;; org-roam
(leaf org-roam
  :ensure t
  :custom
  (org-roam-directory . "~/src/github.com/myuron/org-roam")
  :config
  (org-roam-db-autosync-mode)
  :bind (("C-c r f" . org-roam-node-find)
	 ("C-c r i" . org-roam-node-insert)
	 ("C-c r t" . org-roam-buffer-toggle)
	 ("C-c r a" . org-roam-alias-add)))
