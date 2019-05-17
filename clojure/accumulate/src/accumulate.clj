(ns accumulate)

(defn accumulate [fn xs]
  (if (empty? xs)
    xs
    (cons (fn (first xs)) (accumulate fn (rest xs)))))
