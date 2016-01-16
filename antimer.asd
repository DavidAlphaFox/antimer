(defsystem antimer
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :maintainer "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :version "0.1"
  :homepage ""
  :bug-tracker ""
  :source-control (:git "")
  :depends-on (;; Documents
               :common-doc
               :pandocl
               ;; Database
               :crane
               :cl-pass
               :dbd-sqlite3
               ;; Web interface
               :lucerne
               :lucerne-auth
               :clack-handler-hunchentoot
               ;; Command line
               :command-line-arguments
               ;; Search
               :searchspace
               ;; Configuration
               :cl-yaml
               ;; Utilities
               :uiop
               :alexandria
               :difflib
               :split-sequence
               :yason
               :uuid)
  :defsystem-depends-on (:asdf-linguist)
  :build-operation program-op
  :build-pathname "antimer"
  :entry-point "antimer.cli:main"
  :components ((:module "assets"
                :components
                ((:module "css"
                  :components
                  ((:sass "main")))))
               (:module "src"
                :serial t
                :components
                ((:file "event")
                 (:file "config")
                 (:file "wiki")
                 (:file "plugin")
                 (:file "diff")
                 (:file "doc")
                 (:module "core"
                  :serial t
                  :components
                  ((:file "db")
                   (:file "web")))
                 (:file "wiki-methods")
                 (:file "cli"))))
  :description "A wiki."
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op antimer-test))))
