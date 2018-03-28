module Main where

import           Control.Monad.IO.Class
import           Logic

main :: IO ()
main = do
  putStrLn $ "Hello! We are going to simulate whether you can FIRE or not"
  putStrLn ""
  mapM_ (putStrLn . show) $ take 10 $ iterate updateAmount f


