{-# LANGUAGE FlexibleInstances #-}

instance Eq (Maybe a) where
  Nothing == Nothing = True
  (Just a) == (Just b) = a == b
  _ == _ = False

instance Ord (Maybe a) where
  compare Nothing Nothing = EQ
  compare Nothing (Just _) = LT
  compare (Just _) Nothing = GT
  compare (Just a) (Just b) = compare a b

main :: IO ()
main = do
  print (Nothing == Nothing) -- True
  print (Just 1 == Just 1) -- True
  print (Just 1 == Nothing) -- False
  print (Nothing == Just 1) -- False
  print (compare Nothing Nothing) -- EQ
  print (compare Nothing (Just 1)) -- LT
  print (compare (Just 1) Nothing) -- GT
  print (compare (Just 1) (Just 2)) -- LT
  print (compare (Just 2) (Just 1)) -- GT