module Allergies (Allergen(..), allergies, isAllergicTo) where

data Allergen =
  Eggs
  | Peanuts
  | Shellfish
  | Strawberries
  | Tomatoes
  | Chocolate
  | Pollen
  | Cats
  deriving (Eq, Enum, Show)

allergenValues :: [(Allergen, Int)]
allergenValues = (\x -> (x, toValue x)) <$> reverse [Eggs ..]
  where
    toValue = (2^) . fromEnum

allergies :: Int -> [Allergen]
allergies = reverse . allergies' allergenValues
  where
    allergies' [] _ = []
    allergies' _ 0 = []
    allergies' ((allergen, value):as) x
      | x >= value = allergen : allergies' as (x - value)
      | otherwise  = allergies' as x

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergen = elem allergen . allergies
