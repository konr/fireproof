module Main where

import           Control.Monad.IO.Class
import           Logic
import           Model
import           Adapter

main :: IO ()
main = do
  putStrLn $ "Will you be able to FIRE?"
  mapM_ putStrLn (parameters firão)
  putStrLn ""
  putStrLn $ "Projections:" 
  mapM_ (putStrLn . yearNetWorth) $ projections
