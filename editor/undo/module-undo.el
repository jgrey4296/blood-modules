;;; config.el -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 John Grey
;;
;; Author: John Grey <https://github.com/jgrey4296>
;; Maintainer: John Grey <johngrey4296 at gmail.com>
;; Created: May 25, 2023
;; Modified: May 25, 2023
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
(install! undo-fu)
(install! vundo)

(load! "+vars")
(defer-load! jg-bindings-total "+bindings")

(use! vundo
  :commands vundo
  )

(use! undo-fu :defer t)

;;; config.el ends here
