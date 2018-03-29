module Model where

data Portfolio =
  Portfolio {
    netWorth     :: Float -- FIXME using newtypes?
  , yearlySpend  :: Float
  } deriving (Show, Eq)

data Year =
  Year {
    yearNumber :: Int
  , inflation :: Float
  , interestRate :: Float
  } deriving (Show, Eq)

data FireParams = FireParams Year Portfolio deriving (Show, Eq)
