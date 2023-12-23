;;; lang/yaml/config.el -*- lexical-binding: t; -*-

(package! yaml-mode :pin "3fcb36d6039bef57e2a0f6e24c51f623c0bf5fb7")
(use-package! yaml-mode
  :commands yaml-mode
  :init
  :config
  (setq-hook! 'yaml-mode-hook tab-width yaml-indent-offset)
  (add-hook 'yaml-mode-hook #'tree-sitter!)
  )


(spec-handling-add! auto-modes
                    '(yaml
                       ("Procfile\\'" . yaml-mode)
                       ("\\.yml\\'" . yaml-mode)
                       ("\\.yaml\\'" . yaml-mode)
                      )
                    )
