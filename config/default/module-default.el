;;; module-default.el -*- lexical-binding: t; no-byte-compile: t; -*-
;;-- Header
;; File Commentary:
;;
;;
;; See footer for licenses/metadata/notes as applicable
;;-- end Header
(install! 'cl-lib)
(install! 'f)
(install! 's)
(instal! 'fsm)

(local-load! "+spec-defs")
(local-load! "+vars")

(defer-load! jg-bindings-total "+bindings")

(add-hook 'tty-setup-hook #'evil-terminal-cursor-changer-activate)
(add-hook 'tty-setup-hook #'doom-init-clipboard-in-tty-emacs-h)

(use! spec-handling
      :recipe (:host github :repo "jgrey4296/spec-handling")

      )

(use! epa
      :recipe 'built-in)

(use! epa-hook
      :recipe 'built-in)

(use! link-hint)

(use! expand-region)

(use! xclip)

;;-- Footer
;; Copyright (C) 2023 john
;;
;; Author:     john <https://github.com/jgrey4296>
;; Maintainer: john <john@john-UM700>
;; Created:    December 23, 2023
;; Modified:   December 23, 2023
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/jgrey4296
;; Package-Requires: ((emacs "24.3"))
;; Package written on: ((emacs 29.1))
;;
;; This file is not part of GNU Emacs.
;;
;;-- end Footer
;;; module-default.el ends here
