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

;; 垂直補完UI
(leaf vertico
  :doc "Vertical interactive completion"
  :ensure t
  :global-minor-mode t)

(leaf magit
  :ensure t
  :bind (("C-c g" . magit-status)))
