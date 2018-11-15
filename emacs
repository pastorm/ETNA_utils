;===============================================================================
(add-to-list 'load-path "~/.emacs.d/lisp/")      ; add dossier avec HEADER
(load-file "~/.emacs.d/lisp/std_comment.el")     ; load le HEADER ETNA

(setq scroll-step 1)                             ; scroll ligne par ligne

;(setq c-toggle-auto-newline)                     ; Va automatiquement  la ligne lorsque l'on appuie sur ; { }
;(global-set-key (kbd "RET") 'newline-and-indent) ; Indente automatiquement lorsque l'on appuie sur Enter

(setq c-default-style "linux")                   ; Indentation Linux style

(setq mac-option-modifier 'meta)                 ; touche Fn --> meta

(setq-default header-line-format(list " " (make-string 78 ?-) "|")) ; 80 char ruler, under | is the 80th

                                        ;
                                        ; Change backup configurations
                                        ;
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")) ; Change directory
      backup-by-copying t    ; Make copy rather than rename
      version-control t    ; Allow emacs to create numbered backup
      delete-old-versions t    ; Remove excess backup silently
      kept-new-versions 2    ; Number of newest backups to keep
      kept-old-versions 2    ; Number of oldest backups to keep
      )
                                        ; Auto-save if emacs is killed
(add-hook 'kill-emacs-hook 'do-auto-save)

                                        ;
                                        ; MELPA
                                        ;
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(add-to-list 'package-archives
                          '("melpa-stable" . "https://stable.melpa.org/packages/") t)

                                        ;
                                        ;PHP autocomplete
                                        ;
;(add-hook 'php-mode-hook '(lambda ()
;                           (auto-complete-mode t)
;                           (require 'ac-php)
;                           (setq ac-sources  '(ac-source-php ) )
;                           (yas-global-mode 1)
;
; (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
;                          (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
;                          ))
                                        ;
                                        ;HTML autocomplete
                                        ;
;(add-hook 'html-mode-hook 'ac-html-enable)

                                        ;
                                        ;vertical lines
                                        ;
(require 'indent-guide)
;  (set-face-background 'indent-guide-face "dimgray")

