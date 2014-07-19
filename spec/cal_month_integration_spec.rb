RSpec.describe "Cal's full month integration" do
  it "should correctly print July 2017" do
    expected = <<EOS
     July 2017
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS
    actual = `./cal 07 2017`
    actual.should == expected
  end

  it "should correctly print December 2013" do
    expected = <<EOS
   December 2013
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    actual = `./cal 12 2013`
    actual.should == expected
  end

  it "should correctly print August 2013" do
    expected = <<EOS
    August 2013
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31

EOS
    actual = `./cal 08 2013`
    actual.should == expected
  end

  it "should correctly print September 2013" do
    expected = <<EOS
   September 2013
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30

EOS
    actual = `./cal 09 2013`
    actual.should == expected
  end

  it "should correctly print December 2012" do
    expected = <<EOS
   December 2012
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS
    actual = `./cal 12 2012`
    actual.should == expected
  end

  it "should correctly print February 2002" do
    expected = <<EOS
   February 2002
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28

EOS
    actual = `./cal 02 2002`
    actual.should == expected
  end

  it "should correctly print February 2008" do
    expected = <<EOS
   February 2008
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29

EOS
    actual = `./cal 02 2008`
    actual.should == expected
  end

  it "should correctly print February 2015" do
    expected = <<EOS
   February 2015
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28


EOS
    actual = `./cal 02 2015`
    actual.should == expected
  end

  it "should correctly print January 2016" do
    expected = <<EOS
    January 2016
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31
EOS
    actual = `./cal 01 2016`
    actual.should == expected
  end

  it "should correctly print January 2017" do
    expected = <<EOS
    January 2017
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    actual = `./cal 01 2017`
    actual.should == expected
  end

  it "should correctly print February 2000" do
    expected = <<EOS
   February 2000
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29

EOS
    actual = `./cal 02 2000`
    actual.should == expected
  end

  it "should correctly print February 1900" do
    expected = <<EOS
   February 1900
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28

EOS
    actual = `./cal 02 1900`
    actual.should == expected
  end

  it "should return an error message for '16 2016'" do
    expected = ">cal: 16 is not a month number (1..12)\n"
    actual = `./cal 16 2016`
    actual.should == expected
  end

  it "should return an error message for '12 0'" do
    expected = ">cal: 0 is not in range (1800..3000)\n"
    actual = `./cal 12 0`
    actual.should == expected
  end

  it "should return an error message for a month/day/year input" do
    expected = ">usage: cal [month] [year]\n"
    actual = `./cal 01 01 2012`
    actual.should == expected
  end
end
