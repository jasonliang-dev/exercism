(ns hamming)

(defn distance [strand1 strand2]
  (if (= (count strand2) (count strand1))
    (count (filter false? (map = strand1 strand2)))))
