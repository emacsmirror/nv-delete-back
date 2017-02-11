;;; nv-delete-back.el --- backward delete like modern text editors -*- lexical-binding: t -*-

;; Copyright (C) 2017 Nicolas Vaughan

;; Author: Nicolas Vaughan <n.vaughan [at] oxon.org>
;; Keywords: lisp
;; Version: 0.0.2
;; Package-Requires: ((emacs "24"))

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

;; This package replicates the backward delete behavior of modern text editors like oXygen XML or Sublime Text.
;; Recomended binding (requires bind-key):
;; (bind-key "C-<backspace>" 'nv-delete-back-all)
;; (bind-key "M-<backspace>" 'nv-delete-back)


;;; Code:


;;;###autoload
(defun nv-delete-back-all ()
  "Backward deletes either (i) all empty lines, or (ii) one whole word, or (iii) a single non-word character."
  (interactive)
  (if (not (or (looking-back "[\s-]" 1 nil)
               (looking-back "[\n]" 1 nil)
               )
           )
      ;;then
      (nv-delete-back-word)
    ;;else
    (while
        (or (looking-back "[\n]" 1 nil)
            (looking-back "[\s-]" 1 nil)
            )
      (delete-char -1)
      )
    )
  )


;;;###autoload
(defun nv-delete-back ()
  "Backward-deletes either (i) all spaces, (ii) one whole word, or (iii) a single non-word/non-space character."
  (interactive)
  (if (not (looking-back "[\s-]" 1 nil))
      ;;then
      (nv-delete-back-word)
    ;;else
    (while
        (looking-back "[\s-]" 1 nil)
      (delete-char -1)
      )
    )
  )


;;;###autoload
(defun nv-delete-back-word ()
  "Backward-deletes either (i) one whole word, or (ii) a single non-word char."
  (interactive)
  ;; first check if text is selected
  (if (region-active-p)
      ;; then
      (delete-region (region-beginning) (region-end))
    ;;else
    (if (looking-back "[[:alnum:]]" 1 nil)
        ;; then
        (while
            (looking-back "[[:alnum:]]" 1 nil)
          (delete-char -1)
          )
      ;; else
      (if (looking-back "[^[:alnum:]]" 1 nil)
          (delete-char -1)
        )
      )
    )
  )

(provide 'nv-delete-back)
;;; nv-delete-back.el ends here
