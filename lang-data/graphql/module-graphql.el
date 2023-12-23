;;; lang/graphql/config.el -*- lexical-binding: t; -*-

(package! graphql-mode)
(package! graphql-doc)
(unless (modulep! +lsp) (package! company-graphql :recipe (:host github :repo "thaenalpha/company-graphql")))
(local-load! "+vars")

(use-package! graphql-mode
  :commands graphql-mode
  :init
  (add-hook 'graphql-mode-hook #'rainbow-delimiters-mode)
  )

(use-package! graphql-doc
  :after graphql-mode)
