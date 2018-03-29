module Logic where

import           Data.Monoid
import           Model

updateAmount :: Year -> Portfolio -> Portfolio
updateAmount (Year _ inflation interestRate) (Portfolio netWorth yearlySpend) =
  (Portfolio newWorth yearlySpend) where
    newWorth = remaining * appreciation
    remaining = netWorth - yearlySpend
    appreciation = (1 + interestRate - inflation)

updateYear :: Year -> Year
updateYear (Year number inflation interest) = Year (number + 1) inflation interest

updateFireParams :: FireParams -> FireParams
updateFireParams (FireParams year portfolio) =
  FireParams (updateYear year) (updateAmount year portfolio)
