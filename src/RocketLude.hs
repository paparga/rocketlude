module RocketLude
    ( module Data.Aeson
    , module Control.Lens
    , module Protolude
    , module RIO
    , module Data.Time.Calendar
    , module Data.Time.Clock
    , getArgs
    ) where

import           Control.Lens ((^.), to, set, over, view)
import           RIO (RIO (..), MonadThrow(..), runRIO, liftRIO)
import           Protolude  hiding (to, getArgs)
import           Data.Aeson ((.:), Value(..), (.:?), (.!=), (.=))
import           Data.Time.Calendar 
import           Data.Time.Clock (UTCTime (..), getCurrentTime)

import qualified Protolude as PL 
import qualified Data.Text as T

-- | Same as 'getArgs' but with IO [Text] as output.
getArgs :: IO [Text]
getArgs = map T.pack <$> PL.getArgs