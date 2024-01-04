;;; module-extras.el -*- lexical-binding: t; no-byte-compile: t; -*-
;;-- Header
;; File Commentary:
;;
;;
;; See footer for licenses/metadata/notes as applicable
;;-- end Header

(install! evil-args)
(install! evil-indent-plus)
(install! evil-lion)
(install! evil-numbers)
(install! evil-quick-diff :recipe (:host github :repo "rgrinberg/evil-quick-diff"))

(install! evil-collection)

(use! evil-easymotion
  :after-call doom-first-input-hook
  :commands evilem-create evilem-default-keybindings
  :config
  ;; Use evil-search backend, instead of isearch
  (evilem-make-motion evilem-motion-search-next #'evil-ex-search-next
                      :bind ((evil-ex-search-highlight-all nil)))
  (evilem-make-motion evilem-motion-search-previous #'evil-ex-search-previous
                      :bind ((evil-ex-search-highlight-all nil)))
  (evilem-make-motion evilem-motion-search-word-forward #'evil-ex-search-word-forward
                      :bind ((evil-ex-search-highlight-all nil)))
  (evilem-make-motion evilem-motion-search-word-backward #'evil-ex-search-word-backward
                      :bind ((evil-ex-search-highlight-all nil)))

  ;; Rebind scope of w/W/e/E/ge/gE evil-easymotion motions to the visible
  ;; buffer, rather than just the current line.
  (put 'visible 'bounds-of-thing-at-point (lambda () (cons (window-start) (window-end))))
  (evilem-make-motion evilem-motion-forward-word-begin #'evil-forward-word-begin :scope 'visible)
  (evilem-make-motion evilem-motion-forward-WORD-begin #'evil-forward-WORD-begin :scope 'visible)
  (evilem-make-motion evilem-motion-forward-word-end #'evil-forward-word-end :scope 'visible)
  (evilem-make-motion evilem-motion-forward-WORD-end #'evil-forward-WORD-end :scope 'visible)
  (evilem-make-motion evilem-motion-backward-word-begin #'evil-backward-word-begin :scope 'visible)
  (evilem-make-motion evilem-motion-backward-WORD-begin #'evil-backward-WORD-begin :scope 'visible)
  (evilem-make-motion evilem-motion-backward-word-end #'evil-backward-word-end :scope 'visible)
  (evilem-make-motion evilem-motion-backward-WORD-end #'evil-backward-WORD-end :scope 'visible)
  )

(use! evil-embrace
  :defer t
  :hook (LaTeX-mode      . embrace-LaTeX-mode-hook)
  :hook (org-mode        . embrace-org-mode-hook)
  :hook (ruby-mode       . embrace-ruby-mode-hook)
  :hook (emacs-lisp-mode . embrace-emacs-lisp-mode-hook)
  :config
  (after! evil-surround (evil-embrace-enable-evil-surround-integration))
  (spec-handling-new! evil-embrace nil :loop 'hook
                      ;; TODO
                      (setq embrace--pairs-list (append val embrace--pairs-list))
                      )

  ;; Add escaped-sequence support to embrace
  (setf (alist-get ?\\ (default-value 'embrace--pairs-list))
        (make-embrace-pair-struct
         :key ?\\
         :read-function #'+evil--embrace-escaped
         :left-regexp "\\[[{(]"
         :right-regexp "\\[]})]"))
  )

(use! evil-exchange
  :commands evil-exchange
  :config
  (add-hook! 'doom-escape-hook #'+evil--escape-exchange-h)
  )

(use! evil-quick-diff
  :commands (evil-quick-diff evil-quick-diff-cancel)
  )

(use! evil-nerd-commenter
  :commands (evilnc-comment-operator
             evilnc-inner-comment
             evilnc-outer-commenter)
  :general ([remap comment-line] #'evilnc-comment-or-uncomment-lines))

(use! evil-snipe :defer t)

(use! evil-surround
  :commands (global-evil-surround-mode
             evil-surround-edit
             evil-Surround-edit
             evil-surround-region)
  :config (global-evil-surround-mode 1))

(use! evil-textobj-anyblock
      :recipe (:host github :repo "willghatch/evil-textobj-anyblock" :branch "fix-inner-block")
      :defer t
)

(use! evil-traces
  :after evil-ex
  :config
  (pushnew! evil-traces-argument-type-alist
            '(+evil:align . evil-traces-global)
            '(+evil:align-right . evil-traces-global))
  (evil-traces-mode)
  )

(use! evil-visualstar
  :commands (evil-visualstar/begin-search
             evil-visualstar/begin-search-forward
             evil-visualstar/begin-search-backward)
)

(use! evil-quickscope
  :hook (doom-first-file . global-evil-quickscope-mode)
  :config
  (map! :map evil-quickscope-mode-map
        :nm "t" nil
        :nm "T" nil
        )
  )

(use! evil-iedit-state
  :defer t
  :commands (evil-iedit-state evil-iedit-state/iedit-mode)
  :init
  (setq iedit-current-symbol-default t
        iedit-only-at-symbol-boundaries t
        iedit-toggle-key-default nil)

)

(use! evil-string-inflection
  :defer t
  :commands evil-operator-string-inflection
  )

(use! evil-visual-mark-mode
  :defer t
  :hook (prog-mode . evil-visual-mark-mode)
  )

(use! evil-anzu
  :when (modulep! :editor evil)
  :after-call evil-ex-start-search evil-ex-start-word-search evil-ex-search-activate-highlight
  :config (global-anzu-mode +1)
  )

(use! evil-textobj-tree-sitter
  :after (evil tree-sitter which-key)
  :config
  (setq which-key-allow-multiple-replacements t)
  (pushnew! which-key-replacement-alist
            '(("" . "\\`+?evil-textobj-tree-sitter-function--\\(.*\\)\\(?:.inner\\|.outer\\)") . (nil . "\\1")))
  )

(use! exato
  :commands evil-outer-xml-attr evil-inner-xml-attr
  )


;;-- Footer
;; Copyright (C) 2024 john
;;
;; Author:     john <https://github.com/jgrey4296>
;; Maintainer: john <john@john-UM700>
;; Created:    January 04, 2024
;; Modified:   January 04, 2024
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/jgrey4296
;; Package-Requires: ((emacs "24.3"))
;; Package written on: ((emacs 29.1))
;;
;; This file is not part of GNU Emacs.
;;
;;-- end Footer
;;; module-extras.el ends here
