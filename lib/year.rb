class Year

  attr_accessor :year

  LINE_LENGTH = 62
  HEADER = [
    "      January               February               March",
    "       April                  May                   June",
    "        July                 August              September",
    "      October               November              December"
  ]
  WEEKDAYS = "\nSu Mo Tu We Th Fr Sa\s\sSu Mo Tu We Th Fr Sa\s\sSu Mo Tu We Th Fr Sa"
  BLOCK_LENGTH = 6
  MONTHS_IN_QUARTER = 3
  QUARTERS_IN_YEAR = 4

  def initialize(year)
    @year = year
  end

  def leap?
    if @year % 4 == 0
      if @year % 100 == 0 && @year % 400 != 0
        return false
      end
      return true
    end
    false
  end

  def to_s
    build_year
  end

  private

  def build_year
    year = "#{@year}".center(LINE_LENGTH).rstrip
    year << "\n\n"
    month_count = 0
    QUARTERS_IN_YEAR.times do |quarter|
      year << build_quarter(quarter)
      month_count += MONTHS_IN_QUARTER
    end
    year
  end

  def build_quarter(quarter_count)
    month_block = []
    output = HEADER[quarter_count]
    output << WEEKDAYS
    month_count = quarter_count * MONTHS_IN_QUARTER
    MONTHS_IN_QUARTER.times do |index|
      month_count += 1
      @month = Month.new(month_count, @year)
      month_block << @month.build_month(month_count, @year)
    end
    output << shuffle_quarter(month_block)
  end

  def shuffle_quarter(month_block)
    month1 = month_block[0].split("\n")
    month2 = month_block[1].split("\n")
    month3 = month_block[2].split("\n")
    quarter = "\n"
    0.upto(BLOCK_LENGTH-1) do |index|
      quarter << "#{month1[index]}".ljust(Month::LINE_LENGTH) + "\s\s"
      quarter << "#{month2[index]}".ljust(Month::LINE_LENGTH) + "\s\s"
      quarter << "#{month3[index]}" + "\n"
    end
    quarter
  end

end
