(in-package :cl-user)
(defpackage antimer.plugin
  (:use :cl)
  (:export :plugin
           :name
           :short-description
           :on-event)
  (:documentation "Antimer's plugin system."))
(in-package :antimer.plugin)

(defclass plugin ()
  ()
  (:documentation "The base class of Antimer plugins."))

(defgeneric name (plugin)
  (:documentation "Returns the human-readable name of a plugin, a string.")

  (:method ((plugin plugin))
    "The default method: return the class name.

Examples:

@begin[lang=lisp](code)
(defclass my-plugin (antimer.plugin:plugin)
  ())

(defmethod antimer.plugin:name ((plugin my-plugin))
  \"My Plugin\")
@end(code)"
    (string-capitalize (class-name (class-of plugin)))))

(defgeneric short-description (plugin)
  (:documentation "Return a short, one-line description of the plugin.

Return @c(nil) to indicate there is no description.

Example:

@begin[lang=lisp](code)
(defclass disqus (antimer.plugin:plugin)
  ())

(defmethod antimer.plugin:name ((plugin my-plugin))
  \"Adds support for Disqus comment threads.\")
@end(code)")

  (:method ((plugin plugin))
    "The default method: return @c(nil)."
    nil))

(defgeneric on-event (plugin event)
  (:documentation "Respond to an event.

The return value is ignored.")

  (:method ((plugin plugin) (event t))
    "The default method: does nothing."
    nil))
