(ns beer-song
  (:use [clojure.string :only (capitalize)]))

(defn bottle-count
  [n]
  (cond
    (neg? n) (bottle-count 99)
    (zero? n) "no more bottles of beer"
    (= n 1) "1 bottle of beer"
    :else (str n " bottles of beer")))

(defn verse
  "Returns the nth verse of the song."
  [num]
  (def bottles (bottle-count num))
  (str (capitalize bottles) " on the wall, " bottles ".\n"
       (cond
         (zero? num) "Go to the store and buy some more, "
         :else (str "Take " (if (= num 1) "it" "one") " down and pass it around, "))
       (bottle-count (dec num)) " on the wall.\n"))

(defn sing
  "Given a start and an optional end, returns all verses in this interval. If
  end is not given, the whole song from start is sung."
  ([start] (sing start 0))
  ([start end]
   (->> (range start (dec end) -1)
        (map verse)
        (interpose "\n")
        (apply str))))
