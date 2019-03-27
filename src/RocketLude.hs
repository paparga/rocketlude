{-# LANGUAGE FlexibleContexts #-}
module RocketLude
    ( 
    -- ** Lenses
      module Control.Lens
    -- ** Aeson
    , module Data.Aeson
    -- ** Time.Calendar
    , module Data.Time.Calendar
    -- ** Time.Clock
    , module Data.Time.Clock
    -- ** Data.Tagged
    , module Data.Tagged
    -- ** RIO
    , module RIO
    -- ** Protolude
    , getArgsT 
    , toT
    , toLT
    , toBS
    , toLBS
    , toC
    , module Protolude
    ) where
 
import           Control.Lens ((^.), to, set, over, view)
import           RIO (RIO (..), MonadThrow(..), runRIO, liftRIO)
import           Protolude  hiding (to, getArgs)
import           Data.Aeson ((.:), Value(..), (.:?), (.!=), (.=), ToJSON(..), FromJSON(..))
import           Data.Time.Calendar 
import           Data.Time.Clock (UTCTime (..), getCurrentTime)
import           Data.Tagged (Tagged (..))

import qualified Protolude as PL 
import qualified Data.Text as T
import qualified Data.Text.Lazy as LT 
import qualified Data.ByteString.Lazy as LBS

-- | Same as 'getArgs' but with IO [Text] as output.
getArgsT :: IO [Text]
getArgsT = map T.pack <$> PL.getArgs

-- | Same as 'toS' but converts only to Text
toT :: StringConv a Text => a -> Text
toT = toS

-- | Same as 'toS' but converts only to ByteString
toBS :: StringConv a ByteString => a -> ByteString
toBS = toS

-- | Same as 'toS' but converts only to Lazy Text
toLT :: StringConv a LT.Text => a -> LT.Text
toLT = toS

-- | Same as 'toS' but converts only to Lazy ByteString
toLBS :: StringConv a LBS.ByteString => a -> LBS.ByteString
toLBS = toS

-- | Same as 'toS' but converts only to String
toC :: StringConv a [Char] => a -> [Char]
toC = toS