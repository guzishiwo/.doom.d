;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

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
(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "JetBrains Mono NL" :size 14))


(after! evil
  (delete-selection-mode 1)
  (remove-hook 'evil-insert-state-entry-hook #'delete-selection-mode)
  (remove-hook 'evil-insert-state-exit-hook  #'+default-disable-delete-selection-mode-h)
  )

(setq python-shell-virtualenv-path "~/.Envs/")

(if (not (display-graphic-p))
    (progn
      ;;The default setting is too low for lsp-mode's needs due to the fact that client/server communication generates a lot of memory/garbage. You have two options
      ;; Set it to big number(100mb) like most of the popular starter kits like Spacemacs/Doom/Prelude, etc do:
      (setq gc-cons-threshold 100000000)
      ;; warn when opening files bigger than 100MB
      (setq large-file-warning-threshold 100000000)
      (setq read-process-output-max (* 1024 1024 128)) ;; 328MB
      ))

;; default mode

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
  (setq org-directory "~/Documents/Org/")
  (setq org-agenda-files (list "~/Documents/Org/"))
  ;; (setq org-hide-emphasis-markers t)
  (setq org-export-with-sub-superscripts nil)
  (setq org-export-html-postamble nil)
  (setq org-image-actual-width '(750))
  (set-face-attribute 'org-table  nil  :font "Sarasa Mono SC Nerd 14"
                     :fontset (create-fontset-from-fontset-spec (concat "-*-*-*-*-*--*-*-*-*-*-*-fontset-orgtable" ",han:Sarasa Mono SC Nerd 14")))
  )

;; (after! better-jumper
;;   (define-key evil-motion-state-map (kbd "C-o") 'better-jumper-jump-backward)
;;   (define-key evil-motion-state-map (kbd "<C-i>") 'better-jumper-jump-forward)
;;   )

;; (if (featurep 'cocoa)
;;     (progn
;;       (setq ns-use-native-fullscreen nil)
;;       (setq ns-use-fullscreen-animation nil)

;;       (set-frame-parameter (selected-frame) 'fullscreen 'maximized)

;;       (run-at-time "2sec" nil
;;                    (lambda ()
;;                      (toggle-frame-fullscreen)
;;                      )))
;;   (require 'fullscreen)
;;   (fullscreen))


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(after! treemacs
  (setq doom-themes-treemacs-theme "doom-colors"))

(after! lsp-dart
  (setq lsp-dart-flutter-sdk-dir "/Users/weiwu/development/flutter/")
  (setq lsp-dart-line-length 120)
  (dap-register-debug-template "Flutter :: dev"
                               (list
                                :type "flutter"
                                :program "lib/main_dev.dart"
                                :args '("--flavor" "dev"))))

(after! company
    (define-key company-active-map (kbd "<tab>") 'company-complete-selection)
    (define-key company-active-map (kbd "RET") 'nil))


(after! lsp-mode
  (setq lsp-completion-enable t)
  (setq lsp-enable-xref t)
  (setq lsp-enable-snippet t)
  (setq read-process-output-max (* (* 3 1024) 1024)) ;; 1mb
  (setq lsp-completion-provider :capf)
  (setq lsp-idle-delay 0.200)
  (add-hook 'elixir-mode-hook #'lsp!)
  (add-to-list 'exec-path "/Users/weiwu/my.emacs.d/elixir-ls/release"))


;; (use-package! alchemist
;;   :hook (elixir-mode . alchemist-mode)
;;   :config
;;   (set-lookup-handlers! 'elixir-mode
;;     :definition #'alchemist-goto-definition-at-point
;;     :documentation #'alchemist-help-search-at-point)
;;   (set-eval-handler! 'elixir-mode #'alchemist-eval-region)
;;   (set-repl-handler! 'elixir-mode #'alchemist-iex-project-run)
;;   (setq alchemist-mix-env "dev")
;;   (setq alchemist-hooks-compile-on-save t)
;;   (map! :map elixir-mode-map :nv "m" alchemist-mode-keymap))


(use-package! youdao-dictionary
  :defer 2
  :config
  (setq url-automatic-caching t)
  (which-key-add-key-based-replacements "C-x y" "有道翻译")
  (global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)
  :bind
  (("C-x y t" . 'youdao-dictionary-search-at-point-tooltip)
   ("C-x y p" . 'youdao-dictionary-play-voice-at-point)
   ("C-x y r" . 'youdao-dictionary-search-and-replace)
   ("C-x y i" . 'youdao-dictionary-search-from-input)))

(use-package! ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  :init
  (progn
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "red"))))))
  )


;; Here are some additional functions/macros that could help you configure Doom:
;;
; - `load!' for loading external *.el files relative to this one
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

(use-package! all-the-icons)

(map!
 "\C-s" 'swiper
 :nvig "C-=" 'er/expand-region
 :nvig "C--" 'er/contract-region
 :g "M-0" 'treemacs-select-window
 )

(map!
 :nvi "C-e" 'move-end-of-line
 :nvi "C-a" 'evil-beginning-of-line
 :nvi "C-p" 'evil-previous-line
 :nvi "C-n" 'evil-next-line
 ;; :nvi "C-d" 'evil-delete-char
 :nvi "C-k" 'evil-delete
) 

;; slove up down slow
;;(setq line-move-visual nil)

;; (setq display-line-numbers-type nil)

;;(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; (add-hook 'elixir-mode-hook 'eglot-ensure)
;; Make sure to edit the path appropriately, use the .bat script instead for Windows
;; (add-to-list 'eglot-server-programs '(elixir-mode "/Users/weiwu/.elixir-ls/elixir-ls/release/language_server.sh"))
