{- | * Parsing utilities for common Types -}

module RocketLude.Parser 
    ( readInt
    , readInt'
    , readDate
    , readDate'
    ) where

import           Text.Read (readEither)
import           RocketLude
import           RocketLude.Text

-- | Reads Double from Texts. Maybe version of 'readDouble''
readDouble :: Text -> Maybe Double 
readDouble t = case readDouble' t of
    Left _  -> Nothing
    Right x -> Just x

-- | Reads Double from texts, returns the Double if succesful or the text if failed
readDouble' :: Text -> Either Text Double
readDouble' t = case readEither $ unpack t of 
    Left y  -> Left $ pack y
    Right z -> Right z

-- | Reads Ints from Texts. Maybe version of 'readInt''
readInt :: Text -> Maybe Int 
readInt t = case readInt' t of
    Left _  -> Nothing
    Right x -> Just x

-- | Reads ints from texts, returns the int if succesful or the text if failed
readInt' :: Text -> Either Text Int
readInt' t = case readEither $ unpack t of 
    Left y  -> Left $ pack y
    Right z -> Right z

-- | Reads Dates from Texts. Maybe version of 'readDate''
readDate :: Text -> Maybe Day
readDate t = case readDate' t of
    Left _  -> Nothing
    Right x -> Just x

-- | Reads Dates from Text, expects input as ('DD/MM/YYYY')
readDate' :: Text -> Either Text Day
readDate' t = case catMaybes $ readInt <$> split (== '/') t of
    [d, m, y]   -> Right $ fromGregorian (fromIntegral y) m d
    _           -> Left t