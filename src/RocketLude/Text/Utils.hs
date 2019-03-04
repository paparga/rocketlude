module RocketLude.Text.Utils 
    ( simplifyText
    , findInText
    ) where

import RocketLude hiding (replace)
import RocketLude.Text hiding (foldl)

simplifyText :: Text -> Text
simplifyText t = toLower $ replace' replacements t

-- | Replaces subTexts with defined subTexts 
replace' 
    :: [(Text,Text)] -- ^ list of subText pairs to make replacement (toReplace,replacement)
    -> Text  -- ^ Text to apply the transformation
    -> Text
replace' c t = foldl (\acc (x,y) -> replace x y acc) t c

findInText :: Text -> Text -> Bool
findInText x y = isInfixOf (simplifyText x) $ simplifyText y

replacements :: [(Text,Text)]
replacements =
    [ ("\n"  , "" )
    , (" usd", "" )
    , (" clp", "" )
    , ("\193", "a")
    , ("\201", "e")
    , ("\205", "i")
    , ("\209", "n")
    , ("\211", "o")
    , ("\218", "u")
    , ("\225", "a")
    , ("\233", "e")
    , ("\237", "i")
    , ("\241", "n")
    , ("\243", "o")
    , ("\250", "u")

    ]
-- toSearch :: Text -> Text -> Bool
-- toSearch x = (T.isInfixOf x) . T.toUpper . toStandard_ . toSpanish

-- toStandard_ :: Text -> Text
-- toStandard_ = T.replace "-" ""
--         . T.replace " " ""
--         . T.replace "/" ""

-- toSpanish :: Text -> Text
-- toSpanish = T.replace "\n" ""
--         . T.replace " usd" ""
--         . T.replace " clp" ""
--         . T.toLower 
--         . T.replace "\193" "a"
--         . T.replace "\201" "e"
--         . T.replace "\205" "i"
--         . T.replace "\209" "n"
--         . T.replace "\211" "o"
--         . T.replace "\218" "u"
--         . T.replace "\225" "a"
--         . T.replace "\233" "e"
--         . T.replace "\237" "i"
--         . T.replace "\241" "n"
--         . T.replace "\243" "o"
--         . T.replace "\250" "u"

