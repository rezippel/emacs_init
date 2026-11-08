;;; init.el --- Bootstrap literate configuration -*- lexical-binding: t; -*-
;; Bootstrap straight.el (https://github.com/radian-software/straight.el).
;; This must happen before Org is loaded for tangling, so the straight-managed
;; Org is the only version of Org that ever gets loaded.
;; Upstream straight.el's default branch is now "main" (the old "master" is stale).
(setq straight-repository-branch "main")
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir) user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install Org via straight before `ob-tangle' is required below.
(straight-use-package 'org)

(let ((config-org (expand-file-name "config.org" user-emacs-directory))
      (config-el  (expand-file-name "config.el"  user-emacs-directory)))
  (when (or (not (file-exists-p config-el))
            (file-newer-than-file-p config-org config-el))
    (require 'ob-tangle)
    (org-babel-tangle-file config-org config-el "emacs-lisp"))
  (load config-el nil 'nomessage))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
