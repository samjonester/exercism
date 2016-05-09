module LinkedList (
  datum,
  fromList,
  isNil,
  new,
  next,
  nil,
  reverseLinkedList,
  toList
) where

data LinkedList a = NullList | Elem a (LinkedList a)

datum :: LinkedList a -> a
datum NullList = error "Empty List???"
datum (Elem a _) = a

fromList :: [a] -> LinkedList a
fromList [] = NullList
fromList (x:xs) = Elem x $ fromList xs

isNil :: LinkedList a -> Bool
isNil NullList = True
isNil _ = False

new :: a -> LinkedList a -> LinkedList a
new = Elem

next :: LinkedList a -> LinkedList a
next NullList = NullList
next (Elem _ xs) = xs

nil :: LinkedList a
nil = NullList

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = reverse' NullList
  where
    reverse' xs NullList = xs
    reverse' as (Elem b bs) = reverse' (Elem b as) bs


toList :: LinkedList a -> [a]
toList NullList = []
toList (Elem x xs) = x : (toList xs)
