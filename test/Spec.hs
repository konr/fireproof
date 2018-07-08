import           Test.Hspec

import qualified Adapter
import qualified Logic
import qualified Model

sampleYear = Model.Year 2018 0.03 0.08
samplePortfolio = Model.Portfolio 1000.0 0 0.06
sampleParams = Model.FireParams sampleYear samplePortfolio

adapterTests :: IO ()
adapterTests = hspec $ do
  describe "yearNetWorth adapter" $ do
    it "should output the year and the net worth" $ do
      (Adapter.yearNetWorth sampleParams) `shouldBe` "[2018] Net Worth: $1000.0\t Spend: $60.0"
  describe "parameters adapter" $ do
    it "should output all the parameters" $ do
      (Adapter.parameters sampleParams) `shouldBe` [" - Start year: 2018"
                                                   ," - Inflation: 3.0e-2"
                                                   ," - Interest rate: 8.0e-2"
                                                   ," - Start Net Worth: 1000.0"
                                                   ," - Yearly Spend: 6.0e-2"]

logicTests :: IO ()
logicTests = hspec $ do
  describe "updateAmount" $ do
    it "should update portfolio amount, given interest and inflation" $ do
      (Logic.updateAmount sampleYear samplePortfolio) `shouldBe` (Model.Portfolio 987.00006 0 0.06)
  describe "updateYear" $ do
    it "should increment year" $ do
      (Logic.updateYear sampleYear) `shouldBe` (Model.Year 2019 0.03 0.08)
  describe "updateFireParams" $ do
    it "should increment year and portfolio amount" $ do
      (Logic.updateFireParams sampleParams) `shouldBe`
        (Model.FireParams (Model.Year 2019 0.03 0.08) (Model.Portfolio 987.00006 0 0.06))


main :: IO ()
main = do
  adapterTests
  logicTests
