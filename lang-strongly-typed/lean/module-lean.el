;;; lang/lean/config.el -*- lexical-binding: t; -*-

(package! lean-mode)
(package! company-lean)
(use-package! company-lean
  :after lean-mode
  :init
  (advice-add #'company-lean-hook :override #'ignore)
  )
