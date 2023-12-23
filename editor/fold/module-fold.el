;;; editor/fold/config.el -*- lexical-binding: t; -*-

(install! hideshow :built-in t)
(install! cl-lib   :built-in t)
(install! origami)
(install! vimish-fold )
(install! evil-vimish-fold )
(install! code-shy-minor-mode :recipe (:host github :repo "jgrey4296/code-shy-minor-mode"))
;;
;; Packages
(local-load! "+vars")
(local-load! "+spec-defs")
(defer-load! jg-bindings-total "+bindings")

(use! hideshow ; built-in
  :commands (hs-toggle-hiding hs-hide-block hs-hide-level hs-show-all hs-hide-all)
  :config
  (defadvice! +fold--hideshow-ensure-mode-a (&rest _)
    "Ensure `hs-minor-mode' is enabled when we need it, no sooner or later."
    :before '(hs-toggle-hiding hs-hide-block hs-hide-level hs-show-all hs-hide-all)
    (unless (bound-and-true-p hs-minor-mode)
      (hs-minor-mode +1)))
  )

(use! evil-vimish-fold
  :commands (evil-vimish-fold/next-fold evil-vimish-fold/previous-fold evil-vimish-fold/delete evil-vimish-fold/delete-all evil-vimish-fold/create evil-vimish-fold/create-line)
  :init
  (global-evil-vimish-fold-mode)
  )

(use! origami :defer t)

(use! code-shy-minor-mode
  :init
  (add-hook! doom-first-buffer
             #'global-code-shy-minor-mode
             )
  )
