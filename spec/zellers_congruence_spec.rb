require_relative '../lib/month'
require_relative '../lib/zellers_congruence'

RSpec.describe ZellersCongruence do
  context ".calculate" do
    it "should return 0" do
      ZellersCongruence.calculate(12,2012).should == 0
    end
    it "should return 5" do
      ZellersCongruence.calculate(11,2012).should == 5
    end
    it "should return 1" do
      ZellersCongruence.calculate(1,2012).should == 1
    end
  end
end
