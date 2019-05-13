(ns rna-transcription)

(defn transform
  [nucleotide]
  (case nucleotide
    \G \C
    \C \G
    \T \A
    \A \U
    (assert false)))

(defn to-rna
  [dna]
  (apply str (map transform dna)))
