module Triangle (TriangleType(..),
  triangleType) where

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illogical deriving (Eq, Show)

triangleType :: (Integral a) => a -> a -> a -> TriangleType
triangleType x y z = if validTriangle then triangleType' else Illogical
  where
    validTriangle = (x + y > z) && (y + z > x) && (z + x > y)
    triangleType'
      | (x == y) && (x == z)               = Equilateral
      | (x == y) || (x == z) || (y == z)   = Isosceles
      | otherwise                          = Scalene
