(global-linum-mode 1)

; use better package manager
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

; use emacs-python package
(load-file "~/.emacs.d/emacs-for-python/epy-init.el")
(epy-setup-checker "pyflakes %f")
(epy-django-snippets)
(epy-setup-ipython)
(global-hl-line-mode t) ;; To enable
(set-face-background 'hl-line "blue"") ;; change with the color that you like
                                       ;; for a list of colors: http://raebear.net/comp/emacscolors.html

(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)


; Themes settings
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-file "~/.emacs.d/themes/emacs-color-theme-solarized/solarized-definitions.el")
(load-theme 'solarized t)


; Proxy

;(setq url-proxy-services
;   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;     ("http" . "proxy.com:8080")
;     ("https" . "proxy.com:8080")))

;(setq url-http-proxy-basic-auth-storage
;    (list (list "proxy.com:8080"
;                (cons "Input your LDAP UID !"
;                      (base64-encode-string "LOGIN:PASSWORD")))))
