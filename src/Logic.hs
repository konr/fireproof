module Logic where

import           Data.Monoid

data FireParams =
  FireParams {
    netWorth     :: Float -- FIXME using newtypes?
  , interestRate :: Float
  , yearlySpend  :: Float
  } deriving (Show)

updateAmount :: FireParams -> FireParams
updateAmount (FireParams netWorth interestRate yearlySpend) =
  (FireParams newWorth interestRate yearlySpend) where
    newWorth = remaining * appreciation
    remaining = netWorth - yearlySpend
    appreciation = (1 + interestRate)
