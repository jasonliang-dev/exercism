module BST
  ( BST
  , bstLeft
  , bstRight
  , bstValue
  , empty
  , fromList
  , insert
  , singleton
  , toList
  )
where

data BST a = Node a (BST a) (BST a) | Nil deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Nil             = Nothing
bstLeft (Node _ left _) = Just left

bstRight :: BST a -> Maybe (BST a)
bstRight Nil              = Nothing
bstRight (Node _ _ right) = Just right

bstValue :: BST a -> Maybe a
bstValue Nil            = Nothing
bstValue (Node val _ _) = Just val

empty :: BST a
empty = Nil

fromList :: Ord a => [a] -> BST a
fromList = foldl (flip insert) empty

insert :: Ord a => a -> BST a -> BST a
insert x Nil = singleton x
insert x (Node val left right) | x <= val  = Node val (insert x left) right
                               | otherwise = Node val left (insert x right)

singleton :: a -> BST a
singleton x = Node x Nil Nil

toList :: BST a -> [a]
toList Nil                   = []
toList (Node val left right) = toList left ++ [val] ++ toList right
