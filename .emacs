
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(cua-mode nil nil (cua-base))
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("d606ac41cdd7054841941455c0151c54f8bff7e4e050255dbd4ae4d60ab640c1" "eb34ed27768eeea1e423f8987b060e49829aac558fe0669b3de0227da67b661c" "c0429683ff6ea4bed2f3d5a1c94717dff22d4f52ec1f5ebaf67dfab5d78787f1" "20e23cba00cf376ea6f20049022241c02a315547fc86df007544852c94ab44cb" "cdfc5c44f19211cfff5994221078d7d5549eeb9feda4f595a2fd8ca40467776c" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (pdf-tools ac-js2 foggy-night-theme avk-emacs-themes zenburn-theme indium rjsx-mode)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq url-proxy-services '(("no_proxy" . "work\\.com")
                           ("http" . "proxy.ozon.ru:3128")))

;;melpa
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;set consolas as a def fonts
(set-face-font 'default
	       "-outline-Consolas-normal-r-normal-normal-15-112-96-96-c-*-iso8859-1")

;;set coursor
(setq-default cursor-type 'bar) 

;;
(add-hook 'js2-mode-hook 'ac-js2-mode)

;;backspace
(global-set-key [(control ?h)] 'delete-backward-char)

;;pdf
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . no-pdf))
(defun no-pdf ()
      "Run pdftotext on the entire buffer."
      (interactive)
      (let ((modified (buffer-modified-p)))
        (erase-buffer)
        (shell-command
         (concat "pdftotext " (buffer-file-name) " -")
         (current-buffer)
         t)
        (set-buffer-modified-p modified)))
