;;; early-init.el --- Early startup settings -*- lexical-binding: t; -*-

;; Packages are managed by straight.el (bootstrapped in init.el), so keep
;; package.el from activating anything in elpa/ at startup.
(setq package-enable-at-startup nil)

;; (add-to-list 'default-frame-alist '(undecorated . t))

(add-to-list 'default-frame-alist '(undecorated-round . t))

;; So we can detect this file has been loaded.
(provide 'early-init)
