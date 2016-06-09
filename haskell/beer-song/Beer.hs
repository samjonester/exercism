module Beer (sing,
            verse) where

verse :: Int -> String
verse 2 =  "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
verse 1 =  "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
verse 0 =  "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
verse x = verse' (show x) (show $ x-1)
  where
    verse' current next = current ++ " bottles of beer on the wall, " ++ current ++ " bottles of beer.\nTake one down and pass it around, " ++ next ++ " bottles of beer on the wall.\n"

sing :: Int -> Int -> String
sing top bottom = unlines $ reverse $ map verse [bottom..top]
