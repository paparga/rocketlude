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
    -- ** RIO
    , module RIO
    -- ** Protolude
    , getArgsT 
    , module Protolude
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
getArgsT :: IO [Text]
getArgsT = map T.pack <$> PL.getArgs