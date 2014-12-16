;; Acesse:
;; http://ergoemacs.org/emacs/elisp_menu.html
;; Para entender o cÃ³digo aqui
;; Creating a new menu pane in the menu bar to the right of "Tools" menu
(defun shell-command-on-buffer ()
  "Asks for a command and executes it in inferior shell with current buffer
as input."
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
;   (print projeto)
   (read-shell-command "Shell command on buffer: ")))

(defun instalar ()
  (interactive)
  (progn
    (cd (format "C:/%s" projeto))
    (shell-command (format "adb install bin/%s-debug.apk" projeto))))

(defun construir ()
  (interactive)
  (progn
    (cd (format "C:/%s" projeto))
    (shell-command "ant debug")))

(defun criar (nome target)
  "Asks for a command and executes it in inferior shell with current buffer
as input."
  (interactive "sNome do projeto: \nnTarget: ")
  (shell-command-on-region
   (point-min) (point-max)
   (format "C:/android-sdk/tools/android create project --target %d --name %s --path C:/%s --activity Principal --package br.ifsp.%s" target nome nome nome)
   (setq projeto nome));; variável global com o nome do projeto
   (find-file-existing (format "C:/%s/src/br/ifsp/%s/Principal.java" nome nome))   (find-file-existing (format "C:/%s/res/values/strings.xml" nome))
   (find-file-existing (format "C:/%s/res/layout/main.xml" nome)))

(defun listar () 
  (interactive) 
  (shell-command-on-region 
   (point-min) (point-max) 
   "C:/android-sdk/tools/android list targets"))

(define-key-after
  global-map
  [menu-bar pcp2] ;; nome do menu
  (cons "PCP2" (make-sparse-keymap "hoot hoot"))
  'help-menu ) ;; depois do Help
;; Para encontrar o nome de um menu use o comando:
;; describe-key
;; e clique no menu, exemplo: File -> Open:
;; <menu-bar> <file> <open-file>
;; quer dizer que o nome do menu Ã© [menu-bar file]

;; Creating a menu item, under the menu by the id "[menu-bar mymenu]"
;; creating another menu item
(define-key
  global-map
  [menu-bar pcp2 instalar]
  '("Instalar App" . instalar))

(define-key
  global-map
  [menu-bar pcp2 construir]
  '("Construir App" . construir))

(define-key
  global-map
  [menu-bar pcp2 criar]
  '("Criar Projeto" . criar))

(define-key
  global-map
  [menu-bar pcp2 listar]
  '("Listar" . listar))


;; code to remove the whole menu panel
;; (global-unset-key [menu-bar mymenu])
