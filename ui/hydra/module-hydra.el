;;; config.el -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 John Grey
;;
;; Author: John Grey <https://github.com/jgrey4296>
;; Maintainer: John Grey <johngrey4296 at gmail.com>
;; Created: March 15, 2023
;; Modified: March 15, 2023
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/jgrey4296
;; Package-Requires: ((emacs "24.3"))
;; Package written on: ((emacs 28.2))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;
;;
;;; Code:

(package! hydra)
(package! hydra-macros :recipe `(:host github :repo "jgrey4296/hydra-macros" ))

(local-load! "+vars")
(defer-load! (jg-bindings-total hydra) "+bindings")

(use-package! hydra
  :after hydra-utils
  )

(use-package! hydra-macros :defer t)

;;; config.el ends here
