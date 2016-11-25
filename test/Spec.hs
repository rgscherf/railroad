{-# LANGUAGE OverloadedStrings #-}

import           Data.Text  as T
import           Railway
import           Test.Hspec

main :: IO ()
main = hspec $ do
    describe "Backward application" $ do
        it "does simple application" $ do
            ( (+1) <| 3 )
                `shouldBe` 4
        it "does compound simple application" $ do
            ( (+1) <| (*2) <| 3 )
                `shouldBe` 7
    describe "Backward application" $ do
        it "does simple application" $ do
            ( 3 |> (+1) )
                `shouldBe` 4
        it "does compound simple application" $ do
            ( 3 |> (*2) |> (+1) )
                `shouldBe` 7
        it "does a compound string operation" $ do
            ( "hello"
                |> T.toUpper
                |> T.tail
                |> T.reverse
                |> T.unpack )
                    `shouldBe` "OLLE"
