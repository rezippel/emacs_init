;;; early-init.el --- Early startup settings -*- lexical-binding: t; -*-

;; Packages are managed by straight.el (bootstrapped in init.el), so keep
;; package.el from activating anything in elpa/ at startup.
(setq package-enable-at-startup nil)
