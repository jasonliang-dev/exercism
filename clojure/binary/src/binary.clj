(ns binary)

(defn add-bit [bitstr bit]
  (+ (* bitstr 2) (Character/digit bit 10)))

(defn to-decimal [str]
  (if (every? #{\0 \1} str)
    (reduce add-bit 0 str)
    0))
