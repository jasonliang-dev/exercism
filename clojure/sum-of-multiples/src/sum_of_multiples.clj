(ns sum-of-multiples)

(defn multiple? [multiples n]
  (some true? (map #(= 0 (mod n %)) multiples)))

(defn sum-of-multiples [multiples n]
  (apply + (filter #(multiple? multiples %) (range 1 n))))
