;;; netrc-mode.el --- Major mode for editing netrc files

;; Copyright (C) 2014 robario

;; Author: robario <webmaster@robario.com>
;; URL: https://github.com/robario/netrc-mode
;; Version: 20140929.145
;; Keywords: file, netrc

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is a major mode only for font-lock-fontify.

;;; Code:



(require 'font-lock)

(defvar netrc-font-lock-keywords
  (list
   '("\\<\\(machine\\|default\\)\\>"
     (1 font-lock-function-name-face t))
   '(" \\(login\\|password\\|account\\) "
     (1 font-lock-keyword-face t))
   '("\\<\\(macdef\\) \\(init\\|.*\\)\\>"
     (1 font-lock-keyword-face t)
     (2 font-lock-variable-name-face t))
   '("#.*"
     (0 font-lock-comment-face t))))

;;;###autoload
(define-derived-mode netrc-mode fundamental-mode "netrc"
  "Major mode for editing netrc files"
  (set (make-local-variable 'font-lock-defaults) '(netrc-font-lock-keywords))
  (set (make-local-variable 'comment-start) "# ")
  (run-hooks 'netrc-mode-hook))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.netrc" . netrc-mode))

(provide 'netrc-mode)
;;; netrc-mode.el ends here
