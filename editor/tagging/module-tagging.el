;; config.el<2> -*- mode: Elisp; lexical-binding: t; -*-

(install! helm)
(install! dash)
(install! org)
(install! evil)
(install! hydra)
(install! cl-lib :built-in t)
(install! ivy)
(install! librarian-tagging-helm :recipe (:host github :repo "jgrey4296/misc-modes" :files ("minor-modes/librarian-tagging-helm/*.el") :local-repo "misc-modes"))
(local-load! "+vars")

(defer-load! jg-bindings-total "+bindings")

(use! rawtag-mode
  :commands rawtag-mode
  )

(use! librarian-tagging-helm
  :after (evil helm)
  )
