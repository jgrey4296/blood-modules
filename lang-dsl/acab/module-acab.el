;; trie config.el
;; loaded fourth

(package! acab-ide :recipe `(:local-repo ,(expand-file-name  "~/github/python/acab/emacs") :files ("*.el" "data-struct/*.el" "modes/*.el" "util/*.el")))
(package! font-lock+ :recipe (:host github :repo "emacsmirror/font-lock-plus"))
(package! parsec)
(defer-load! "+vars")
(defer-load! jg-bindings-total "+bindings")

(after! org
  ;; TODO upgrade to org-superstar?
  (add-hook 'trie-explore-mode-hook 'org-bullets-mode)
)
(use-package! acab-ide :commands acab-ide-minor-mode)
