module Adapter where

import Model
import Logic

prettyTuple :: (String, String) -> String
prettyTuple (k,v) = " - " ++ k ++ ": " ++ v

yearNetWorth :: FireParams -> String
yearNetWorth (FireParams year portfolio) = "[" ++ (show $ yearNumber year) ++ "] "
                                           ++ "Net Worth: $" ++ (show $ netWorth portfolio)
                                           ++ "\t Spend: $" ++  (show $ portfolioSpend portfolio)

parameters :: FireParams -> [String]
parameters (FireParams year portfolio) =
  fmap prettyTuple
  [("Start year", show (yearNumber year)),
   ("Inflation", show (inflation year)),
   ("Interest rate", show (interestRate year)),
   ("Start Net Worth", show (netWorth portfolio)),
   ("Yearly Spend", show (yearlySpend portfolio))]
