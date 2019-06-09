(ns armstrong-numbers)

(defn to-digits [n]
  (->> n
       str
       (map (comp read-string str))))

(defn exp [x n]
  (reduce * (repeat n x)))

(defn armstrong? [num]
  (as-> num n
       (to-digits n)
       (map exp n (repeat (count n)))
       (apply + n)
       (= num n)))
