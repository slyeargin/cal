RSpec.describe "Cal's full year integration" do
  it "should correctly print 2014" do
    expected = `cal 2014`
    actual = `./cal 2014`
    actual.should == expected
  end
  it "should correctly print 2012" do
    expected = `cal 2012`
    actual = `./cal 2012`
    actual.should == expected
  end
  it "should correctly print 1995" do
    expected = `cal 1995`
    actual = `./cal 1995`
    actual.should == expected
  end
  it "should correctly print 1982" do
    expected = `cal 1982`
    actual = `./cal 1982`
    actual.should == expected
  end
  it "should correctly print 2013" do
    expected = `cal 2013`
    actual = `./cal 2013`
    actual.should == expected
  end
end
