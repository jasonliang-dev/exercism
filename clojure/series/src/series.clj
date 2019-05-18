(ns series)

(defn slices
  [string length]
  (cond
    (zero? length) [""]
    (< (count string) length) []
    :else (cons
           (apply str (take length string))
           (slices (drop 1 string) length))))
