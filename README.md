# Railway

Railway brings the `<|` and `|>` function application operators to Haskell.

`<|` is equivalent to `$`. Railway provides the complementary `|>` operator to make data processing operations more legible and more like a Unix pipeline. Witness:

```haskell
{-# LANGUAGE OverloadedStrings #-}

import Data.Text as T
import Railway

example :: String
example = "Hello"
            |> T.toUpper
            |> T.tail
            |> T.reverse
            |> T.unpack

main :: IO ()
main = example == "OLLE"
        |> show -- True
```

Railway comes with a full test suite and documentation.

## Prior art

`<|`/`|>` are ubiquitous in F# and Elm, where they're known as pipes.

## Why 'Railway'?

I misremembered the topic of [this Scott Wlaschin post](http://fsharpforfunandprofit.com/posts/recipe-part2/).
