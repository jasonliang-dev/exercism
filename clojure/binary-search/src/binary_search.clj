(ns binary-search)

(defn middle [xs]
  (quot (dec (count xs)) 2))

(defn search-for
  ([item xs] (search-for item xs 0))
  ([item xs left]
   (def mid (middle xs))
   (cond
     (empty? xs) (throw (Exception. "not found"))
     (> (nth xs mid) item) (search-for item
                                       (take (dec mid) xs)
                                       left)
     (< (nth xs mid) item) (search-for item
                                       (drop (inc mid) xs)
                                       (+ (inc mid) left))
     :else (+ mid left))))
