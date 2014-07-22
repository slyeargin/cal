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
    quarter_count = 0
    month_count = 0
    while quarter_count < 4
      year << build_quarter(quarter_count, month_count)
      quarter_count += 1
      month_count += 3
    end
    year
  end

  def build_quarter(quarter_count, month_count)
    month_block = []
    end_of_quarter = month_count + 3
    while month_count < end_of_quarter
      if month_count == 0 || month_count%3 === 0
        quarter = HEADER[quarter_count]
        quarter << WEEKDAYS
      end
      month_count += 1
      @month = Month.new(month_count, @year)
      month_block << @month.build_month(month_count, @year)
    end
    quarter << shuffle_quarter(month_block)
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
