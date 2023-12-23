;; Misc AI Languages:

(package! instal-mode     :recipe `(:local-repo ,(expand-file-name "~/github/python/instal/instal-mode")))
(package! ob-instal       :recipe `(:local-repo ,(expand-file-name "~/github/python/instal/instal-mode")))

(package! agentspeak-mode :recipe (:host github :repo "jgrey4296/misc-modes" :files ("major-modes/agentspeak-mode/*.el")))
(package! jacamo-mode     :recipe (:host github :repo "jgrey4296/misc-modes" :files ("major-modes/jacamo-mode/*.el")))
(package! soar-mode       :recipe (:host github :repo "jgrey4296/misc-modes" :files ("major-modes/soar-moar/*.el")))
(package! clips-mode)
(package! pasp-mode)
(package! z3-mode)

(package! ob-prolog)
(package! ob-ccalc        :recipe (:host github :repo "jgrey4296/misc-modes" :files ("org-babels/ob-ccalc.el")))
(package! ob-ceptre       :recipe (:host github :repo "jgrey4296/misc-modes" :files ("org-babels/ob-ceptre.el")))
(package! ob-clingo       :recipe (:host github :repo "jgrey4296/misc-modes" :files ("org-babels/ob-clingo.el")))
(package! ob-clips        :recipe (:host github :repo "jgrey4296/misc-modes" :files ("org-babels/ob-clips.el")))
(package! ob-soar         :recipe (:host github :repo "jgrey4296/misc-modes" :files ("org-babels/ob-soar.el")))
(package! ob-z3           :recipe (:host github :repo "jgrey4296/misc-modes" :files ("org-babels/ob-z3.el")))

(defer-load! "+vars")
(defer-load! jg-bindings-total "+bindings")

(use-package! agentspeak-mode :defer t)
(use-package! instal-mode     :defer t)
(use-package! jacamo-mode     :defer t)
(use-package! soar-mode       :defer t)
(use-package! clips-mode      :defer t)

(after! org
  (push '("clingo" . prolog) org-src-lang-modes)
  (push '("ccalc" . prolog) org-src-lang-modes)
  )

(after! ob-prolog
  (setq org-babel-prolog-command "swipl")
  )

(use-package! pasp-mode
  :commands pasp-mode
  :after evil
  :init
  (setq-hook! 'pasp-mode-hook
    indent-line-function '+jg-logic-pasp-indent
    )
  )

(use-package! prolog
  :init
  (add-hook! 'prolog-mode-hook
             #'general-insert-minor-mode)
  )
