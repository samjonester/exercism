module School (
  School
, add
, empty
, sorted
, grade
) where

import qualified Data.Map.Strict as M
import Data.List

type Grade = Int
type Name = String
type School = M.Map Grade [Name]

add :: Grade -> Name -> School -> School
add g name = M.insertWith (++) g [name]

empty :: School
empty = M.empty

sorted :: School -> [(Grade, [Name])]
sorted = sort' . M.toList
  where
    sort' [] = []
    sort' ((g, names):xs) = (g, sort names) : (sort' xs)

grade :: Grade -> School -> [Name]
grade = M.findWithDefault []
