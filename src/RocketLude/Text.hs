module RocketLude.Text 
    ( module Data.Text
    , formatFloatN
    , dotify
    ) where

import           Data.Text

import           RocketLude hiding (reverse, intercalate, replace)
import           Numeric (showFFloat)

-- | Formats a floating point number as text, with thousands separators and everything
formatFloatN :: Int -> Float -> Text
formatFloatN numOfDecimals floatNum = showFFloat (Just numOfDecimals) floatNum ""
    & pack
    & replace "." ","
    & dotify


-- | Puts thousands separators on text of a number (which can be non-integer)
dotify :: Text -> Text
dotify x =
    let (start, end) = breakOn "," x
    in  reverse (intercalate "." $ chunksOf 3 $ reverse start) <> end