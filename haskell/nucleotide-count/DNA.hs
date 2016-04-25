module DNA (
  count,
  nucleotideCounts
) where

import qualified Data.Map as Map
import Text.Printf (printf)

isNucleotide :: Char -> Char
isNucleotide nucleotide
  | elem nucleotide "ACGT" = nucleotide
  | otherwise = error $ printf "invalid nucleotide %s" $ show nucleotide

allNucleotides :: String -> String
allNucleotides = map isNucleotide

count :: Char -> String -> Int
count nucleotide dna = length $ filter (== nucleotide') dna'
  where
    nucleotide' = isNucleotide nucleotide
    dna' = allNucleotides dna

nucleotideCounts :: String -> Map.Map Char Int
nucleotideCounts dna = Map.fromList $ map (count' dna') "ACGT"
  where
    count' dna'' nucleotide = (nucleotide, count nucleotide dna'')
    dna' = allNucleotides dna
