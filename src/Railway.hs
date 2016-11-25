module Railway
    ( (|>)
    , (<|)
    ) where

infixl 0 |>
(|>) :: a -> (a -> b) -> b
(|>) x f = f x

infixr 0 <|
(<|) :: (a -> b) -> a -> b
(<|) f a = f a
