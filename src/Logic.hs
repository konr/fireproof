module Logic where

import           Data.Monoid
import           Model


portfolioSpend :: Portfolio -> Float  -- FIX
portfolioSpend (Portfolio netWorth save yearlySpend) = totalSpend netWorth yearlySpend

totalSpend :: Float -> Float -> Float
totalSpend a b = a * b

updateAmount :: Year -> Portfolio -> Portfolio
updateAmount (Year _ inflation interestRate) (Portfolio netWorth save yearlySpend) =
  (Portfolio newWorth save yearlySpend) where
    newWorth = remaining * appreciation + save
    remaining = netWorth - (totalSpend netWorth yearlySpend)
    appreciation = (1 + interestRate - inflation)

updateYear :: Year -> Year
updateYear (Year number inflation interest) = Year (number + 1) inflation interest

updateFireParams :: FireParams -> FireParams
updateFireParams (FireParams year portfolio) =
  FireParams (updateYear year) (updateAmount year portfolio)
