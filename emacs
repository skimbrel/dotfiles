
;;; cperl-mode is preferred to perl-mode
(defalias 'perl-mode 'cperl-mode)

(setq
    cperl-close-paren-offset -4
    cperl-continued-statement-offset 4
    cperl-indent-level 4
    cperl-indent-parens-as-block t
    cperl-tabs-always-indent t)



(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1)
  (setq font-lock-auto-fontify t))

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(cperl-array-face ((t (:background "black" :foreground "green"))))
 '(cperl-hash-face ((t (:background "black" :foreground "blue" :slant italic)))))

;; we like parens mode
(if (fboundp 'show-paren-mode)
    (show-paren-mode 1))
;; we like it even better when it can show us where the offscreen match is
(defadvice show-paren-function
  (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
echo area. Has no effect if the character before point is not of
the syntax class ')'."
  (interactive)
  (let ((matching-text nil))
    (if (char-equal (char-syntax (char-before (point))) ?\))
        (setq matching-text (blink-matching-open)))
    (if (not (null matching-text))
        (message matching-text))))

;; munge the tab settings: No tab characters, use multiples of 4

(setq-default indent-tabs-mode nil)
(setq-default default-tab-width 4)

;; we hates the evil empty blank spacing
(setq-default show-trailing-whitespace t)
(setq-default default-indicate-empty-lines t)

;; saveplace!

(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; because M-x goto-line is too long
(global-set-key "\C-cg" 'goto-line)

;; we like TT-mode
(setq load-path
    (cons "/home/comet/.emacs.d/" load-path))

(autoload 'tt-mode "tt-mode")
(setq auto-mode-alist
 (append '(("\\.tt$" . tt-mode)) auto-mode-alist ))

(setq auto-mode-alist
 (append '(("\\.t$" . cperl-mode)) auto-mode-alist ))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(setq-default c-basic-offset 4)

(load (expand-file-name "~/.emacs.d/xml-rpc.el"))
(load (expand-file-name "~/.emacs.d/confluence.el"))
(setf confluence-url "http://wiki.videoegg.com/rpc/xmlrpc")

