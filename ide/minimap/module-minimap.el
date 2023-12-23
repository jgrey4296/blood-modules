;;; ui/minimap/config.el -*- lexical-binding: t; -*-

(package! minimap :pin "ed7490652a676c0510ed57d5366c445de20a370b")
(use-package! minimap
  :defer t
  :config
  (setq minimap-window-location 'right
        minimap-update-delay 0
        minimap-width-fraction 0.09
        minimap-minimum-width 15)
  (pushnew! minimap-major-modes 'text-mode 'conf-mode))
