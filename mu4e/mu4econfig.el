(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'smtpmail)

; smtp
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials
      '(("smtp.gmail.com" 587 nil nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t)

(require 'mu4e)
(remove-hook 'mu4e-main-mode-hook 'evil-collection-mu4e-update-main-view)

(setq mu4e-maildir (expand-file-name "~/Maildir"))

(setq mu4e-drafts-folder "/mygmail/Drafts")
(setq mu4e-sent-folder   "/mygmail/Sent")
(setq mu4e-trash-folder  "/mygmail/Trash")
; (setq message-signature-file "~/.emacs.d/.signature") ; put your signature in this file

; get mail
(setq mu4e-get-mail-command "mbsync -c ~/.mbsyncrc mygmail"
      mu4e-html2text-command "w3m -T text/html"
      mu4e-update-interval 120
      mu4e-headers-auto-update t
      mu4e-compose-signature-auto-include nil)

(setq mu4e-maildir-shortcuts
      '( ("/mygmail/INBOX"               . ?i)
         ("/mygmail/Sent"   . ?s)
         ("/mygmail/Trash"       . ?t)
         ))

;; show images
(setq mu4e-show-images t)

;; needed for mbsync
(setq mu4e-change-filenames-when-moving t)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; general emacs mail settings; used when composing e-mail
;; the non-mu4e-* stuff is inherited from emacs/message-mode
(setq mu4e-reply-to-address "orcankolankaya@gmail.com"
    user-mail-address "orcankolankaya@gmail.com"
    user-full-name  "Orcan Kolankaya")

;; don't save message to Sent Messages, IMAP takes care of this
; (setq mu4e-sent-messages-behavior 'delete)

;; personal keymaps
(define-key o-map (kbd "m") 'mu4e)

(global-unset-key (kbd "C-x m"))
(global-set-key (kbd "C-x m") 'mu4e-compose-new)

(define-key o-map (kbd "c") 'mu4e-compose-new)
(define-key o-map (kbd "s") 'mu4e-headers-search)

