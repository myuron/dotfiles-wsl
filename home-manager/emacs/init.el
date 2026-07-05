(use-package emacs
  :config
  (setq make-backup-files nil)
  (setq auto-save-default nil)
  (setq auto-save-list-file-prefix nil)
  (setq create-lockfiles nil))

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'doom-one t))
