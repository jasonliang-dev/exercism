(ns isbn-verifier)

(defn toNumberList [isbn]
  (def cleaned (reverse (filter #(not= \- %) isbn)))
  (def digits (map #(Character/digit % 10) (rest cleaned)))
  (if (= (first cleaned) \X)
    (cons 10 digits)
    (cons (Character/digit (first cleaned) 10) digits)))

(defn isbn? [isbn]
  (def xs (toNumberList isbn))
  (and (= (count xs) 10)
       (every? #(not (neg? %)) xs)
       (= (mod (reduce + (map * (range 1 11) xs)) 11) 0)))
