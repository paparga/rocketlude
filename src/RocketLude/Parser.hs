module RocketLude.Parser 
    ( readInt
    , readInt'
    , readDate
    , readDate'
    ) where

import           Text.Read (readEither)
import           RocketLude
import           RocketLude.Text

-- | Reads Ints from Texts
readInt :: Text -> Maybe Int 
readInt t = case readInt' t of
    Left _  -> Nothing
    Right x -> Just x

-- | Reads ints from texts, returns the int if succesful or the text if failed
readInt' :: Text -> Either Text Int
readInt' t = case readEither $ unpack t of 
    Left y  -> Left $ pack y
    Right z -> Right z

readDate :: Text -> Maybe Day
readDate t = case readDate' t of
    Left _  -> Nothing
    Right x -> Just x

-- | Reads Dates from Text, expects input as ('DD/MM/YYYY')
readDate' :: Text -> Either Text Day
readDate' t = case catMaybes $ readInt <$> split (== '/') t of
    [d, m, y]   -> Right $ fromGregorian (fromIntegral y) m d
    _           -> Left t