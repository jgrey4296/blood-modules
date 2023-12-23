;;; example-init.el -*- lexical-binding: t; -*-

(hlog! "init.el")
(install! 'vimrc-mode)
(install! 'evil-terminal-cursor-changer :pin "12ea9c0438c67e560b3866dc78b5c7d1d93f8cc5")

;; Profile declarations with module activations:
(blood! :profile basic :default t
        :modules-from ("./example")
        ;; :install-to  nil
        ;; :build-to nil
        ;; :disallow (mod-feature keybindings)
        :on-activation ((message "blah"))
        :active-modules:
        :config bindings default disabled help linux mac search ui windows
        :editor autosave buffer-nave evil fold large-files tagging text-manipulation undo window-nav
        :ide company debugger diff librarian minimap snippets support version-control workspaces
        :tools calendar dired eval mail pdfs processes term
        :ui helm hydra ibuffer ivy minibuffer ophints popup

        :lang-text bibtex inform latex markdown org plantuml rst web
        :lang-data csv dot graphql json logs nu sql toml xml yaml
        :lang-dsl acab ai-and-logic music nix qt rest sh
        :lang-strongly-typed coq dotnet-langs fstar haskell idris jvm-langs lean ml-langs rust
        :lang-weakly-typed erlang-vms godot lisp-langs lua python ruby

        :experimentation agda ess fortran ivy-experiments julia ledger multi-cursor open-policy-agent org-brain solidity taskrunners vertico
  )

(blood! :profile quick :disabled nil
        :package-installation "quick"
        :active-modules:
        :config bindings default disabled help linux mac search ui windows
        :editor autosave buffer-nave evil fold large-files tagging text-manipulation undo window-nav
        :ide company debugger diff librarian minimap snippets support version-control workspaces
        :tools calendar dired eval mail pdfs processes term
        :ui helm hydra ibuffer ivy minibuffer ophints popup
  )


(ilog! "")
(ghlog! "Current Variable Assignments")
(dolist (loc '(native-comp-eln-load-path data-directory doc-directory exec-directory
	       installation-directory invocation-directory invocation-name source-directory
               shared-game-score-directory noninteractive blood--cmd
               ))
  (ilog! "%-30s : %s" (symbol-name loc) (symbol-value loc))
  )
(glogx!)

(add-hook 'after-init-hook (lambda () (hlog! "Init Loaded, Processing..."))
          (plist-get blood--hook-laziness :bootstrap))
(add-hook 'after-init-hook (lambda () (switch-to-buffer "*Messages*"))
          (plist-get blood--hook-laziness :user-max))
