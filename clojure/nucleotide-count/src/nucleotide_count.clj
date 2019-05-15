(ns nucleotide-count)

(defn count [nucleotide strand]
  (assert (some #{nucleotide} "ACGT"))
  (clojure.core/count (filter #(= nucleotide %) strand)))

(defn nucleotide-counts [strand]
  {\A (count \A strand)
   \T (count \T strand)
   \G (count \G strand)
   \C (count \C strand)})
