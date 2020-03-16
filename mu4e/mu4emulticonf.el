(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'smtpmail)

(require 'mu4e)
(remove-hook 'mu4e-main-mode-hook 'evil-collection-mu4e-update-main-view)

(setq mu4e-maildir (expand-file-name "~/Maildir"))

; get mail
(setq mu4e-get-mail-command "mbsync -a"
      mu4e-html2text-command "w3m -T text/html"
      mu4e-update-interval 300
      mu4e-headers-auto-update t
      mu4e-compose-signature-auto-include nil)

;; show full addresses in view message (instead of just names)
;; toggle per name with M-RET
(setq mu4e-view-show-addresses 't)

;; show images
(setq mu4e-show-images t)

;; use fancy chars
(setq mu4e-use-fancy-chars t)

;; needed for mbsync
(setq mu4e-change-filenames-when-moving t)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; Attachments
(setq mu4e-attachment-dir  "~/Downloads/Mail-Attachments/")

;; mu4e-context
(setq mu4e-context-policy 'pick-first)
(setq mu4e-compose-context-policy 'always-ask)

(setq mu4e-contexts
  (list
   (make-mu4e-context
    :name "Gmail" ;;for acc1-gmail
    :enter-func (lambda () (mu4e-message "Entering context Gmail"))
    :leave-func (lambda () (mu4e-message "Leaving context Gmail"))
    :match-func (lambda (msg)
		  (when msg
		(mu4e-message-contact-field-matches
		 msg '(:from :to :cc :bcc) "orcankolankaya@gmail.com")))
    :vars '((user-mail-address . "orcankolankaya@gmail.com")
	    (user-full-name . "Orcan Kolankaya")
	    (mu4e-sent-folder . "/mygmail/Sent")
	    (mu4e-drafts-folder . "/mygmail/Drafts")
	    (mu4e-trash-folder . "/mygmail/Trash")
	    (mu4e-compose-format-flowed . t)
	    (message-send-mail-function . smtpmail-send-it)
	    (smtpmail-smtp-user . "orcankolankaya@gmail.com")
	    (smtpmail-starttls-credentials . (("smtp.gmail.com" 587 nil nil)))
	    (smtpmail-auth-credentials . (expand-file-name "~/.authinfo.gpg"))
	    (smtpmail-default-smtp-server . "smtp.gmail.com")
	    (smtpmail-smtp-server . "smtp.gmail.com")
	    (smtpmail-smtp-service . 587)
	    (smtpmail-debug-info . t)
	    (smtpmail-debug-verbose . t)
	    (mu4e-maildir-shortcuts . ( ("/mygmail/INBOX"  . ?i)
					("/mygmail/Sent"   . ?s)
					("/mygmail/Trash"  . ?t)
					("/mygmail/Drafts" . ?d)
					))))
   (make-mu4e-context
    :name "Metu-mail" ;;for acc2-metumail
    :enter-func (lambda () (mu4e-message "Entering context Metu-mail"))
    :leave-func (lambda () (mu4e-message "Leaving context Metu-mail"))
    :match-func (lambda (msg)
		  (when msg
		(mu4e-message-contact-field-matches
		 msg '(:from :to :cc :bcc) "koorcan@metu.edu.tr")))
    :vars '((user-mail-address . "koorcan@metu.edu.tr")
	    (user-full-name . "Orcan Kolankaya")
	    (mu4e-sent-folder . "/mymetu/Sent")
	    (mu4e-drafts-folder . "/mymetu/Drafts")
	    (mu4e-trash-folder . "/mymetu/Trash")
	    (mu4e-compose-format-flowed . t)
	    (message-send-mail-function . smtpmail-send-it)
	    (smtpmail-smtp-user . "koorcan")
	    (smtpmail-starttls-credentials . (("smtp.metu.edu.tr" 587 nil nil)))
	    (smtpmail-auth-credentials . (expand-file-name "~/.authinfo.gpg"))
	    (smtpmail-default-smtp-server . "smtp.metu.edu.tr")
	    (smtpmail-smtp-server . "smtp.metu.edu.tr")
	    (smtpmail-smtp-service . 587)
	    (smtpmail-debug-info . t)
	    (smtpmail-debug-verbose . t)
	    (mu4e-maildir-shortcuts . ( ("/mymetu/INBOX"  . ?i)
					("/mymetu/Sent"   . ?s)
					("/mymetu/Trash"  . ?t)
					("/mymetu/Drafts" . ?d)
					))))))

;; This sets `mu4e-user-mail-address-list' to the concatenation of all
;; `user-mail-address' values for all contexts. If you have other mail
;; addresses as well, you'll need to add those manually.
(setq mu4e-user-mail-address-list
  (delq nil
    (mapcar (lambda (context)
	 (when (mu4e-context-vars context)
	   (cdr (assq 'user-mail-address (mu4e-context-vars context)))))
	       mu4e-contexts)))

;; personal keymaps
(define-key o-map (kbd "m") 'mu4e)

(global-unset-key (kbd "C-x m"))
(global-set-key (kbd "C-x m") 'mu4e-compose-new)

(define-key o-map (kbd "c") 'mu4e-compose-new)
(define-key o-map (kbd "s") 'mu4e-headers-search)
