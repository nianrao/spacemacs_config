;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     javascript
     windows-scripts
     git
     auto-completion
     better-defaults
     emacs-lisp
     markdown
     version-control
     ;; ivy
     (markdown :variables markdown-live-preview-engine 'vmd)
     ;; org
     (shell :variables
             shell-default-height 30
             shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ;; version-control
     evil-commentary
     ;; evil-snipe
     themes-megapack
     semantic
     ;; forth
     cscope
     c-c++
     (c-c++ :variables c-c++-default-mode-for-headers 'c++-mode)
     (c-c++ :variables c++-enable-organize-includes-on-save t)
     (c-c++ :variables c-c++-enable-clang-support t)
     (c-c++ :variables c-c++-enable-clang-format-on-save t)
     (c-c++ :variables c-c++-enable-google-style t
            c-c++-enable-google-newline t)
     (c-c++ :variables c-c++-enable-auto-newline t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
      meson-mode
      kaolin-themes
      auto-package-update
      atom-one-dark-theme
      function-args
      irony
      company-irony
     )
   ;;  list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(atom-one-dark
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   dotspacemacs-maximized-at-startup t
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (defun dotspacemacs/user-init ()
    (setq-default git-magit-status-fullscreen t))

  (require 'package)
  (setq package-check-signature nil)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize)

  (require 'smartparens-config)

  ;; setup tab
  (setq-default indent-tabs-mode nil)
  (setq-default default-tab-width 3)
  (setq-default c-default-style "linux"
                c-basic-offset 3)

  ;; Format the code on save
  (defun clang-format-on-save ()
    (add-hook 'before-save-hook #'clang-format-buffer nil 'local))
  (add-hook 'c++-mode-hook 'clang-format-on-save)
  (add-hook 'c-mode-hook 'clang-format-on-save)

  (defun my-vhdl-beautify-buffer ()
    (interactive)
    (let ((vhdl-standard '(93 (ams match)))) (vhdl-beautify-buffer))
    )

  (defun vhdl-beautify-on-save ()
    ;; (add-hook 'before-save-hook #'vhdl-beautify-buffer nil 'local)
    (add-hook 'before-save-hook #'my-vhdl-beautify-buffer nil 'local)
    )
  ;; (add-hook 'vhdl-mode-hook 'vhdl-beautify-on-save)

  ;; ;; delete trailing spaces on save
  ;; (defun delete-trailing-whitespace-on-save ()
  ;;   (add-hook 'before-save-hook 'delete-trailing-whitespace))
  ;; (add-hook 'prog-mode-hook 'delete-trailing-whitespace-on-save)

  ;; 80 column marker
  ;; Activate column indicator in prog-mode and text-mode
  (add-hook 'prog-mode-hook 'turn-on-fci-mode)
  (add-hook 'text-mode-hook 'turn-on-fci-mode)

  ;; flycheck setup
  (require 'flycheck)
  (setq-default flycheck-disabled-checkers '(c/c++-clang))
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (add-hook 'c++-mode-hook 'flycheck-mode)
  (add-hook 'c-mode-hook 'flycheck-mode)
  (add-hook 'vhdl-mode-hook 'flycheck-mode)
  (add-hook 'emacs-lisp-mode-hook 'flycheck-mode)

  (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++17")))
  (add-hook 'c-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++17")))

  (add-hook 'vhdl-mode-hook (lambda () (setq flycheck-ghdl-language-standard "93")))
  (add-hook 'vhdl-mode-hook (lambda () (setq flycheck-ghdl-ieee-library "synopsys")))

  ;; vivado more for xdc file
  (load-file "~/.emacs.d/private/local/vivado-mode.el")
  (setq auto-mode-alist (cons  '("\\.xdc\\'" . vivado-mode) auto-mode-alist))
  (add-hook 'vivado-mode-hook '(lambda () (font-lock-mode 1)))
  (autoload 'vivado-mode "vivado-mode")

  ;; forth-mode
  (add-to-list 'load-path "~/.emacs.d/private/local/forth-mode")
  (require 'forth-mode)
  (require 'forth-block-mode)
  (require 'forth-interaction-mode)

  ;; multiple-cursors-mode
  (require 'multiple-cursors)
  (global-set-key (kbd "C-c m c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

  ;; meson mode
  (require 'meson-mode)
  ;; (add-hook 'meson-mode-hook 'company-mode)

  ;; auto package update
  (require 'auto-package-update)
  (auto-package-update-maybe)

  ;; function args
  (fa-config-default)

  ;; auto complete default config
  ;; (ac-config-default)

  ;; enable indent guide
  (require 'indent-guide)
  (indent-guide-global-mode)

  ;; enable company mode globaly
  (add-hook 'after-init-hook 'global-company-mode)

  (eval-after-load 'company '(add-to-list 'company-backends 'company-irony))
  ;; Windows performance tweaks
  ;;
  (when (boundp 'w32-pipe-read-delay)
    (setq w32-pipe-read-delay 0))
  ;; Set the buffer size to 64K on Windows (from the original 4K)
  (when (boundp 'w32-pipe-buffer-size)
    (setq irony-server-w32-pipe-buffer-size (* 64 1024)))
)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (global-git-commit-mode t)

  '(version-control :variables
                    version-control-diff-tool 'diff-hl)
  '(version-control :variables
                    version-control-diff-side 'left)
  '(version-control :variables
                    version-control-global-margin t)
  (global-diff-hl-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" "669e02142a56f63861288cc585bee81643ded48a19e36bfdf02b66d745bcc626" "58c2c8cc4473c5973e77f4b78a68c0978e68f1ddeb7a1eb34456fce8450be497" "3ee39fe8a6b6e0f1cbdfa33db1384bc778e3eff4118daa54af7965e9ab8243b3" "f0a76ae259b7be77e59f98501957eb45a10af0839dd9eb29fdd5691ed74771d4" "ed573618e4c25fa441f12cbbb786fb56d918f216ae4a895ca1c74f34a19cfe67" "53993d7dc1db7619da530eb121aaae11c57eaf2a2d6476df4652e6f0bd1df740" "a7928e99b48819aac3203355cbffac9b825df50d2b3347ceeec1e7f6b592c647" "f7b0f2d0f37846ef75157f5c8c159e6d610c3efcc507cbddec789c02e165c121" "b69323309e5839676409607f91c69da2bf913914321c995f63960c3887224848" "054e929c1df4293dd68f99effc595f5f7eb64ff3c064c4cfaad186cd450796db" "2f945b8cbfdd750aeb82c8afb3753ebf76a1c30c2b368d9d1f13ca3cc674c7bc" "0eb3c0868ff890b0c4ee138069ce2a8936a8a69ba150efa6bfb9fb7c05af5ec3" "a70b47c87e9b0940f6fece46656200acbfbc55e129f03178de8f50934ac89f58" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "11e57648ab04915568e558b77541d0e94e69d09c9c54c06075938b6abc0189d8" "4780d7ce6e5491e2c1190082f7fe0f812707fc77455616ab6f8b38e796cbffa9" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "2d15316ddb0b94c9c8b4c6cc77ef68486ff738d05bbb6edefec0dca7eafedcae" "c7f10959cb1bc7a36ee355c765a1768d48929ec55dde137da51077ac7f899521" "37ba833442e0c5155a46df21446cadbe623440ccb6bbd61382eb869a2b9e9bf9" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "9b35c097a5025d5da1c97dba45fed027e4fb92faecbd2f89c2a79d2d80975181" "392395ee6e6844aec5a76ca4f5c820b97119ddc5290f4e0f58b38c9748181e8d" "2a7beed4f24b15f77160118320123d699282cbf196e0089f113245d4b729ba5d" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "2540689fd0bc5d74c4682764ff6c94057ba8061a98be5dd21116bf7bf301acfb" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "f11e219c9d043cbd5f4b2e01713c2c24a948a98bed48828dc670bd64ae771aa1" "cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" "d7383f47263f7969baf3856ab8b3df649eb77eafdff0c5731bee2ad18e0faed2" "3fa65d60abd566321f93d1354f91dedae8ab795bb688a421c69e2e0f7fa3c9bc" "8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "d71f6c718dab453b625c407adc50479867a557668d5c21599a1ebea204d9e4f3" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "6e32d7aab92ad2ad4d3a915cd9ace5dc1d9d8f0486b785bdb86c79ff5ca0c189" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "d9aa334b2011d57c8ce279e076d6884c951e82ebc347adbe8b7ac03c4b2f3d72" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "ab2cbf30ab758c5e936b527377d543ce4927001742f79519b62c45ba9dd9f55e" "66f32da4e185defe7127e0dc8b779af99c00b60c751b0662276acaea985e2721" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (company-irony irony function-args vimish-fold auto-package-update atom-dark-theme atom-one-dark-theme doom-themes kaolin-themes meson-mode evil-smartparens wgrep smex ivy-hydra counsel-projectile counsel swiper ivy flymd spacemacs-theme minimap vmd-mode markdown-preview-mode markdown-mode+ gh-md gmail-message-mode ham-mode html-to-markdown edit-server ag powershell mmm-mode markdown-toc markdown-mode stickyfunc-enhance org-present xterm-color srefactor shell-pop org-projectile org-category-capture org-pomodoro alert log4e gntp org-mime org-download multi-term htmlize helm-cscope xcscope gnuplot eshell-z eshell-prompt-extras esh-help zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme evil-snipe evil-commentary unfill mwim helm-company helm-c-yasnippet git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck disaster diff-hl company-tern dash-functional tern company-statistics company-c-headers company cmake-mode clang-format auto-yasnippet auto-dictionary ac-ispell auto-complete smeargle orgit magit-gitflow magit-popup helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit transient git-commit with-editor web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode evil-unimpaired ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((eval setq flycheck-gcc-include-path
           (list
            (expand-file-name "src/include"
                              (projectile-project-root))
            (expand-file-name "googletest/googlemock/include"
                              (projectile-project-root))
            (expand-file-name "googletest/googletest/include"
                              (projectile-project-root))
            (expand-file-name "test/include"
                              (projectile-project-root))))
     (eval set
           (make-local-variable
            (quote my-project-path))
           (file-name-directory
            (let
                ((d
                  (dir-locals-find-file default-directory)))
              (if
                  (stringp d)
                  d
                (car d)))))
     (eval setq flycheck-gcc-include-path
           (list
            (expand-file-name "src/include"
                              (projectile-project-root))
            (expand-file-name "test/include"
                              (projectile-project-root))))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
