;; early-init.el -*- lexical-binding: t; no-byte-compile: t; -*-

;; finding BLOOD:
;; config files will be in BLOOD_CONFIG or ~/.config/blood
;; blood's source will be in BLOOD_SRC or BLOOD_CONFIG
(defcustom blood-config-dir (expand-file-name (or (getenv "BLOOD_CONFIG") "~/.config/blood/")) "directory for config files")
;; Add blood to load path
(set-default-toplevel-value 'load-path (append
                                        (list (or (getenv "BLOOD_SRC") blood-config-dir))
                                        (list (file-name-concat (getenv "HOME") ".emacs.d/blood"))
                                        (default-toplevel-value 'load-path)))
(require 'blood-early-init)
