import           Test.Hspec

import qualified Adapter
import qualified Logic
import           Model

sampleParams = Model.FireParams (Model.Year 2018 0.03 0.08) (Model.Portfolio 1000.0 60.0)

main :: IO ()
main = hspec $ do
  describe "yearNetWorth adapter" $ do
    it "should output the year and the net worth" $ do
      (Adapter.yearNetWorth sampleParams) `shouldBe` "[2018] Net Worth: $1000.0"
  describe "parameters adapter" $ do
    it "should output all the parameters" $ do
      (Adapter.parameters sampleParams) `shouldBe` [" - Start year: 2018"
                                                   ," - Inflation: 3.0e-2"
                                                   ," - Interest rate: 8.0e-2"
                                                   ," - Start Net Worth: 1000.0"
                                                   ," - Yearly Spend: 60.0"]
