(ns isbn-verifier)

(defn toNumberList [isbn]
  (let [[check & cleaned] (reverse (filter #(not= \- %) isbn))
        digits (map #(Character/digit % 10) cleaned)]
    (if (= check \X)
      (cons 10 digits)
      (cons (Character/digit check 10) digits))))

(defn isbn? [isbn]
  (let [xs (toNumberList isbn)]
    (and (= (count xs) 10)
         (every? #((complement neg?) %) xs)
         (->> xs
           (map * (range 1 11))
           (reduce +)
           (#(mod % 11))
           (zero?)))))
