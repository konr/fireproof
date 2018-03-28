module Logic where

import           Data.Monoid

data Portfolio =
  Portfolio {
    netWorth     :: Float -- FIXME using newtypes?
  , yearlySpend  :: Float
  } deriving (Show)

data Year =
  Year {
    yearNumber :: Int
  , inflation :: Float
  , interestRate :: Float
  } deriving (Show)

updateAmount :: Year -> Portfolio -> Portfolio
updateAmount (Year _ _ interestRate) (Portfolio netWorth yearlySpend) =
  (Portfolio newWorth yearlySpend) where
    newWorth = remaining * appreciation
    remaining = netWorth - yearlySpend
    appreciation = (1 + interestRate)
