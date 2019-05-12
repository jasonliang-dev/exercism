(ns reverse-string)

(defn reverse-string
  ([s]
   (def xs (seq s))
   (reverse-string (first xs) (rest xs)))
  ([x xs]
   (if (nil? x)
     ""
     (str (reverse-string (first xs) (rest xs)) x))))
