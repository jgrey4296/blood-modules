;;; lang/idris/config.el -*- lexical-binding: t; -*-

(package! idris-mode :pin "c96f45d1b8fad193f09fb6139da17092003b5e74")
(local-load! "+vars")
(defer-load! jg-bindings-total "+bindings")


(use-package! idris-mode
  :commands idris-mode
  :config
  (add-hook 'idris-mode-hook #'turn-on-idris-simple-indent)
  )
