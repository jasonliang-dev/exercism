module LinkedList
  ( LinkedList
  , datum
  , fromList
  , isNil
  , new
  , next
  , nil
  , reverseLinkedList
  , toList
  )
where

data LinkedList a = Nil | Item a (LinkedList a) deriving (Eq, Show)

datum :: LinkedList a -> a
datum Nil        = error "datum from empty list"
datum (Item x _) = x

fromList :: [a] -> LinkedList a
fromList []       = Nil
fromList (x : xs) = Item x $ fromList xs

isNil :: LinkedList a -> Bool
isNil Nil        = True
isNil (Item _ _) = False

new :: a -> LinkedList a -> LinkedList a
new = Item

next :: LinkedList a -> LinkedList a
next Nil         = error "next from empty list"
next (Item _ xs) = xs

nil :: LinkedList a
nil = Nil

reverseLinkedList' :: LinkedList a -> LinkedList a -> LinkedList a
reverseLinkedList' acc Nil         = acc
reverseLinkedList' acc (Item x xs) = reverseLinkedList' (Item x acc) xs

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = reverseLinkedList' Nil

toList :: LinkedList a -> [a]
toList Nil         = []
toList (Item x xs) = x : toList xs
