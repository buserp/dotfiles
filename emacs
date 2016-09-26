(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue)))
 '(desktop-save-mode t)
 '(haskell-interactive-popup-errors nil)
 '(ido-mode (quote both) nil (ido))
 '(package-selected-packages
   (quote
    (exec-path-from-shell magit haskell-mode evil-leader evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paul's configuration section!!!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use evil-leader
(global-evil-leader-mode)

;; Set our leader key to Spacebar
(evil-leader/set-leader "<SPC>")

;; Enable evil-mode (MUHAHAHAHAA)
(evil-mode 1)

;; Fancy evil-mode bindings
(eval-after-load "evil"
  '(progn

     ;; Easy window movement
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

     ;; Make C-u scroll up half a page, like in vim
     (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

     ;; Open emacs help with <leader> h
     (evil-leader/set-key "h" 'help-command)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Haskell stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Be interactive and indent well when we use haskell
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

;; Use C-c C-b for switching back and forth between REPL and editor in Haskell
(add-hook 'haskell-interactive-mode-hook (lambda () (local-set-key (kbd "C-c C-b") #'haskell-interactive-switch-back)))

;; Don't use vim bindings when in a Haskell REPL or error dialogue
(add-to-list 'evil-emacs-state-modes 'haskell-interactive-mode)
(add-to-list 'evil-emacs-state-modes 'haskell-error-mode)
(add-to-list 'evil-emacs-state-modes 'term-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Aesthetics
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set default font
(set-face-attribute 'default nil :font "Menlo-14" )
(set-frame-font "Menlo-14" nil t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Stupid hacks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make the emacs built-in shell have all our environment variables
(exec-path-from-shell-initialize)
