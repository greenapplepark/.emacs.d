(require-package 'projectile)

(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

; (setq projectile-globally-ignored-file-suffixes
;    (append projectile-globally-ignored-file-suffixes
;            '(;; visual studio
;              "bak" "exp" "ncb" "ilk" "obj" "manifest" "pdb"
;              ;; elisp
;              "elc"
;              ;; python
;              "pyc"
;              ;; general documentations
;              ;; "txt"
;              "rst" "doc" "html" "qdoc" "log" "mft" "ver" "txt"
;              "png" "jpg" "bmp" "tif"
;              ;; binary
;              "dll" "lib" "exe"
;              "buildpath" "gitignore" "project" "prefs"
;              )))

(setq projectile-globally-ignored-files
    (append projectile-globally-ignored-files '(
        ".git"
        ".svn"
        ".hg"
        ".tag"
        ".buildpath"
        ".gitignore"
        ".project")))

(setq projectile-globally-ignored-directories
    (append projectile-globally-ignored-directories '(
        ".git"
        ".svn"
        ".hg"
        ".settings"
        "vendor"
        "logs"
        ".idea"
        "docs"
        "build"
        "build32"
        "build64"
        "build-x64"
        "build-x86"
        "build-64"
        "build-32"
        "build-vc11"
        "build-vc11-32"
        "build-vc11-64"
        "build-vc11-x86"
        "build-vc11-x64")))

(provide 'init-projectile)
