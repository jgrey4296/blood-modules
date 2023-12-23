;;; ui/doom/config.el -*- lexical-binding: t; -*-

(package! doom-themes :pin "b5ff201f4bea4286e9ed015a2043cf2394182232")
(package! solaire-mode :pin "8af65fbdc50b25ed3214da949b8a484527c7cc14")
;;;###package pos-tip
(setq pos-tip-internal-border-width 6
      pos-tip-border-width 1)


(use-package! doom-themes
  ;; improve integration w/ org-mode
  :hook (doom-load-theme . doom-themes-org-config)
  )

(use-package! solaire-mode
  :hook (doom-load-theme . solaire-global-mode)
  :hook (+popup-buffer-mode . turn-on-solaire-mode)
  )
