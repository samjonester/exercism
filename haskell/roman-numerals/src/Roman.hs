module Roman (numerals) where

numeralConversions :: [(Integer, String)]
numeralConversions =
  [(1000, "M"), (900, "CM"), (500, "D"),
   (400, "CD"), (100, "C"),  (90, "XC"),
   (50, "L"),   (40, "XL"),  (10, "X"),
   (9, "IX"),   (5, "V"),    (4, "IV"),
   (1, "I")]

numerals :: Integer -> String
numerals = convert numeralConversions
  where
    convert [] _ = ""
    convert all@((num, str):tail) n
      | num >= n  = str ++ convert all (n - num)
      | otherwise = convert tail num
