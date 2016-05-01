module Phone (
              areaCode
            , number
            , prettyPrint
             ) where

import Data.Char (isDigit)

data Phone = Phone {
    phoneAreaCode :: String,
    phonePrefix :: String,
    phoneLineNumber :: String
                   } deriving (Show)

parsePhone :: String -> Maybe Phone
parsePhone = maybeParse.clean
  where
    clean = filter isDigit
    maybeParse s
      | length s == 10                      = Just $ toPhone s
      | length s == 11 && head s == '1'     = Just $ toPhone $ drop 1 s
      | otherwise                           = Nothing
    toPhone s = 
      Phone {
        phoneAreaCode = take(3) s, 
        phonePrefix = (drop 3 . take 6) s, 
        phoneLineNumber = drop 6 s
      }

areaCode :: String -> String
areaCode s = case parsePhone s of 
               Nothing -> "000"
               Just (Phone {phoneAreaCode = ac}) -> ac

number :: String -> String
number s = case parsePhone s of 
               Nothing -> "0000000000"
               Just (Phone {phoneAreaCode = ac, phonePrefix = p, phoneLineNumber = ln}) -> ac ++ p ++ ln

prettyPrint :: String -> String
prettyPrint s = case parsePhone s of 
               Nothing -> "0000000000"
               Just (Phone {phoneAreaCode = ac, phonePrefix = p, phoneLineNumber = ln}) -> "(" ++ ac ++ ") " ++ p ++ "-" ++ ln
