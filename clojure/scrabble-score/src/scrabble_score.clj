(ns scrabble-score
  (:require [clojure.string :as s]))

(defn score-letter [letter]
  (def l (s/upper-case letter))
  (some (fn [[k v]] (when (s/includes? k l) v))
        {"AEIOULNRST" 1
         "DG" 2
         "BCMP" 3
         "FHVWY" 4
         "K" 5
         "JX" 8
         "QZ" 10}))

(defn score-word [xs]
  (reduce + (map (comp score-letter str) xs)))
