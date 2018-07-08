{-# LANGUAGE DeriveDataTypeable #-}
module Main where

import           Control.Monad.IO.Class
import           System.Console.CmdArgs

import           Adapter
import           Logic
import qualified Model                  as Model


data CLIArgs = CLIArgs {netWorth   :: Float
                       , spend     :: Float
                       , save      :: Float
                       , years     :: Int
                       , interest  :: Float
                       , startYear :: Int
                       , inflation :: Float}
             deriving (Show, Data, Typeable)

defaults = CLIArgs{netWorth = def &= help "Your current net worth"
                , years = 10 &= help "Simulation years"
                , spend = def &= help "Current yearly spend"
                , save = def &= help "How much you save per year"
                , interest = def &= help "Yearly interest rate"
                , startYear = def &= help "Start year"
                , inflation = def &= help "Yearly inflation"}

cliToFireParams  :: CLIArgs -> Model.FireParams
cliToFireParams cli =
  Model.FireParams (Model.Year (startYear cli) (inflation cli) (interest cli))
                   (Model.Portfolio (netWorth cli) (save cli) (spend cli))

main :: IO ()
main = do
  putStrLn $ "Will you be able to FIRE?"
  cliArgs <- cmdArgs defaults
  let fire = cliToFireParams cliArgs
  mapM_ putStrLn (parameters fire)
  putStrLn ""
  putStrLn $ "Projections:"
  mapM_ (putStrLn . yearNetWorth) $ take (years cliArgs) $ iterate updateFireParams fire
