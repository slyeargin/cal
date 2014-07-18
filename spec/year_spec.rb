require_relative '../lib/year'

RSpec.describe Year do
  context ".leap?" do
    it "returns true for 2000" do
      year = Year.new(2000)
      year.leap?.should == true
    end
    it "returns false for 1900" do
      year = Year.new(1900)
      year.leap?.should == false
    end
    it "returns false for 1997" do
      year = Year.new(1997)
      year.leap?.should == false
    end
  end
end
