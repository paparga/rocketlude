{-# LANGUAGE FlexibleContexts   #-}
module RocketLude.Concurrent 
    ( batchConcurrent
    , liftedBatchConcurrent
    ) where

import           RocketLude
import qualified Control.Concurrent.Async as A
import qualified Control.Concurrent.Async.Lifted as AL
import           Control.Monad.Trans.Control (MonadBaseControl(..))

liftedBatchConcurrent :: MonadBaseControl IO m => Int -> (a -> m b) -> [a] -> m [b]
liftedBatchConcurrent batchSize fn ts =
    let tss = splitByInt batchSize [] ts
        inner = AL.mapConcurrently fn
    in concat <$> traverse inner tss

batchConcurrent :: Int -> (a -> IO b) -> [a] -> IO [b]
batchConcurrent batchSize fn ts =
    let tss = splitByInt batchSize [] ts
        inner = A.mapConcurrently fn
    in concat <$> traverse inner tss


splitByInt :: Int -> [[a]] -> [a] -> [[a]]
splitByInt x acum ys = case ys of
    [] -> acum
    _ ->
        let curr = take x ys
            restList = drop x ys
        in splitByInt x (acum <> [curr]) restList



