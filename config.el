;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "dot-wei"
      user-mail-address "weicijiang@foxmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-classic)

(setq doom-font (font-spec :family "Fira Code" :size 14))

(if (not (display-graphic-p))
    (progn
      ;;The default setting is too low for lsp-mode's needs due to the fact that client/server communication generates a lot of memory/garbage. You have two options
      ;; Set it to big number(100mb) like most of the popular starter kits like Spacemacs/Doom/Prelude, etc do:
      (setq gc-cons-threshold 100000000)
      ;; warn when opening files bigger than 100MB
      (setq large-file-warning-threshold 100000000)
      (setq read-process-output-max (* 1024 1024 328)) ;; 328MB
      ))



;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq lsp-dart-flutter-sdk-dir "/Users/weiwu/development/flutter/")
(setq lsp-dart-line-length 120)

;; (dap-register-debug-template "Flutter :: dev"
;;                              (list
;;                               :type "flutter"
;;                               :program "lib/main_dev.dart"
;;                               :args '("--flavor" "dev")))

;; lsp
;;
(setq lsp-enable-completion-at-point t)
(setq lsp-enable-xref t)
(setq lsp-keymap-prefix "C-c l")
(setq lsp-enable-snippet t)
(setq read-process-output-max (* (* 3 1024) 1024)) ;; 1mb
(setq lsp-completion-provider :capf)
(setq lsp-idle-delay 0.500)
(add-to-list 'exec-path "/Users/weiwu/.emacs.d/elixir-ls/release")

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;


(map!
 "\C-s" 'swiper
 :nvig "C-=" 'er/expand-region
 :nvig "C--" 'er/contract-region
 :g "M-0" 'treemacs-select-window
 )

(map!
 :nvi "C-e" 'evil-end-of-line
 :nvi "C-a" 'evil-beginning-of-line
 :nvi "C-p" 'evil-previous-line
 :nvi "C-n" 'evil-next-line
 :nvi "C-d" 'evil-delete-char
 :nvi "C-k" 'evil-delete
 )

;; slove up down slow
(setq line-move-visual nil)

;; (setq display-line-numbers-type nil)

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#21242b" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(custom-safe-themes
   (quote
    ("d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" default)))
 '(fci-rule-color "#5B6268")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(objed-cursor-color "#ff6c6b")
 '(pdf-view-midnight-colors (cons "#bbc2cf" "#282c34"))
 '(rustic-ansi-faces
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; (add-hook 'elixir-mode-hook 'eglot-ensure)
;; Make sure to edit the path appropriately, use the .bat script instead for Windows
;; (add-to-list 'eglot-server-programs '(elixir-mode "/Users/weiwu/.elixir-ls/elixir-ls/release/language_server.sh"))
