{-# LANGUAGE OverloadedStrings #-}

import           Data.Text           as T
import           Railway
import           Test.Hspec
import           Test.QuickCheck
import           Text.Show.Functions

main :: IO ()
main = hspec $ do
    describe "|> Forward application" $ do
        it "simple application" $
            ( 3 |> (+1) ) `shouldBe` 4
        it "compound application" $
            ( 3 |> (*2) |> (+1) ) `shouldBe` 7
        it "multistep application" $
            ( "hello"
                |> T.toUpper
                |> T.tail
                |> T.reverse
                |> T.unpack )
                    `shouldBe` "OLLE"
        it "PROPERTY - unary function application" $
            property prop_unaryForward
        it "PROPERTY - partial application" $
            property prop_partialForward
    describe "<| Backward application" $ do
        it "simple application" $
            ((+ 1) <| 2) `shouldBe` 3
        it "compound application" $
            ( (+1) <| (*2) <| 3 ) `shouldBe` 7
        it "PROPERTY - unary function application" $
            property prop_unaryBackward
        it "PROPERTY - partial application" $
            property prop_partialBackward

prop_unaryBackward :: (String -> Int) -> String -> Bool
prop_unaryBackward f x = (f <| x) == f x

prop_unaryForward :: (String -> Int) -> String -> Bool
prop_unaryForward f x = (x |> f) == f x

prop_partialBackward :: (Int -> Int -> Int) -> Int -> Int -> Bool
prop_partialBackward f x y = (f x <| y) == f x y

prop_partialForward :: (Int -> Int -> Int) -> Int -> Int -> Bool
prop_partialForward f x y = (y |> f x) == f x y
