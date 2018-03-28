module Model where

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

data FireParams = FireParams Year Portfolio deriving (Show)
