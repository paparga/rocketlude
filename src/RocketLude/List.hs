module RocketLude.List 
    ( module Data.List
    , chunksOf
    ) where

import           RocketLude
import           Data.List

chunksOf :: Int -> [a] -> [[a]]
chunksOf k = go
  where go t = case splitAt k t of
                (a,b) 
                    | null a      -> []
                    | otherwise   -> a : go b