;;; editor/evil/config.el -*- lexical-binding: t; -*-

(local-load! "+defs")
(local-load! "+vars")
(local-load! "+spec-defs")

(defer-load! (evil-collection evil-ex) "+evil-ex-setup")

(defer-load! jg-bindings-core "+bindings") ;; -> jg-evil-bindings

(use! evil
      :recipe      'melpa
      :autoloads   '(evil-mode)
      :pre-load ((message "Prior to loading evil")
                 (setq-hook! '(magit-mode-hook so-long-minor-mode-hook) evil-ex-hl-update-delay 0.25)
                 )
      :advice ()
      :hooks ()
      :post-load ((message "evil has loaded from: %s" (dir!))
                  (evil-mode 1)
                  (evil-ex-define-cmd "q[uit]" #'evil-quit-all)
                  (evil-select-search-module 'evil-search-module 'evil-search)
                  ;; Forward declare these so that ex completion works, even if the autoloaded
                  ;; functions aren't loaded yet.
                  (evil-add-command-properties '+evil:align :ex-arg 'regexp-match)
                  (evil-add-command-properties '+evil:align-right :ex-arg 'regexp-match)
                  (evil-add-command-properties '+multiple-cursors:evil-mc :ex-arg 'regexp-global-match)

                  ;; Allow eldoc to trigger directly after changing modes
                  (after! eldoc (eldoc-add-command 'evil-normal-state 'evil-insert 'evil-change 'evil-delete 'evil-replace))
                  (unless noninteractive (add-hook! 'after-save-hook #'+evil-display-vimlike-save-message-h))

                  ;; PERF: Stop copying the selection to the clipboard each time the cursor
                  ;; moves in visual mode. Why? Because on most non-X systems (and in terminals
                  ;; with clipboard plugins like xclip.el active), Emacs will spin up a new
                  ;; process to communicate with the clipboard for each movement. On Windows,
                  ;; older versions of macOS (pre-vfork), and Waylang (without pgtk), this is
                  ;; super expensive and can lead to freezing and/or zombie processes.
                  ;;
                  ;; UX: It also clobbers clipboard managers (see emacs-evil/evil#336).
                  (setq evil-visual-update-x-selection-p nil)

                  (add-hook 'doom-load-theme-hook           #'+evil-update-cursor-color-h)
                  (add-hook 'doom-after-modules-config-hook #'+evil-update-cursor-color-h)
                  (add-hook 'evil-insert-state-entry-hook   #'delete-selection-mode)
                  (add-hook 'evil-insert-state-exit-hook    #'+default-disable-delete-selection-mode-h)
                  (add-hook 'doom-escape-hook               #'+evil-disable-ex-highlights-h)
                  ;; (add-hook 'evil-local-mode-hook           #'+jg-evil--auto-marks-h)

                  ;; Lazy load evil ex commands
                  (delq! 'evil-ex features)
                  (add-transient-hook! 'evil-ex (provide 'evil-ex))
                  )
      :bind ((:map 'evil-mode-map
              :n "x" #'blah
              :v "y" #'bloo
              )
             (:map 'evil-normal-state-map

                   )
             )
      )

(use! evil-escape
      ;; :disabled t
      :recipe (:host github :repo "jgrey4296/evil-escape-hook")
      :pre-load (
                 (setq evil-escape-inhibit-functions nil ;; '(evil-ex-p)
                       evil-escape-excluded-states '(normal multiedit emacs motion)
                       evil-escape-excluded-major-modes '(neotree-mode treemacs-mode vterm-mode)
                       evil-escape-key-sequence "jk"
                       evil-escape-delay 0.15
                       )
                 )
      :post-load (
                  (evil-escape-mode)
                  )

      )
