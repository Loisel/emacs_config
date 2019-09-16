;;; helpers --- Some functions for better interaction with different modes
;;; Commentary:
;;; Code:
(provide 'helpers)

(defun ess-execute-to-point ()
  (interactive)
  (ess-eval-region (point-min) (point) t)
  )

(defun ess-insert-def ()
  (interactive)
  (insert " <- ")
  )

(eval-after-load 'dired
  '(define-key dired-mode-map (kbd "C-c Q") 'dired-do-query-replace-regexp))

(defun add-quotes ()
  "Add quotes around word at point."
  (interactive)
  (let (bounds pos1 pos2 mything)
    (setq bounds (bounds-of-thing-at-point 'symbol))
    (setq pos1 (car bounds))
    (setq pos2 (cdr bounds))
    (setq word (buffer-substring-no-properties pos1 pos2))

    (delete-region pos1 pos2)
    (insert (format "%S" word))
    ))

(defun print-to-file (filename data)
  (with-temp-file filename
    (prin1 data (current-buffer))))


(defun read-from-file (filename)
  (with-temp-buffer
    (insert-file-contents filename)
    (cl-assert (eq (point) (point-min)))
    (read (current-buffer))))

;; (dolist (package-name (read-from-file "~/.emacs.d/package.list"))
;;   (package-install package-name))

;; (print-to-file "package.list" package-activated-list)
