;;; example-init.el -*- lexical-binding: t; -*-

(hlog! "init.el")
(install! 'vimrc-mode)
(install! 'evil-terminal-cursor-changer :pin "12ea9c0438c67e560b3866dc78b5c7d1d93f8cc5")

;; Profile declarations with module activations:
(blood! :profile basic :default t
        :modules-from ("./")
        ;; :install-to  nil
        ;; :build-to nil
        ;; :disallow (mod-feature keybindings)
        :on-activation ((message "Basic Profile"))
        :active-modules:
        :config default disabled help search ui
        :editor buffer-nav evil text-manipulation undo window-nav
        :tools dired
        :ui helm hydra ibuffer ivy minibuffer ophints popup
        :lang-weakly-typed lisp-langs
  )


(add-hook 'after-init-hook (lambda () (hlog! "Init Loaded, Processing..."))
          (plist-get blood--hook-laziness :bootstrap))
(add-hook 'after-init-hook (lambda () (switch-to-buffer "*Messages*"))
          (plist-get blood--hook-laziness :user-max))
