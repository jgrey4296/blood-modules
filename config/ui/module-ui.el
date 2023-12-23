;;; config.el -*- lexical-binding: t; -*-
(install! anzu)
(install! auto-highlight-symbol)
(install! doom-modeline)
(install! highlight-indent-guides)
(install! highlight-parentheses)
(install! hilit-chg)
(install! hl-todo)
(install! rainbow-delimiters)
(install! rainbow-mode)
(install! smartparens)
(install! transient)
(install! visual-fill-column)
(install! whitespace)
(install! paren)
(install! hide-mode-line)
(install! fringe :built-in t)

(install! font-lock+       :recipe (:host github :repo "emacsmirror/font-lock-plus"))
(install! palette-mode     :recipe (:host github :repo "jgrey4296/misc-modes" :files ("major-modes/palette-mode/*.el") :local-repo "misc-modes"))
(install! transient-macros :recipe (:host github :repo "jgrey4296/transient-macros"))

(install! treemacs)
(install! treemacs-evil)
(install! treemacs-persp)
(install! treemacs-projectile)
(install! neotree)

(local-load! "+defs")
(local-load! "+vars")
(local-load! "+spec-defs")

(defer-load! jg-bindings-total "+bindings")

(local-load! "+tree-views")
(local-load! "+highlighting")
(local-load! "+colours")
(local-load! "+modeline")

(add-hook! 'doom-first-file-hook #'transient-toggles-minor-mode)

;;-- whitespace

(use! whitespace
  :commands whitespace-mode
  :init
  (defvar whitespace-mode nil)

  )
;;-- end whitespace

;;-- search results

(use! anzu
  :after-call isearch-mode
  )

;;-- end search results

;;-- transient

(use! transient)

(use! transient-macros)

;;-- end transient

(use! fringe)
