module Main where

import           Control.Monad.IO.Class
import           Logic
import           Model

main :: IO ()
main = do
  putStrLn $ "Hello! We are going to simulate whether you can FIRE or not."
  mapM_ (putStrLn . show) $ projections
