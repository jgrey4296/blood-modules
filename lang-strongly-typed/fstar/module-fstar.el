;;; lang/fstar/config.el -*- lexical-binding: t; -*-

(package! fstar-mode :pin "ab0697b9474f36942a12a4b2a75251c247c18e9e")
(local-load! "+vars")
(defer-load! jg-bindings-total "+bindings")

(use-package! fstar-mode
  :commands fstar-mode
  )
