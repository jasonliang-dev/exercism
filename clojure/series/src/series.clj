(ns series)

(defn slices-old
  [string length]
  (cond
    (zero? length) [""]
    (< (count string) length) []
    :else (cons
           (apply str (take length string))
           (slices-old (drop 1 string) length))))

(defn slices
  [string length]
  (if (zero? length)
    [""]
    (loop [s string
           acc []]
      (if (< (count s) length)
        acc
        (recur
         (drop 1 s)
         (conj acc (apply str (take length s))))))))
